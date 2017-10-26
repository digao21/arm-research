#!/bin/bash
#SBATCH --time=00:00:30
#SBATCH --job-name="velMax"
#SBATCH --partition=jetson-tx
#SBATCH --exclusive

srun --output=out/Saida.bsc prod.exe
