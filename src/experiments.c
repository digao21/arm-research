#include <stdlib.h>
#include <stdio.h>

#include "experiments.h"
#include "probe.h"
#include "util.h"
#include "analise.h"

typedef const int Optimization;
#define NO_OPT        0
#define BLOCKED_OPT   1
#define CIRCQUEUE_OPT 2
#define OBLIVIOUS_OPT 3
#define TIMESKEW_OPT  4
#define CPU_OPT       5


/* PRIVATE METHODS DECLARATION */
void warmUp();
void solveStencil(Optimization OPTIMIZATION,
                  double *A0,   double *Anext, const int TIMESTEPS,
                  const int NX, const int NY,  const int NZ,
                  const int TX, const int TY,  const int TZ);

void dinamTimestepExp(Optimization OPTIMIZATION, AnaliseType ANALISE_TYPE,
                      const int X_MIN, const int X_MAX, const int X_DX,
                      const int NY,    const int NZ,    const int MIN_TIME,
                      const int TX,    const int TY,    const int TZ);

void constTimestepExp(Optimization OPTIMIZATION, AnaliseType ANALISE_TYPE,
                      const int X_MIN, const int X_MAX, const int X_DX,
                      const int NY,    const int NZ,    const int TIMESTEPS,
		      const int TX,    const int TY,    const int TZ);

void constTimestepExp(Optimization OPTIMIZATION, AnaliseType ANALISE_TYPE,
                      const int X_MIN, const int X_MAX, const int X_DX,
                      const int NY,    const int NZ,    const int TIMESTEPS,
		      const int TX,    const int TY,    const int TZ);


/* PUBLIC METHODS */

void performanceExperiment() {
  warmUp();
  constTimestepExp(CPU_OPT, IPC, 32+2, 1024+2, 32, 256+2, 256+2, 5, 512, 256, 0);
}

void blockAnalise() {
  warmUp();
  int dy,k;
  for(k = 1; k<=8; k*=2) {
    for(dy = 2; dy<=256; dy*=2) {
      printf("dx = %d; dy = %d\n", k*dy, dy);
      constTimestepExp(BLOCKED_OPT, CACHE_HIT, 2048, 2048, 32, 256, 256, 5, k*dy, dy, 0);
    }
  }
}

/*
 * Solves the stencil with the correct optimization.
 */
void solveStencil(Optimization OPTIMIZATION,
                  double *A0,   double *Anext, const int TIMESTEPS,
                  const int NX, const int NY,  const int NZ,
                  const int TX, const int TY,  const int TZ) {
  switch (OPTIMIZATION) {
    case NO_OPT:        StencilProbe(A0, Anext, NX, NY, NZ, TIMESTEPS); break;
    case BLOCKED_OPT:   StencilProbeBlocked(A0, Anext, NX, NY, NZ, TX, TY, TZ, TIMESTEPS); break;
    case CIRCQUEUE_OPT: StencilProbeCircqueue(A0, Anext, NX, NY, NZ, TX, TY, TZ, TIMESTEPS); break;
    case OBLIVIOUS_OPT: StencilProbeOblivious(A0, Anext, NX, NY, NZ, TX, TY, TZ, TIMESTEPS); break;
    case TIMESKEW_OPT:  StencilProbeTimeskew(A0, Anext, NX, NY, NZ, TX, TY, TZ, TIMESTEPS); break;
    case CPU_OPT:       StencilProbeCPU(A0, Anext, NX, NY, NZ, TIMESTEPS); break;

    default: printf("[execStencil.func] - Undefined optimization\n"); exit(1);
  };
}

/*
 * Warm up the machine doing unnecessary math.
 */
void warmUp() {
  dinamTimestepExp(NO_OPT, NO_ANALISE, 16, 16, 16, 16, 16, 10, 0, 0, 0);
}

/*
 * Creates an stencil with fix y and z dimensions and iterate through
 * x dimension solving the stencil and printing the result. It has 
 * a dinamic time steps in a way the time of each experiment is 
 * greater or equal to MIN_TIME.
 */
void dinamTimestepExp(Optimization OPTIMIZATION, AnaliseType ANALISE_TYPE,
                      const int X_MIN, const int X_MAX, const int X_DX,
                      const int NY,    const int NZ,    const int MIN_TIME,
                      const int TX,    const int TY,    const int TZ) {
  #define STOP_LIMIT 30
  int stop = 0;
  double time;
  int timesteps = 5;

  int nx;
  double *A0    = (double*)malloc(sizeof(double)*X_MAX*NY*NZ);
  double *Anext = (double*)malloc(sizeof(double)*X_MAX*NY*NZ);

  AnaliseData *analiseData = initAnalise(ANALISE_TYPE);

  for (nx=X_MIN; nx <= X_MAX; nx+=X_DX) {
    StencilInit(nx,NY,NZ,A0);
    StencilInit(nx,NY,NZ,Anext);
     
    clear_cache();
 
    do {
      startAnalise( analiseData );
      solveStencil(OPTIMIZATION, A0, Anext, timesteps, nx, NY, NZ, TX, TY, TZ);
      finishAnalise( analiseData );

      time = getTime(analiseData);
      timesteps = 1.2*MIN_TIME*(timesteps / time);
      stop++;
    } while(time < MIN_TIME && stop < STOP_LIMIT);

    if (time < MIN_TIME) {
      exit(1);
    }

    printResult(analiseData, nx, NY, NZ, TX, TY, TZ);
  }

  free(A0);
  free(Anext);
  releaseAnaliseData(analiseData);
}

/*
 * Creates an stencil with fix y and z dimensions and iterate through
 * x dimension solving the stencil, with a fixed time steps, and printing the result.
 */
void constTimestepExp(Optimization OPTIMIZATION, AnaliseType ANALISE_TYPE,
                      const int X_MIN, const int X_MAX, const int X_DX,
                      const int NY,    const int NZ,    const int TIMESTEPS,
		      const int TX,    const int TY,    const int TZ) {
  int nx;
  double *A0    = (double*)malloc(sizeof(double)*X_MAX*NY*NZ);
  double *Anext = (double*)malloc(sizeof(double)*X_MAX*NY*NZ);

  AnaliseData *analiseData = initAnalise(ANALISE_TYPE);

  for (nx=X_MIN; nx <= X_MAX; nx+=X_DX) {
    StencilInit(nx,NY,NZ,A0);
    StencilInit(nx,NY,NZ,Anext);

    clear_cache();

    startAnalise( analiseData );
    solveStencil(OPTIMIZATION, A0, Anext, TIMESTEPS, nx, NY, NZ, TX, TY, TZ);
    finishAnalise( analiseData );

    printResult(analiseData, nx, NY, NZ, TX, TY, TZ);
  }

  free(A0);
  free(Anext);
  releaseAnaliseData(analiseData);
}
