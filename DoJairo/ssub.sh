#!/bin/bash
#SBATCH --time=02:00:00
#SBATCH --job-name="velMax"
#SBATCH --partition=jetson-tx
#SBATCH --exclusive

srun --output=out/Saida.bsc Poly.exe
