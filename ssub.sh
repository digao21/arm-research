#!/bin/bash
#SBATCH --time=02:00:00
#SBATCH --job-name="stencilprobe"
#SBATCH --partition=jetson-tx
#SBATCH --exclusive

srun --output=out/probe1.csv bin/probe.exe
