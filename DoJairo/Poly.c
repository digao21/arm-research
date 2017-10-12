#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <arm_neon.h>
#define DEGREE 8192

double wall_time(void) {
  struct timeval tv;
  struct timezone tz;

  gettimeofday(&tv, &tz);
  return(tv.tv_sec + tv.tv_usec/1000000.0);
}

void PolyU0(float *a, float * b, 
	    float c1, float c2,
	    long size) {
  register float alpha01;
  register float beta;
  register float res01;
  long ind;
  int mono;

  beta=c2;
  for (ind=0; ind<size; ind++) {
    res01=c1;   
    alpha01=a[ind];
#pragma unroll 32
    for (mono=0; mono<DEGREE; mono++) {
      res01=res01*alpha01+beta;
    }
    b[ind] = res01;
  }
}

void PolyU2(float *a, float *b, 
	    float c1, float c2,
	    long size) {
  register float alpha01, alpha02;
  register float beta;
  register float res01, res02;
  long ind;
  int mono;

  beta=c2;
  for (ind=0; ind<size; ind+=2) {
    res01=c1;   
    res02=c1;
    alpha01=a[ind];
    alpha02=a[ind+1];
#pragma unroll 32
    for (mono=0; mono<DEGREE; mono++) {
      res01=res01*alpha01+beta;
      res02=res02*alpha02+beta;
    }
    b[ind] = res01;
    b[ind+1] = res02;
  }
}

void PolyU4(float *a, float *b, 
	    float c1, float c2,
	    long size) {
  register float32x4_t res, alpha, beta;
  long ind;
  int mono;

  beta[0] = c2;
  beta[1] = c2;
  beta[2] = c2;
  beta[3] = c2;
  for (ind=0; ind<size; ind+=4) {
    res[0] = c1;
    res[1] = c1;
    res[2] = c1;
    res[3] = c1;

    alpha[0] = a[ind];
    alpha[1] = a[ind+1];
    alpha[2] = a[ind+2];
    alpha[3] = a[ind+3];
#pragma unroll 32
    for (mono=0; mono<DEGREE; mono++) {
      res = vmlaq_f32(res,alpha,beta);
    }
    b[ind]   = res[0];
    b[ind+1] = res[1];
    b[ind+2] = res[2];
    b[ind+3] = res[3];
  }
}


void PolyU8(float *a, float *b, 
	    float c1, float c2,
	    long size) {
  register float32x4_t beta;
  register float32x4_t res0, res1;
  register float32x4_t alpha0, alpha1;
  long ind;
  int mono;

  beta[0] = c2;
  beta[1] = c2;
  beta[2] = c2;
  beta[3] = c2;
  for (ind=0; ind<size; ind+=8) {
    res0[0]=c1;   
    res0[1]=c1;
    res0[2]=c1;
    res0[3]=c1;
    res1[0]=c1;
    res1[1]=c1;
    res1[2]=c1;
    res1[3]=c1;
    alpha0[0]=a[ind];
    alpha0[1]=a[ind+1];
    alpha0[2]=a[ind+2];
    alpha0[3]=a[ind+3];
    alpha1[0]=a[ind+4];
    alpha1[1]=a[ind+5];
    alpha1[2]=a[ind+6];
    alpha1[3]=a[ind+7];
#pragma unroll 32
    for (mono=0; mono<DEGREE; mono++) {
      res0 =  vmlaq_f32(res0,alpha0,beta);
      res1 =  vmlaq_f32(res1,alpha1,beta);
    }
    b[ind]   = res0[0];
    b[ind+1] = res0[1];
    b[ind+2] = res0[2];
    b[ind+3] = res0[3];
    b[ind+4] = res1[0];
    b[ind+5] = res1[1];
    b[ind+6] = res1[2];
    b[ind+7] = res1[3];
  }
}


void PolyU16(float *a, float *b, 
	     float c1, float c2,
	     long size) {
  register float32x4_t beta;
  register float32x4_t res0, res1, res2, res3;
  register float32x4_t alpha0, alpha1, alpha2, alpha3;
  long ind;
  int mono;

  beta[0] = c2;
  beta[1] = c2;
  beta[2] = c2;
  beta[3] = c2;
  for (ind=0; ind<size; ind+=16) {
    res0[0]=c1;   
    res0[1]=c1;
    res0[2]=c1;
    res0[3]=c1;
    res1[0]=c1;
    res1[1]=c1;
    res1[2]=c1;
    res1[3]=c1;
    res2[0]=c1;
    res2[1]=c1;
    res2[2]=c1;
    res2[3]=c1;
    res3[0]=c1;
    res3[1]=c1;
    res3[2]=c1;
    res3[3]=c1;

    alpha0[0]=a[ind];
    alpha0[1]=a[ind+1];
    alpha0[2]=a[ind+2];
    alpha0[3]=a[ind+3];
    alpha1[0]=a[ind+4];
    alpha1[1]=a[ind+5];
    alpha1[2]=a[ind+6];
    alpha1[3]=a[ind+7];
    alpha2[0]=a[ind+8];
    alpha2[1]=a[ind+9];
    alpha2[2]=a[ind+10];
    alpha2[3]=a[ind+11];
    alpha3[0]=a[ind+12];
    alpha3[1]=a[ind+13];
    alpha3[2]=a[ind+14];
    alpha3[3]=a[ind+15];
#pragma unroll 32
    for (mono=0; mono<DEGREE; mono++) {
      res0 =  vmlaq_f32(res0,alpha0,beta);
      res1 =  vmlaq_f32(res1,alpha1,beta);
      res2 =  vmlaq_f32(res2,alpha2,beta);
      res3 =  vmlaq_f32(res3,alpha3,beta);
    }
    b[ind]   = res0[0];
    b[ind+1] = res0[1];
    b[ind+2] = res0[2];
    b[ind+3] = res0[3];
    b[ind+4] = res1[0];
    b[ind+5] = res1[1];
    b[ind+6] = res1[2];
    b[ind+7] = res1[3];
    b[ind+8] = res2[0];
    b[ind+9] = res2[1];
    b[ind+10] = res2[2];
    b[ind+11] = res2[3];
    b[ind+12] = res3[0];
    b[ind+13] = res3[1];
    b[ind+14] = res3[2];
    b[ind+15] = res3[3];
  }
}


int main(int argc, char* argv[]) {
#define ALPHA 1.0
#define BETA 1.0
#define TAM_ARRAY 256*1024

  float *h_a, *h_b;
  long i;
  double t0, t1, timeComp;

  long arrayElements = TAM_ARRAY;
  long arrayBytes = arrayElements * sizeof(float);
  float gBytes, gFlops;
  int nbrBlocks = 1;

  h_a = (float *)malloc(arrayBytes);
  h_b = (float *)malloc(arrayBytes);

  for (i=0; i<arrayElements; i++) {
     h_a[i]=1.0;
     h_b[i]=0.0;
  }

  t0 = wall_time();
  PolyU0(h_a, h_b, ALPHA, BETA, arrayElements);
  t1 = wall_time();
  timeComp = t1-t0;
  gBytes=2.0*((float)arrayElements)*sizeof(float)*1.0e-9/timeComp;
  gFlops=2.0*((float)arrayElements)*DEGREE*1.0e-9/timeComp;
  printf("unroll=%d, tamanho=%ld, tempo=%f, gBytes=%f, gFlops=%f\n", 
         0, arrayElements, timeComp, gBytes, gFlops);

  t0 = wall_time();
  PolyU2(h_a, h_b, ALPHA, BETA, arrayElements);
  t1 = wall_time();
  timeComp = t1-t0;
  gBytes=2.0*((float)arrayElements)*sizeof(float)*1.0e-9/timeComp;
  gFlops=2.0*((float)arrayElements)*DEGREE*1.0e-9/timeComp;
  printf("unroll=%d, tamanho=%ld, tempo=%f, gBytes=%f, gFlops=%f\n", 
         2, arrayElements, timeComp, gBytes, gFlops);

  t0 = wall_time();
  PolyU4(h_a, h_b, ALPHA, BETA, arrayElements);
  t1 = wall_time();
  timeComp = t1-t0;
  gBytes=2.0*((float)arrayElements)*sizeof(float)*1.0e-9/timeComp;
  gFlops=2.0*((float)arrayElements)*DEGREE*1.0e-9/timeComp;
  printf("unroll=%d, tamanho=%ld, tempo=%f, gBytes=%f, gFlops=%f\n", 
         4, arrayElements, timeComp, gBytes, gFlops);

  t0 = wall_time();
  PolyU8(h_a, h_b, ALPHA, BETA, arrayElements);
  t1 = wall_time();
  timeComp = t1-t0;
  gBytes=2.0*((float)arrayElements)*sizeof(float)*1.0e-9/timeComp;
  gFlops=2.0*((float)arrayElements)*DEGREE*1.0e-9/timeComp;
  printf("unroll=%d, tamanho=%ld, tempo=%f, gBytes=%f, gFlops=%f\n", 
         8, arrayElements, timeComp, gBytes, gFlops);

  t0 = wall_time();
  PolyU16(h_a, h_b, ALPHA, BETA, arrayElements);
  t1 = wall_time();
  timeComp = t1-t0;
  gBytes=2.0*((float)arrayElements)*sizeof(float)*1.0e-9/timeComp;
  gFlops=2.0*((float)arrayElements)*DEGREE*1.0e-9/timeComp;
  printf("unroll=%d, tamanho=%ld, tempo=%f, gBytes=%f, gFlops=%f\n", 
         16, arrayElements, timeComp, gBytes, gFlops);

  free(h_a);
  free(h_b);
 
  return 0;
}
