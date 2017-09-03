#ifndef _ANALISE_
#define _ANALISE_

#include "cycle.h"

#define MAX_EVENTS 8

typedef int AnaliseType;
#define CACHE_HIT 0
#define IPC 1
#define NO_ANALISE 2

typedef struct AnaliseData AnaliseData;
struct AnaliseData {
  AnaliseType analiseType;

  int numEvents;
  long_long* eventCounts;  // Papi event counts

  ticks t1, t2;            // Initial and final time
  double spt;              // Seconds per tick - time = spt * (t2 - t1)

  double dryRunTime;       // Useless extra time in experiment
};

AnaliseData* initAnalise(AnaliseType);

void startAnalise(AnaliseData* analiseData);

void finishAnalise(AnaliseData* analiseData);

void printResult(AnaliseData* analiseData, int nx, int ny, int nz, int tx, int ty, int tz);

void releaseAnaliseData();

double getTime(AnaliseData*);

#endif
