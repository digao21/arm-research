#include <stdlib.h>
#include <stdio.h>
#include <papi.h>

#include "probe.h"
#include "cycle.h"
#include "util.h"
#include "analise.h"

void handleError(int code, char *msg) {
  if (code < PAPI_OK) {
    printf("[%s] - %s\n", msg, PAPI_strerror(code));
    exit(1);
  }
}

AnaliseData* initAnalise(AnaliseType analiseType) {
  AnaliseData* ret = (AnaliseData*) malloc(sizeof(AnaliseData));

  int numEvents;
  int *events;

  ret->analiseType = analiseType;
  switch (analiseType) {
    case CACHE_HIT:
      numEvents = 5;
      events = (int*) malloc(sizeof(int)*numEvents);
      events[0] = PAPI_L1_DCM;
      events[1] = PAPI_LD_INS;
      events[2] = PAPI_SR_INS;
      events[3] = PAPI_L2_DCM;
      events[4] = PAPI_L2_DCH;
      break;

    case IPC:
      numEvents = 2;
      events = (int*) malloc(sizeof(int)*numEvents);
      events[0] = PAPI_TOT_INS;
      events[1] = PAPI_TOT_CYC;
      break;

    case NO_ANALISE:
      numEvents = 1;
      events = (int*) malloc(sizeof(int)*numEvents);
      events[0] = PAPI_TOT_INS;
      break;

    default:
      printf("[initAnalise] - Undefined analise");
      exit(1);
  };

  // Testing papi usability
  int papiCounters;

  handleError( PAPI_library_init(PAPI_VER_CURRENT) , "initAnalise.library_init");
  handleError( papiCounters = PAPI_num_counters()  , "initAnalise.num_couters");

  if (papiCounters < numEvents) {
    printf("[initAnalise] - Insufficient counters\n");
    exit(1);
  }

  handleError( PAPI_start_counters(events, numEvents) , "initAnalise.start_counters");

  // Setting AnaliseData parameters
  ret->numEvents = numEvents;
  ret->spt = seconds_per_tick();
  ret->eventCounts = (long_long*)malloc(numEvents*sizeof(long_long));

  // Get extra time
  ticks t1, t2, timesteps = 5;
  double *A0=(double*)malloc(sizeof(double)*2*2*2);
  double *Anext=(double*)malloc(sizeof(double)*2*2*2);

  t1 = getticks();
  handleError( PAPI_read_counters(ret->eventCounts, numEvents), "initAnalise.read_counters1");
  StencilProbe(A0, Anext, 2, 2, 2, timesteps);
  handleError( PAPI_read_counters(ret->eventCounts, numEvents), "initAnalise.read_counters2");
  t2 = getticks();

  ret->dryRunTime = ret->spt * elapsed(t2,t1);

  free(A0);
  free(Anext);

  return ret;
}

void startAnalise(AnaliseData* analiseData) {
  analiseData->t1 = getticks();
  handleError( PAPI_read_counters(analiseData->eventCounts, analiseData->numEvents), "startAnalise");
}

void finishAnalise(AnaliseData* analiseData) {
  handleError( PAPI_read_counters(analiseData->eventCounts, analiseData->numEvents), "finishAnalise");
  analiseData->t2 = getticks();
}

void printResult(AnaliseData* analiseData, int nx, int ny, int nz, int tx, int ty, int tz) {
  #define G 1024*1024*1024
  long size = nx*ny*nz;
  long flo = 13*(nx-2)*(ny-2)*(nz-2);
  double time = getTime(analiseData);
  double gflops = (flo / time) / (G);

  // CACHE_HIT variables
  long_long dcml1; // Data cache miss l1
  long_long dcal1; // Data cache access l1
  long_long dcml2; // Data cache miss l2
  long_long dchl2; // Data cache hit l2

  // IPC variables
  long_long inst; // Total instructions
  long_long cycl; // Total cycles

  switch(analiseData->analiseType) {
    case CACHE_HIT:
      dcml1 = analiseData->eventCounts[0]; 
      dcal1 = analiseData->eventCounts[1] + analiseData->eventCounts[2]; 
      dcml2 = analiseData->eventCounts[3]; 
      dchl2 = analiseData->eventCounts[4]; 

      double cacheHitsL1 = (dcal1 - dcml1)/(double)dcal1;
      double cacheHitsL2 = dchl2/(double)(dcml2 + dchl2);
      printf("%ld;%g;%g;%g;%g\n", size, time, gflops, cacheHitsL1, cacheHitsL2);
      break;

    case IPC:
      inst = analiseData->eventCounts[0]; 
      cycl = analiseData->eventCounts[1]; 
      double ipc = (double)inst / cycl;

      printf("%ld;%g;%g;%g\n", size, time, gflops, ipc);
      break;

    case NO_ANALISE:
      break;

    default:
      printf("[printResult] - undefined analise type\n");
      break;
  };
}

void releaseAnaliseData(AnaliseData* analiseData) {
  handleError( PAPI_stop_counters(analiseData->eventCounts, analiseData->numEvents), "releaseAnaliseData");
  free(analiseData->eventCounts);
}

double getTime(AnaliseData* analiseData) {
  ticks t1 = analiseData->t1;
  ticks t2 = analiseData->t2;

  double spt = analiseData->spt;
  double dryRunTime = analiseData->dryRunTime;

  return spt * elapsed(t2, t1) - dryRunTime;
}
