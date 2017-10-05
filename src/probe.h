#ifndef _PROBE_H_
#define _PROBE_H_

void StencilProbe(double* A0, double* Anext, int nx, int ny, int nz, int timesteps);

void StencilProbeCPU(double* A0, double* Anext, int nx, int ny, int nz, int timesteps);

void StencilProbeBlocked(double* A0, double* Anext, int nx, int ny, int nz,
                         int tx, int ty, int tz, int timesteps);

void StencilProbeCircqueue(double* A0, double* Anext, int nx, int ny, int nz,
                           int tx, int ty, int tz, int timesteps);

void StencilProbeOblivious(double* A0, double* Anext, int nx, int ny, int nz,
                           int tx, int ty, int tz, int timesteps);

void StencilProbeTimeskew(double* A0, double* Anext, int nx, int ny, int nz,
                          int tx, int ty, int tz, int timesteps);
#endif
