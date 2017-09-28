#!/bin/bash
#SBATCH --time=02:00:00
#SBATCH --job-name="stencilprobe"
#SBATCH --partition=jetson-tx
#SBATCH --exclusive

srun --output=out/probe2.csv bin/probe.exe
srun --output=out/probe3.csv bin/probe.exe
srun --output=out/probe4.csv bin/probe.exe
srun --output=out/probe5.csv bin/probe.exe
