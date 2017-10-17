#include <stdio.h>
#include <arm_neon.h>

void verifyInt(char* str, int s, int r) {
  r == s ? printf("[OK] ") : printf("[ERROR] ");
  printf("%s",str);
}

void verifyFloat(char* str, float s, float r) {
#define SIGMA 0.001
  if (-SIGMA < r - s && r - s < SIGMA)
    printf("[OK] ");
  else
    printf("[ERROR] ");

  printf("%s",str);
}

test_add_int32x2(int in[][3], int n) {
  int i;
  char str[100];
  int32x2_t s,r,a,b;

  if(n%2 != 0) {
    printf("ERROR int32x4 tests must be divisible by 2\n");
    return;
  }

  for(i=0; i<n; i+=2) {
    r[0] = in[i][0];   a[0] = in[i][1];   b[0] = in[i][2];
    r[1] = in[i+1][0]; a[1] = in[i+1][1]; b[1] = in[i+1][2];

    s = vadd_s32(a, b);

    sprintf(str, "%d = %d + %d\n", (int)s[0], (int)a[0],(int)b[0]);
    verifyInt(str, (int)s[0], (int)r[0]);

    sprintf(str, "%d = %d + %d\n", (int)s[1], (int)a[1],(int)b[1]);
    verifyInt(str, (int)s[1], (int)r[1]);
  }
}

test_add_int32x4(int in[][3], int n) {
  int i;
  char str[100];
  int32x4_t s,r,a,b;

  if(n%4 != 0) {
    printf("ERROR int32x4 tests must be divisible by 4\n");
    return;
  }

  for(i=0; i<n; i+=4) {
    r[0] = in[i][0];   a[0] = in[i][1];   b[0] = in[i][2];
    r[1] = in[i+1][0]; a[1] = in[i+1][1]; b[1] = in[i+1][2];
    r[2] = in[i+2][0]; a[2] = in[i+2][1]; b[2] = in[i+2][2];
    r[3] = in[i+3][0]; a[3] = in[i+3][1]; b[3] = in[i+3][2];

    s = vaddq_s32(a, b);

    sprintf(str, "%d = %d + %d\n", (int)s[0], (int)a[0],(int)b[0]);
    verifyInt(str, (int)s[0], (int)r[0]);

    sprintf(str, "%d = %d + %d\n", (int)s[1], (int)a[1],(int)b[1]);
    verifyInt(str, (int)s[1], (int)r[1]);

    sprintf(str, "%d = %d + %d\n", (int)s[2], (int)a[2],(int)b[2]);
    verifyInt(str, (int)s[2], (int)r[2]);

    sprintf(str, "%d = %d + %d\n", (int)s[3], (int)a[3],(int)b[3]);
    verifyInt(str, (int)s[3], (int)r[3]);
  }
}

test_mula_float32x4(float in[][4], int n) {
  int i, j;
  char str[100];
  float32x4_t  s,r,a,b,c;

  if(n%4 != 0) {
    printf("ERROR mula_float32x4 tests must be divisible by 4\n");
    return;
  }

  for(i=0; i<n; i+=4) {
    for(j=0; j<4; j++) {
      r[j] = in[i+j][0];
      a[j] = in[i+j][1];
      b[j] = in[i+j][2];
      c[j] = in[i+j][3];
    }

    s = vmlaq_f32(a, b, c);

    for(j=0; j<4; j++) {
      sprintf(str, "%f = %f + %f*%f\n", (float)s[j], (float)a[j],(float)b[j],(float)c[j]);
      verifyFloat(str, (float)s[j], (float)r[j]);
    }
  }
}

test_mula_float64x2(float in[][4], int n) {
  int i, j;
  char str[100];
  float64x2_t  s,r,a,b,c;

  if(n%4 != 0) {
    printf("ERROR mula_float64x2 tests must be divisible by 2\n");
    return;
  }

  for(i=0; i<n; i+=2) {
    for(j=0; j<2; j++) {
      r[j] = in[i+j][0];
      a[j] = in[i+j][1];
      b[j] = in[i+j][2];
      c[j] = in[i+j][3];
    }

    s = vmlaq_f64(a, b, c);

    for(j=0; j<2; j++) {
      sprintf(str, "%f = %f + %f*%f\n", (float)s[j], (float)a[j],(float)b[j],(float)c[j]);
      verifyFloat(str, (float)s[j], (float)r[j]);
    }
  }
}

int main() {
  printf("Test vadd_s32\n");
  int in32x2[20][3] = {{3,1,2},
                      {4,1,3},
                      {10,5,5},
                      {18,9,9},

                      {1, 6, -5},
                      {0, 5, -5},
                      {1, -5, 6},
                      {0, -5, 5},

                      {-1, -6, 5},
                      {-1, 5, -6},
                      {-2, -1, -1},
                      {-5, -2, -3},

                      {-10, -5, -5},
                      {-18, -9, -9},
                      {100, 50, 50},
                      {1024, 512, 512},

                      {2147483647, (1<<30), (1<<30)-1},
                      {-2147483648, -(1<<30), -(1<<30)},
                      {0, (1<<30), -(1<<30)},
                      {-1, -2147483648, 2147483647}};

  test_add_int32x2(in32x2,20);
  printf("\n");

  printf("Test vaddq_s32\n");
  test_add_int32x4(in32x2,20);
  printf("\n");

  printf("Test vmlaq_f32\n");
  float fl32x4[8][4] = {{10,1,3,3},
                        {6,3,1,3},
                        {6,3,3,1},
                        {6,2,2,2},

                        {50.34,5.2,6.1,7.4},
                        {-405.456,57.3,14.7,-31.48},
                        {-168.74,-40,-41,3.14},
                        {988.06640625,-31.9375,-31.9375,-31.9375}};

  test_mula_float32x4(fl32x4,8);
  printf("\n");


  printf("Test vmlaq_f64\n");
  test_mula_float64x2(fl32x4,8);
  printf("\n");
}
