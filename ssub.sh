#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --job-name="stencilprobe"
#SBATCH --partition=cpu_dev
#SBATCH --exclusive

srun --output=out/probe1.csv bin/probe.exe
