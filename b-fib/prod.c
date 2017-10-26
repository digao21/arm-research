#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <arm_neon.h>

#define EPSILON 0.1
#define V_SIZE (16*15)
#define N_MAX 8192
#define WARM_TIME 1
#define STOP 100
#define G (1024*1024*1024)

double wall_time(void) {
  struct timeval tv;
  struct timezone tz;

  gettimeofday(&tv, &tz);
  return(tv.tv_sec + tv.tv_usec/1000000.0);
}

void bFib(double *a0, double *a1, double *out, double b) {
  int i, j;
  double res, aux;

  for(i=0; i<V_SIZE; i++) {
    res = a0[i];
    aux = a1[i];

    for(j=0; j<N_MAX; j+=2) {
      res  = res  + b*aux;
      aux = aux + b*res;
    }

    out[i] = res;
  }
}

void bFib_uj2(double *a0, double *a1, double *out, double b) {
  int i, j;
  float64x2_t bv;
  float64x2_t res0, aux0;

  bv[0] = b;
  bv[1] = b;
  for(i=0; i<V_SIZE; i+=2) {
    res0[0] = a0[i];
    res0[1] = a0[i+1];

    aux0[0] = a1[i];
    aux0[1] = a1[i+1];

    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,bv,aux0);
      aux0 = vmlaq_f64(aux0,bv,res0);
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
  }
}

void bFib_uj4(double *a0, double *a1, double *out, double b) {
  int i, j;
  float64x2_t bv;
  float64x2_t res0, aux0;
  float64x2_t res1, aux1;

  bv[0] = b;
  bv[1] = b;
  for(i=0; i<V_SIZE; i+=4) {
    res0[0] = a0[i];
    res0[1] = a0[i+1];
    res1[0] = a0[i+2];
    res1[1] = a0[i+3];

    aux0[0] = a1[i];
    aux0[1] = a1[i+1];
    aux1[0] = a1[i+2];
    aux1[1] = a1[i+3];

    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,bv,aux0);
      res1 = vmlaq_f64(res1,bv,aux1);

      aux0 = vmlaq_f64(aux0,bv,res0);
      aux1 = vmlaq_f64(aux1,bv,res1);
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res1[0];
    out[i+3] = res1[1];
  }
}

void bFib_uj8(double *a0, double *a1, double *out, double b) {
  int i, j;
  float64x2_t bv;
  float64x2_t res0, aux0;
  float64x2_t res1, aux1;
  float64x2_t res2, aux2;
  float64x2_t res3, aux3;

  bv[0] = b;
  bv[1] = b;
  for(i=0; i<V_SIZE; i+=8) {
    res0[0] = a0[i];
    res0[1] = a0[i+1];
    res1[0] = a0[i+2];
    res1[1] = a0[i+3];
    res2[0] = a0[i+4];
    res2[1] = a0[i+5];
    res3[0] = a0[i+6];
    res3[1] = a0[i+7];

    aux0[0] = a1[i];
    aux0[1] = a1[i+1];
    aux1[0] = a1[i+2];
    aux1[1] = a1[i+3];
    aux2[0] = a1[i+4];
    aux2[1] = a1[i+5];
    aux3[0] = a1[i+6];
    aux3[1] = a1[i+7];

    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,bv,aux0);
      res1 = vmlaq_f64(res1,bv,aux1);
      res2 = vmlaq_f64(res2,bv,aux2);
      res3 = vmlaq_f64(res3,bv,aux3);

      aux0 = vmlaq_f64(aux0,bv,res0);
      aux1 = vmlaq_f64(aux1,bv,res1);
      aux2 = vmlaq_f64(aux2,bv,res2);
      aux3 = vmlaq_f64(aux3,bv,res3);
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res1[0];
    out[i+3] = res1[1];
    out[i+4] = res2[0];
    out[i+5] = res2[1];
    out[i+6] = res3[0];
    out[i+7] = res3[1];
  }
}

void bFib_uj16(double *a0, double *a1, double *out, double b) {
  int i, j;
  float64x2_t bv;
  float64x2_t res0, aux0;
  float64x2_t res1, aux1;
  float64x2_t res2, aux2;
  float64x2_t res3, aux3;
  float64x2_t res4, aux4;
  float64x2_t res5, aux5;
  float64x2_t res6, aux6;
  float64x2_t res7, aux7;

  bv[0] = b;
  bv[1] = b;
  for(i=0; i<V_SIZE; i+=16) {
    res0[0] = a0[i];
    res0[1] = a0[i+1];
    res1[0] = a0[i+2];
    res1[1] = a0[i+3];
    res2[0] = a0[i+4];
    res2[1] = a0[i+5];
    res3[0] = a0[i+6];
    res3[1] = a0[i+7];
    res4[0] = a0[i+8];
    res4[1] = a0[i+9];
    res5[0] = a0[i+10];
    res5[1] = a0[i+11];
    res6[0] = a0[i+12];
    res6[1] = a0[i+13];
    res7[0] = a0[i+14];
    res7[1] = a0[i+15];

    aux0[0] = a1[i];
    aux0[1] = a1[i+1];
    aux1[0] = a1[i+2];
    aux1[1] = a1[i+3];
    aux2[0] = a1[i+4];
    aux2[1] = a1[i+5];
    aux3[0] = a1[i+6];
    aux3[1] = a1[i+7];
    aux4[0] = a1[i+8];
    aux4[1] = a1[i+9];
    aux5[0] = a1[i+10];
    aux5[1] = a1[i+11];
    aux6[0] = a1[i+12];
    aux6[1] = a1[i+13];
    aux7[0] = a1[i+14];
    aux7[1] = a1[i+15];

    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,bv,aux0);
      res1 = vmlaq_f64(res1,bv,aux1);
      res2 = vmlaq_f64(res2,bv,aux2);
      res3 = vmlaq_f64(res3,bv,aux3);
      res4 = vmlaq_f64(res4,bv,aux4);
      res5 = vmlaq_f64(res5,bv,aux5);
      res6 = vmlaq_f64(res6,bv,aux6);
      res7 = vmlaq_f64(res7,bv,aux7);

      aux0 = vmlaq_f64(aux0,bv,res0);
      aux1 = vmlaq_f64(aux1,bv,res1);
      aux2 = vmlaq_f64(aux2,bv,res2);
      aux3 = vmlaq_f64(aux3,bv,res3);
      aux4 = vmlaq_f64(aux4,bv,res4);
      aux5 = vmlaq_f64(aux5,bv,res5);
      aux6 = vmlaq_f64(aux6,bv,res6);
      aux7 = vmlaq_f64(aux7,bv,res7);
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res1[0];
    out[i+3] = res1[1];
    out[i+4] = res2[0];
    out[i+5] = res2[1];
    out[i+6] = res3[0];
    out[i+7] = res3[1];
    out[i+8] = res4[0];
    out[i+9] = res4[1];
    out[i+10] = res5[0];
    out[i+11] = res5[1];
    out[i+12] = res6[0];
    out[i+13] = res6[1];
    out[i+14] = res7[0];
    out[i+15] = res7[1];
  }
}

void bFib_uj30(double *a0, double *a1, double *out, double b) {
  int i, j;
  float64x2_t bv;
  float64x2_t res0, aux0;
  float64x2_t res1, aux1;
  float64x2_t res2, aux2;
  float64x2_t res3, aux3;
  float64x2_t res4, aux4;
  float64x2_t res5, aux5;
  float64x2_t res6, aux6;
  float64x2_t res7, aux7;
  float64x2_t res8, aux8;
  float64x2_t res9, aux9;
  float64x2_t res10, aux10;
  float64x2_t res11, aux11;
  float64x2_t res12, aux12;
  float64x2_t res13, aux13;
  float64x2_t res14, aux14;

  bv[0] = b;
  bv[1] = b;
  for(i=0; i<V_SIZE; i+=30) {
    res0[0] = a0[i];
    res0[1] = a0[i+1];
    res1[0] = a0[i+2];
    res1[1] = a0[i+3];
    res2[0] = a0[i+4];
    res2[1] = a0[i+5];
    res3[0] = a0[i+6];
    res3[1] = a0[i+7];
    res4[0] = a0[i+8];
    res4[1] = a0[i+9];
    res5[0] = a0[i+10];
    res5[1] = a0[i+11];
    res6[0] = a0[i+12];
    res6[1] = a0[i+13];
    res7[0] = a0[i+14];
    res7[1] = a0[i+15];
    res8[0] = a0[i+16];
    res8[1] = a0[i+17];
    res9[0] = a0[i+18];
    res9[1] = a0[i+19];
    res10[0] = a0[i+20];
    res10[1] = a0[i+21];
    res11[0] = a0[i+22];
    res11[1] = a0[i+23];
    res12[0] = a0[i+24];
    res12[1] = a0[i+25];
    res13[0] = a0[i+26];
    res13[1] = a0[i+27];
    res14[0] = a0[i+28];
    res14[1] = a0[i+29];

    aux0[0] = a1[i];
    aux0[1] = a1[i+1];
    aux1[0] = a1[i+2];
    aux1[1] = a1[i+3];
    aux2[0] = a1[i+4];
    aux2[1] = a1[i+5];
    aux3[0] = a1[i+6];
    aux3[1] = a1[i+7];
    aux4[0] = a1[i+8];
    aux4[1] = a1[i+9];
    aux5[0] = a1[i+10];
    aux5[1] = a1[i+11];
    aux6[0] = a1[i+12];
    aux6[1] = a1[i+13];
    aux7[0] = a1[i+14];
    aux7[1] = a1[i+15];
    aux8[0] = a1[i+16];
    aux8[1] = a1[i+17];
    aux9[0] = a1[i+18];
    aux9[1] = a1[i+19];
    aux10[0] = a1[i+20];
    aux10[1] = a1[i+21];
    aux11[0] = a1[i+22];
    aux11[1] = a1[i+23];
    aux12[0] = a1[i+24];
    aux12[1] = a1[i+25];
    aux13[0] = a1[i+26];
    aux13[1] = a1[i+27];
    aux14[0] = a1[i+28];
    aux14[1] = a1[i+29];

    for(j=0; j<N_MAX; j+=2) {
      res0 = vmlaq_f64(res0,bv,aux0);
      res1 = vmlaq_f64(res1,bv,aux1);
      res2 = vmlaq_f64(res2,bv,aux2);
      res3 = vmlaq_f64(res3,bv,aux3);
      res4 = vmlaq_f64(res4,bv,aux4);
      res5 = vmlaq_f64(res5,bv,aux5);
      res6 = vmlaq_f64(res6,bv,aux6);
      res7 = vmlaq_f64(res7,bv,aux7);
      res8 = vmlaq_f64(res8,bv,aux8);
      res9 = vmlaq_f64(res9,bv,aux9);
      res10 = vmlaq_f64(res10,bv,aux10);
      res11 = vmlaq_f64(res11,bv,aux11);
      res12 = vmlaq_f64(res12,bv,aux12);
      res13 = vmlaq_f64(res13,bv,aux13);
      res14 = vmlaq_f64(res14,bv,aux14);

      aux0 = vmlaq_f64(aux0,bv,res0);
      aux1 = vmlaq_f64(aux1,bv,res1);
      aux2 = vmlaq_f64(aux2,bv,res2);
      aux3 = vmlaq_f64(aux3,bv,res3);
      aux4 = vmlaq_f64(aux4,bv,res4);
      aux5 = vmlaq_f64(aux5,bv,res5);
      aux6 = vmlaq_f64(aux6,bv,res6);
      aux7 = vmlaq_f64(aux7,bv,res7);
      aux8 = vmlaq_f64(aux8,bv,res8);
      aux9 = vmlaq_f64(aux9,bv,res9);
      aux10 = vmlaq_f64(aux10,bv,res10);
      aux11 = vmlaq_f64(aux11,bv,res11);
      aux12 = vmlaq_f64(aux12,bv,res12);
      aux13 = vmlaq_f64(aux13,bv,res13);
      aux14 = vmlaq_f64(aux14,bv,res14);
    }

    out[i] = res0[0];
    out[i+1] = res0[1];
    out[i+2] = res1[0];
    out[i+3] = res1[1];
    out[i+4] = res2[0];
    out[i+5] = res2[1];
    out[i+6] = res3[0];
    out[i+7] = res3[1];
    out[i+8] = res4[0];
    out[i+9] = res4[1];
    out[i+10] = res5[0];
    out[i+11] = res5[1];
    out[i+12] = res6[0];
    out[i+13] = res6[1];
    out[i+14] = res7[0];
    out[i+15] = res7[1];
    out[i+16] = res8[0];
    out[i+17] = res8[1];
    out[i+18] = res9[0];
    out[i+19] = res9[1];
    out[i+20] = res10[0];
    out[i+21] = res10[1];
    out[i+22] = res11[0];
    out[i+23] = res11[1];
    out[i+24] = res12[0];
    out[i+25] = res12[1];
    out[i+26] = res13[0];
    out[i+27] = res13[1];
    out[i+28] = res14[0];
    out[i+29] = res14[1];
  }
}

double cheat(double b) {
  int i, j;
  double res = 0.0;
  float64x2_t bv;
  float64x2_t res0;
  float64x2_t res1;
  float64x2_t res2;
  float64x2_t res3;
  float64x2_t res4;
  float64x2_t res5;
  float64x2_t res6;
  float64x2_t res7;
  float64x2_t res8;
  float64x2_t res9;
  float64x2_t res10;
  float64x2_t res11;
  float64x2_t res12;
  float64x2_t res13;
  float64x2_t res14;
  float64x2_t res15;
  float64x2_t res16;
  float64x2_t res17;
  float64x2_t res18;
  float64x2_t res19;
  float64x2_t res20;
  float64x2_t res21;
  float64x2_t res22;
  float64x2_t res23;
  float64x2_t res24;
  float64x2_t res25;
  float64x2_t res26;
  float64x2_t res27;
  float64x2_t res28;
  float64x2_t res29;

  bv[0] = b;
  bv[1] = b;
  for(i=0; i<V_SIZE; i+=60) {
    res0[0] = 1.0;
    res0[1] = 1.0;
    res1[0] = 1.0;
    res1[1] = 1.0;
    res2[0] = 1.0;
    res2[1] = 1.0;
    res3[0] = 1.0;
    res3[1] = 1.0;
    res4[0] = 1.0;
    res4[1] = 1.0;
    res5[0] = 1.0;
    res5[1] = 1.0;
    res6[0] = 1.0;
    res6[1] = 1.0;
    res7[0] = 1.0;
    res7[1] = 1.0;
    res8[0] = 1.0;
    res8[1] = 1.0;
    res9[0] = 1.0;
    res9[1] = 1.0;
    res10[0] = 1.0;
    res10[1] = 1.0;
    res11[0] = 1.0;
    res11[1] = 1.0;
    res12[0] = 1.0;
    res12[1] = 1.0;
    res13[0] = 1.0;
    res13[1] = 1.0;
    res14[0] = 1.0;
    res14[1] = 1.0;
    res15[0] = 1.0;
    res15[1] = 1.0;
    res16[0] = 1.0;
    res16[1] = 1.0;
    res17[0] = 1.0;
    res17[1] = 1.0;
    res18[0] = 1.0;
    res18[1] = 1.0;
    res19[0] = 1.0;
    res19[1] = 1.0;
    res20[0] = 1.0;
    res20[1] = 1.0;
    res21[0] = 1.0;
    res21[1] = 1.0;
    res22[0] = 1.0;
    res22[1] = 1.0;
    res23[0] = 1.0;
    res23[1] = 1.0;
    res24[0] = 1.0;
    res24[1] = 1.0;
    res25[0] = 1.0;
    res25[1] = 1.0;
    res26[0] = 1.0;
    res26[1] = 1.0;
    res27[0] = 1.0;
    res27[1] = 1.0;
    res28[0] = 1.0;
    res28[1] = 1.0;
    res29[0] = 1.0;
    res29[1] = 1.0;

    for(j=0; j<N_MAX; j++) {
       res0 = vmlaq_f64(res0,bv,res0);
       res1 = vmlaq_f64(res1,bv,res1);
       res2 = vmlaq_f64(res2,bv,res2);
       res3 = vmlaq_f64(res3,bv,res3);
       res4 = vmlaq_f64(res4,bv,res4);
       res5 = vmlaq_f64(res5,bv,res5);
       res6 = vmlaq_f64(res6,bv,res6);
       res7 = vmlaq_f64(res7,bv,res7);
       res8 = vmlaq_f64(res8,bv,res8);
       res9 = vmlaq_f64(res9,bv,res9);
       res10 = vmlaq_f64(res10,bv,res10);
       res11 = vmlaq_f64(res11,bv,res11);
       res12 = vmlaq_f64(res12,bv,res12);
       res13 = vmlaq_f64(res13,bv,res13);
       res14 = vmlaq_f64(res14,bv,res14);
       res15 = vmlaq_f64(res15,bv,res15);
       res16 = vmlaq_f64(res16,bv,res16);
       res17 = vmlaq_f64(res17,bv,res17);
       res18 = vmlaq_f64(res18,bv,res18);
       res19 = vmlaq_f64(res19,bv,res19);
       res20 = vmlaq_f64(res20,bv,res20);
       res21 = vmlaq_f64(res21,bv,res21);
       res22 = vmlaq_f64(res22,bv,res22);
       res23 = vmlaq_f64(res23,bv,res23);
       res24 = vmlaq_f64(res24,bv,res24);
       res25 = vmlaq_f64(res25,bv,res25);
       res26 = vmlaq_f64(res26,bv,res26);
       res27 = vmlaq_f64(res27,bv,res27);
       res28 = vmlaq_f64(res28,bv,res28);
       res29 = vmlaq_f64(res29,bv,res29);
    }

    res += res0[0];
    res += res0[1];
    res += res1[0];
    res += res1[1];
    res += res2[0];
    res += res2[1];
    res += res3[0];
    res += res3[1];
    res += res4[0];
    res += res4[1];
    res += res5[0];
    res += res5[1];
    res += res6[0];
    res += res6[1];
    res += res7[0];
    res += res7[1];
    res += res8[0];
    res += res8[1];
    res += res9[0];
    res += res9[1];
    res += res10[0];
    res += res10[1];
    res += res11[0];
    res += res11[1];
    res += res12[0];
    res += res12[1];
    res += res13[0];
    res += res13[1];
    res += res14[0];
    res += res14[1];
    res += res15[0];
    res += res15[1];
    res += res16[0];
    res += res16[1];
    res += res17[0];
    res += res17[1];
    res += res18[0];
    res += res18[1];
    res += res19[0];
    res += res19[1];
    res += res20[0];
    res += res20[1];
    res += res21[0];
    res += res21[1];
    res += res22[0];
    res += res22[1];
    res += res23[0];
    res += res23[1];
    res += res24[0];
    res += res24[1];
    res += res25[0];
    res += res25[1];
    res += res26[0];
    res += res26[1];
    res += res27[0];
    res += res27[1];
    res += res28[0];
    res += res28[1];
    res += res29[0];
    res += res29[1];
  }

  return res;
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
  double *a0, *a1, *res, *answ;
  double b;

  a0 = (double*)malloc(V_SIZE*sizeof(double));
  a1 = (double*)malloc(V_SIZE*sizeof(double));
  res = (double*)malloc(V_SIZE*sizeof(double));
  answ = (double*)malloc(V_SIZE*sizeof(double));

  b = 0.00005;
  initVector(a0,0.5);
  initVector(a1,0.0);

  flop = 2*V_SIZE*N_MAX;

  t0 = wall_time();
  bFib(a0,a1,answ,b);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(answ,answ);

  flops = flop / timeComp;
  printf("normal   perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj2(a0,a1,res,b);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll2  perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj4(a0,a1,res,b);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll4  perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj8(a0,a1,res,b);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll8  perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj16(a0,a1,res,b);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll16  perf = %f (gflops)\n", flops/G);

  t0 = wall_time();
  bFib_uj30(a0,a1,res,b);
  t1 = wall_time();
  timeComp = t1-t0;

  verify(res,answ);

  flops = flop / timeComp;
  printf("unroll30  perf = %f (gflops)\n", flops/G);

  double cheat_res;
  t0 = wall_time();
  cheat_res = cheat(0.0);
  t1 = wall_time();
  timeComp = t1-t0;

  printf("%f -- ",cheat_res);

  flops = flop / timeComp;
  printf("cheat  perf = %f (gflops)\n", flops/G);

  return 0;
}
