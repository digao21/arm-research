/*
	StencilProbe Heat Equation
	Implements 7pt stencil from Chombo's heattut example.
*/
#include <stdio.h>
#include "common.h"

#ifdef STENCILTEST
void StencilProbeCPU_naive(double* A0, double* Anext, int nx, int ny, int nz,
				int tx, int ty, int tz, int timesteps) {
#else
void StencilProbeCPU(double *A0, double *Anext, int nx, int ny, int nz, int timesteps) {
#endif
  // Fool compiler so it doesn't insert a constant here
  register double buff[2];
  double fac = A0[0] * A0[0];
  double *temp_ptr;
  int i, j, k, t;
  
  for (t = 0; t < timesteps; t++) {
    for (k = 1; k < nz - 1; k++) {
      for (j = 1; j < ny - 1; j++) {
	for (i = 1; i < nx - 1 -1; i+=2) {


	  Anext[Index3D (nx, ny, i, j, k)] = 
	    2.0*A0[Index3D (nx, ny, i, j, k + 1)] +
	    3.0*A0[Index3D (nx, ny, i, j, k - 1)] +
	    4.0*A0[Index3D (nx, ny, i, j + 1, k)] +
	    5.0*A0[Index3D (nx, ny, i, j - 1, k)] +
	    6.0*A0[Index3D (nx, ny, i + 1, j, k)] +
	    7.0*A0[Index3D (nx, ny, i - 1, j, k)]
	    - 26.0*A0[Index3D (nx, ny, i, j, k)] / fac;



	  Anext[Index3D (nx, ny, i+1, j, k)] = 
	    2.0*A0[Index3D (nx, ny, i+1, j, k + 1)] +
	    3.0*A0[Index3D (nx, ny, i+1, j, k - 1)] +
	    4.0*A0[Index3D (nx, ny, i+1, j + 1, k)] +
	    5.0*A0[Index3D (nx, ny, i+1, j - 1, k)] +
	    6.0*A0[Index3D (nx, ny, i+1 + 1, j, k)] +
	    7.0*A0[Index3D (nx, ny, i+1 - 1, j, k)]
	    - 26.0*A0[Index3D (nx, ny, i+1, j, k)] / fac;





/*
          buff[0] = 2.0*A0[Index3D (nx, ny, i, j, k + 1)];
          buff[1] = 2.0*A0[Index3D (nx, ny, i+1, j, k + 1)];
//          Anext[Index3D (nx, ny, i+2, j, k)] = 2.0*A0[Index3D (nx, ny, i+2, j, k + 1)];
//          Anext[Index3D (nx, ny, i+3, j, k)] = 2.0*A0[Index3D (nx, ny, i+3, j, k + 1)];

          buff[0] = buff[0] + 3.0*A0[Index3D (nx, ny, i, j, k - 1)];
          buff[1] = buff[1] + 3.0*A0[Index3D (nx, ny, i+1, j, k - 1)];
//          Anext[Index3D (nx, ny, i+2, j, k)] = Anext[Index3D (nx, ny, i+2, j, k)] + 3.0*A0[Index3D (nx, ny, i+2, j, k - 1)];
//          Anext[Index3D (nx, ny, i+3, j, k)] = Anext[Index3D (nx, ny, i+3, j, k)] + 3.0*A0[Index3D (nx, ny, i+3, j, k - 1)];

          buff[0] = buff[0] + 4.0*A0[Index3D (nx, ny, i, j + 1, k)];
          buff[1] = buff[1] + 4.0*A0[Index3D (nx, ny, i+1, j + 1, k)];
//          Anext[Index3D (nx, ny, i+2, j, k)] = Anext[Index3D (nx, ny, i+2, j, k)] + 4.0*A0[Index3D (nx, ny, i+2, j + 1, k)];
//          Anext[Index3D (nx, ny, i+3, j, k)] = Anext[Index3D (nx, ny, i+3, j, k)] + 4.0*A0[Index3D (nx, ny, i+3, j + 1, k)];

          buff[0] = buff[0] + 5.0*A0[Index3D (nx, ny, i, j - 1, k)];
          buff[1] = buff[1] + 5.0*A0[Index3D (nx, ny, i+1, j - 1, k)];
//          Anext[Index3D (nx, ny, i+1, j, k)] = Anext[Index3D (nx, ny, i+1, j, k)] + 5.0*A0[Index3D (nx, ny, i+1, j - 1, k)];
//          Anext[Index3D (nx, ny, i+2, j, k)] = Anext[Index3D (nx, ny, i+2, j, k)] + 5.0*A0[Index3D (nx, ny, i+2, j - 1, k)];
//          Anext[Index3D (nx, ny, i+3, j, k)] = Anext[Index3D (nx, ny, i+3, j, k)] + 5.0*A0[Index3D (nx, ny, i+3, j - 1, k)];

          buff[0] = buff[0] + 6.0*A0[Index3D (nx, ny, i + 1, j, k)];
          buff[1] = buff[1] + 6.0*A0[Index3D (nx, ny, i + 1 +1, j, k)];
//          Anext[Index3D (nx, ny, i+2, j, k)] = Anext[Index3D (nx, ny, i+2, j, k)] + 6.0*A0[Index3D (nx, ny, i + 1 +2, j, k)];
//          Anext[Index3D (nx, ny, i+3, j, k)] = Anext[Index3D (nx, ny, i+3, j, k)] + 6.0*A0[Index3D (nx, ny, i + 1 +3, j, k)];

          buff[0] = buff[0] + 7.0*A0[Index3D (nx, ny, i - 1, j, k)];
          buff[1] = buff[1] + 7.0*A0[Index3D (nx, ny, i - 1 +1, j, k)];
//          Anext[Index3D (nx, ny, i+2, j, k)] = Anext[Index3D (nx, ny, i+2, j, k)] + 7.0*A0[Index3D (nx, ny, i - 1 +2, j, k)];
//          Anext[Index3D (nx, ny, i+3, j, k)] = Anext[Index3D (nx, ny, i+3, j, k)] + 7.0*A0[Index3D (nx, ny, i - 1 +3, j, k)];

          buff[0] = buff[0] - 26.0*A0[Index3D (nx, ny, i, j, k)] / fac;
          buff[1] = buff[1] - 26.0*A0[Index3D (nx, ny, i+1, j, k)] / fac;
//          Anext[Index3D (nx, ny, i+2, j, k)] = Anext[Index3D (nx, ny, i+2, j, k)] - 26.0*A0[Index3D (nx, ny, i+2, j, k)] / (fac*fac);
//          Anext[Index3D (nx, ny, i+3, j, k)] = Anext[Index3D (nx, ny, i+3, j, k)] - 26.0*A0[Index3D (nx, ny, i+3, j, k)] / (fac*fac);

          Anext[Index3D (nx, ny, i, j, k)]   = buff[0];
          Anext[Index3D (nx, ny, i+1, j, k)] = buff[1];

	  Anext[Index3D (nx, ny, i, j, k)] = 
	    2.0*A0[Index3D (nx, ny, i, j, k + 1)] +
	    3.0*A0[Index3D (nx, ny, i, j, k - 1)] +
	    4.0*A0[Index3D (nx, ny, i, j + 1, k)] +
	    5.0*A0[Index3D (nx, ny, i, j - 1, k)] +
	    6.0*A0[Index3D (nx, ny, i + 1, j, k)] +
	    7.0*A0[Index3D (nx, ny, i - 1, j, k)]
	    - 26.0*A0[Index3D (nx, ny, i, j, k)] / (fac*fac);
*/
	}
      }
    }
    temp_ptr = A0;
    A0 = Anext;
    Anext = temp_ptr;
  }
}
