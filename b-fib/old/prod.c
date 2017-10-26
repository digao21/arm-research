#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <arm_neon.h>

#define EPSILON 0.1
//V_SIZE is divisible for 32 and 40
#define V_SIZE 128
#define N_MAX 8192
#define G (1024*1024*1024)

double wall_time(void) {
  struct timeval tv;
  struct timezone tz;

  gettimeofday(&tv, &tz);
  return(tv.tv_sec + tv.tv_usec/1000000.0);
}

void bFib(double* b, double* out, int a0, int a1) {
  int i, j;
  double res, aux;

  for(i=0; i<V_SIZE; i++) {
    res = a0;
    aux = a1;

    for(j=0; j<N_MAX; j+=2) {
      res  = res  + b[i]*aux;
      aux = aux + b[i]*res;
    }

    out[i] = res;
  }
}

void bFib_uj4(double* b, double* out, int a0, int a1) {
  int i, j;
  float64x2_t res, aux, bv;

  for(i=0; i<V_SIZE; i+=4) {
    res[0] = res[1] = res[2] = res[3] = a0; 
    aux[0] = aux[1] = aux[2] = aux[3] = a1;
    bv[0] = b[i];
    bv[1] = b[i+1];
    bv[2] = b[i+2];
    bv[3] = b[i+3];

    for(j=0; j<N_MAX; j+=2) {
      res = vmlaq_f64(res,bv,aux); 
      aux = vmlaq_f64(aux,bv,res); 
    }

    out[i] = res[0];
    out[i+1] = res[1];
    out[i+2] = res[2];
    out[i+3] = res[3];
  }
}

void bFib_uj8(double* b, double* out, int a0, int a1) {
  int i, j;
  float64x2_t res0, aux0, b0;
  float64x2_t res1, aux1, b1;

  for(i=0; i<V_SIZE; i+=8) {
    res0[0] = res0[1] = res0[2] = res0[3] = a0; 
    res1[0] = res1[1] = res1[2] = res1[3] = a0; 

    aux0[0] = aux0[1] = aux0[2] = aux0[3] = a1;
    aux1[0] = aux1[1] = aux1[2] = aux1[3] = a1;

    b0[0] = b[i];
    b0[1] = b[i+1];
    b0[2] = b[i+2];
    b0[3] = b[i+3];
    b1[0] = b[i+4];
    b1[1] = b[i+5];
    b1[2] = b[i+6];
    b1[3] = b[i+7];

    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,b0,aux0); 
      res1 = vmlaq_f64(res1,b1,aux1); 

      aux0 = vmlaq_f64(aux0,b0,res0); 
      aux1 = vmlaq_f64(aux1,b1,res1); 
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res0[2];
    out[i+3] = res0[3];
    out[i+4] = res1[0];
    out[i+5] = res1[1];
    out[i+6] = res1[2];
    out[i+7] = res1[3];
  }
}

void bFib_uj16(double* b, double* out, int a0, int a1) {
  int i, j;
  float64x2_t res0, aux0, b0;
  float64x2_t res1, aux1, b1;
  float64x2_t res2, aux2, b2;
  float64x2_t res3, aux3, b3;

  for(i=0; i<V_SIZE; i+=16) {
    res0[0] = res0[1] = res0[2] = res0[3] = a0; 
    res1[0] = res1[1] = res1[2] = res1[3] = a0; 
    res2[0] = res2[1] = res2[2] = res2[3] = a0; 
    res3[0] = res3[1] = res3[2] = res3[3] = a0; 

    aux0[0] = aux0[1] = aux0[2] = aux0[3] = a1;
    aux1[0] = aux1[1] = aux1[2] = aux1[3] = a1;
    aux2[0] = aux2[1] = aux2[2] = aux2[3] = a1;
    aux3[0] = aux3[1] = aux3[2] = aux3[3] = a1;

    b0[0] = b[i];
    b0[1] = b[i+1];
    b0[2] = b[i+2];
    b0[3] = b[i+3];
    b1[0] = b[i+4];
    b1[1] = b[i+5];
    b1[2] = b[i+6];
    b1[3] = b[i+7];
    b2[0] = b[i+8];
    b2[1] = b[i+9];
    b2[2] = b[i+10];
    b2[3] = b[i+11];
    b3[0] = b[i+12];
    b3[1] = b[i+13];
    b3[2] = b[i+14];
    b3[3] = b[i+15];

    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,b0,aux0); 
      res1 = vmlaq_f64(res1,b1,aux1); 
      res2 = vmlaq_f64(res2,b2,aux2); 
      res3 = vmlaq_f64(res3,b3,aux3); 

      aux0 = vmlaq_f64(aux0,b0,res0); 
      aux1 = vmlaq_f64(aux1,b1,res1); 
      aux2 = vmlaq_f64(aux2,b2,res2); 
      aux3 = vmlaq_f64(aux3,b3,res3); 
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res0[2];
    out[i+3] = res0[3];
    out[i+4] = res1[0];
    out[i+5] = res1[1];
    out[i+6] = res1[2];
    out[i+7] = res1[3];
    out[i+8] = res2[0];
    out[i+9] = res2[1];
    out[i+10] = res2[2];
    out[i+11] = res2[3];
    out[i+12] = res3[0];
    out[i+13] = res3[1];
    out[i+14] = res3[2];
    out[i+15] = res3[3];
  }
}

void bFib_uj32(double* b, double* out, int a0, int a1) {
  int i, j;
  float64x2_t res0, aux0, b0;
  float64x2_t res1, aux1, b1;
  float64x2_t res2, aux2, b2;
  float64x2_t res3, aux3, b3;
  float64x2_t res4, aux4, b4;
  float64x2_t res5, aux5, b5;
  float64x2_t res6, aux6, b6;
  float64x2_t res7, aux7, b7;

  for(i=0; i<V_SIZE; i+=32) {
    res0[0] = res0[1] = res0[2] = res0[3] = a0; 
    res1[0] = res1[1] = res1[2] = res1[3] = a0; 
    res2[0] = res2[1] = res2[2] = res2[3] = a0; 
    res3[0] = res3[1] = res3[2] = res3[3] = a0; 
    res4[0] = res4[1] = res4[2] = res4[3] = a0; 
    res5[0] = res5[1] = res5[2] = res5[3] = a0; 
    res6[0] = res6[1] = res6[2] = res6[3] = a0; 
    res7[0] = res7[1] = res7[2] = res7[3] = a0; 

    aux0[0] = aux0[1] = aux0[2] = aux0[3] = a1;
    aux1[0] = aux1[1] = aux1[2] = aux1[3] = a1;
    aux2[0] = aux2[1] = aux2[2] = aux2[3] = a1;
    aux3[0] = aux3[1] = aux3[2] = aux3[3] = a1;
    aux4[0] = aux4[1] = aux4[2] = aux4[3] = a1;
    aux5[0] = aux5[1] = aux5[2] = aux5[3] = a1;
    aux6[0] = aux6[1] = aux6[2] = aux6[3] = a1;
    aux7[0] = aux7[1] = aux7[2] = aux7[3] = a1;

    b0[0] = b[i];
    b0[1] = b[i+1];
    b0[2] = b[i+2];
    b0[3] = b[i+3];
    b1[0] = b[i+4];
    b1[1] = b[i+5];
    b1[2] = b[i+6];
    b1[3] = b[i+7];
    b2[0] = b[i+8];
    b2[1] = b[i+9];
    b2[2] = b[i+10];
    b2[3] = b[i+11];
    b3[0] = b[i+12];
    b3[1] = b[i+13];
    b3[2] = b[i+14];
    b3[3] = b[i+15];
    b4[0] = b[i+16];
    b4[1] = b[i+17];
    b4[2] = b[i+18];
    b4[3] = b[i+19];
    b5[0] = b[i+20];
    b5[1] = b[i+21];
    b5[2] = b[i+22];
    b5[3] = b[i+23];
    b6[0] = b[i+24];
    b6[1] = b[i+25];
    b6[2] = b[i+26];
    b6[3] = b[i+27];
    b7[0] = b[i+28];
    b7[1] = b[i+29];
    b7[2] = b[i+30];
    b7[3] = b[i+31];


    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,b0,aux0); 
      res1 = vmlaq_f64(res1,b1,aux1); 
      res2 = vmlaq_f64(res2,b2,aux2); 
      res3 = vmlaq_f64(res3,b3,aux3); 
      res4 = vmlaq_f64(res4,b4,aux4); 
      res5 = vmlaq_f64(res5,b5,aux5); 
      res6 = vmlaq_f64(res6,b6,aux6); 
      res7 = vmlaq_f64(res7,b7,aux7); 

      aux0 = vmlaq_f64(aux0,b0,res0); 
      aux1 = vmlaq_f64(aux1,b1,res1); 
      aux2 = vmlaq_f64(aux2,b2,res2); 
      aux3 = vmlaq_f64(aux3,b3,res3); 
      aux4 = vmlaq_f64(aux4,b4,res4); 
      aux5 = vmlaq_f64(aux5,b5,res5); 
      aux6 = vmlaq_f64(aux6,b6,res6); 
      aux7 = vmlaq_f64(aux7,b7,res7); 
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res0[2];
    out[i+3] = res0[3];
    out[i+4] = res1[0];
    out[i+5] = res1[1];
    out[i+6] = res1[2];
    out[i+7] = res1[3];
    out[i+8] = res2[0];
    out[i+9] = res2[1];
    out[i+10] = res2[2];
    out[i+11] = res2[3];
    out[i+12] = res3[0];
    out[i+13] = res3[1];
    out[i+14] = res3[2];
    out[i+15] = res3[3];
    out[i+16] = res4[0];
    out[i+17] = res4[1];
    out[i+18] = res4[2];
    out[i+19] = res4[3];
    out[i+20] = res5[0];
    out[i+21] = res5[1];
    out[i+22] = res5[2];
    out[i+23] = res5[3];
    out[i+24] = res6[0];
    out[i+25] = res6[1];
    out[i+26] = res6[2];
    out[i+27] = res6[3];
    out[i+28] = res7[0];
    out[i+29] = res7[1];
    out[i+30] = res7[2];
    out[i+31] = res7[3];
  }
}

void bFib_uj32_x4(double* b, double* out, int a0, int a1) {
  int i, j;
  float64x2_t res0, aux0, b0;
  float64x2_t res1, aux1, b1;
  float64x2_t res2, aux2, b2;
  float64x2_t res3, aux3, b3;
  float64x2_t res4, aux4, b4;
  float64x2_t res5, aux5, b5;
  float64x2_t res6, aux6, b6;
  float64x2_t res7, aux7, b7;

  for(i=0; i<V_SIZE; i+=32) {
    res0[0] = res0[1] = res0[2] = res0[3] = a0; 
    res1[0] = res1[1] = res1[2] = res1[3] = a0; 
    res2[0] = res2[1] = res2[2] = res2[3] = a0; 
    res3[0] = res3[1] = res3[2] = res3[3] = a0; 
    res4[0] = res4[1] = res4[2] = res4[3] = a0; 
    res5[0] = res5[1] = res5[2] = res5[3] = a0; 
    res6[0] = res6[1] = res6[2] = res6[3] = a0; 
    res7[0] = res7[1] = res7[2] = res7[3] = a0; 

    aux0[0] = aux0[1] = aux0[2] = aux0[3] = a1;
    aux1[0] = aux1[1] = aux1[2] = aux1[3] = a1;
    aux2[0] = aux2[1] = aux2[2] = aux2[3] = a1;
    aux3[0] = aux3[1] = aux3[2] = aux3[3] = a1;
    aux4[0] = aux4[1] = aux4[2] = aux4[3] = a1;
    aux5[0] = aux5[1] = aux5[2] = aux5[3] = a1;
    aux6[0] = aux6[1] = aux6[2] = aux6[3] = a1;
    aux7[0] = aux7[1] = aux7[2] = aux7[3] = a1;

    b0[0] = b[i];
    b0[1] = b[i+1];
    b0[2] = b[i+2];
    b0[3] = b[i+3];
    b1[0] = b[i+4];
    b1[1] = b[i+5];
    b1[2] = b[i+6];
    b1[3] = b[i+7];
    b2[0] = b[i+8];
    b2[1] = b[i+9];
    b2[2] = b[i+10];
    b2[3] = b[i+11];
    b3[0] = b[i+12];
    b3[1] = b[i+13];
    b3[2] = b[i+14];
    b3[3] = b[i+15];
    b4[0] = b[i+16];
    b4[1] = b[i+17];
    b4[2] = b[i+18];
    b4[3] = b[i+19];
    b5[0] = b[i+20];
    b5[1] = b[i+21];
    b5[2] = b[i+22];
    b5[3] = b[i+23];
    b6[0] = b[i+24];
    b6[1] = b[i+25];
    b6[2] = b[i+26];
    b6[3] = b[i+27];
    b7[0] = b[i+28];
    b7[1] = b[i+29];
    b7[2] = b[i+30];
    b7[3] = b[i+31];


    for(j=0; j<N_MAX; j+=4) {
      res0 = vmlaq_f64(res0,b0,aux0); 
      res1 = vmlaq_f64(res1,b1,aux1); 
      res2 = vmlaq_f64(res2,b2,aux2); 
      res3 = vmlaq_f64(res3,b3,aux3); 
      res4 = vmlaq_f64(res4,b4,aux4); 
      res5 = vmlaq_f64(res5,b5,aux5); 
      res6 = vmlaq_f64(res6,b6,aux6); 
      res7 = vmlaq_f64(res7,b7,aux7); 

      aux0 = vmlaq_f64(aux0,b0,res0); 
      aux1 = vmlaq_f64(aux1,b1,res1); 
      aux2 = vmlaq_f64(aux2,b2,res2); 
      aux3 = vmlaq_f64(aux3,b3,res3); 
      aux4 = vmlaq_f64(aux4,b4,res4); 
      aux5 = vmlaq_f64(aux5,b5,res5); 
      aux6 = vmlaq_f64(aux6,b6,res6); 
      aux7 = vmlaq_f64(aux7,b7,res7); 


      res0 = vmlaq_f64(res0,b0,aux0); 
      res1 = vmlaq_f64(res1,b1,aux1); 
      res2 = vmlaq_f64(res2,b2,aux2); 
      res3 = vmlaq_f64(res3,b3,aux3); 
      res4 = vmlaq_f64(res4,b4,aux4); 
      res5 = vmlaq_f64(res5,b5,aux5); 
      res6 = vmlaq_f64(res6,b6,aux6); 
      res7 = vmlaq_f64(res7,b7,aux7); 

      aux0 = vmlaq_f64(aux0,b0,res0); 
      aux1 = vmlaq_f64(aux1,b1,res1); 
      aux2 = vmlaq_f64(aux2,b2,res2); 
      aux3 = vmlaq_f64(aux3,b3,res3); 
      aux4 = vmlaq_f64(aux4,b4,res4); 
      aux5 = vmlaq_f64(aux5,b5,res5); 
      aux6 = vmlaq_f64(aux6,b6,res6); 
      aux7 = vmlaq_f64(aux7,b7,res7);
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res0[2];
    out[i+3] = res0[3];
    out[i+4] = res1[0];
    out[i+5] = res1[1];
    out[i+6] = res1[2];
    out[i+7] = res1[3];
    out[i+8] = res2[0];
    out[i+9] = res2[1];
    out[i+10] = res2[2];
    out[i+11] = res2[3];
    out[i+12] = res3[0];
    out[i+13] = res3[1];
    out[i+14] = res3[2];
    out[i+15] = res3[3];
    out[i+16] = res4[0];
    out[i+17] = res4[1];
    out[i+18] = res4[2];
    out[i+19] = res4[3];
    out[i+20] = res5[0];
    out[i+21] = res5[1];
    out[i+22] = res5[2];
    out[i+23] = res5[3];
    out[i+24] = res6[0];
    out[i+25] = res6[1];
    out[i+26] = res6[2];
    out[i+27] = res6[3];
    out[i+28] = res7[0];
    out[i+29] = res7[1];
    out[i+30] = res7[2];
    out[i+31] = res7[3];
  }
}

void initVector(double* v, double val) {
  int i;
  for(i=0; i<V_SIZE; i++) {
    v[i] = val;
  }
}

int verify(double* res, double* answ) {
  int i;

  for(i=0; i<V_SIZE; i++) {
    if (res[i] - answ[i] < -EPSILON || EPSILON < res[i] - answ[i]) {
      printf("[ERROR] ");
      return;
    }
  }

  printf("[OK] ");
}

int main() {
  long flop;
  double flops;
  double t0, t1, timeComp;
  double *b, *res, *answ;

  b = (double*)malloc(V_SIZE*sizeof(double));
  res = (double*)malloc(V_SIZE*sizeof(double));
  answ = (double*)malloc(V_SIZE*sizeof(double));

  initVector(b,0.5);

  flop = 2*V_SIZE*N_MAX;

  t0 = wall_time();
  bFib(b,answ, 0.5, 0.5);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(answ,answ);

  flops = flop / timeComp;
  printf("normal   perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj4(b,res, 0.5, 0.5);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll4  perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj8(b,res, 0.5, 0.5);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll8  perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj16(b,res, 0.5, 0.5);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll16 perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj32(b,res, 0.5, 0.5);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll32 perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj32_x4(b,res, 0.5, 0.5);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll32_x4 perf = %f (gflops)\n", flops/G);



  return 0;
}
