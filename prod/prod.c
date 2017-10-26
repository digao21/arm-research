#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <arm_neon.h>


#define V_SIZE 8192
#define EPSILON 0.001
#define G (1024*1024*1024)

double wall_time(void) {
  struct timeval tv;
  struct timezone tz;

  gettimeofday(&tv, &tz);
  return(tv.tv_sec + tv.tv_usec/1000000.0);
}

double prodInterno(double* v0, double* v1) {
  float64x2_t res, a, b;
  int i;

  res[0] = v0[0]*v1[0];
  res[1] = v0[1]*v1[1];
  for(i=2; i<V_SIZE; i+=2) {
    a[0] = v0[i]; a[1] = v0[i+1];
    b[0] = v1[i]; b[1] = v1[i+1];

    res = vmlaq_f64(res, a, b); 
  }

  return res[0]+res[1];
}

void initVector(double* v, double val) {
  int i;
  for(i=0; i<V_SIZE; i++) {
    v[i] = val;
  }
}

int verify(double res, double answ) {
  double dif = res - answ;
  return -EPSILON < dif && dif < EPSILON;
}

int main() {
  long flop;
  double res, answ, flops;
  double t0, t1, timeComp;
  double *v0, *v1;

  v0 = (double*)malloc(V_SIZE*sizeof(double));
  v1 = (double*)malloc(V_SIZE*sizeof(double));

  initVector(v0,2.1);
  initVector(v1,3.2);

  t0 = wall_time();
  res = prodInterno(v0,v1);
  t1 = wall_time();
  timeComp = t1-t0;

  answ = 2.1*3.2*V_SIZE;
  if (verify(res, answ))
    printf("[OK] ");
  else
    printf("[ERROR] ");

  flop = 2*V_SIZE - 1;
  flops = flop / timeComp;

  printf("perf = %f (gflops)\n", flops/G);

  return 0;
}
