#!/bin/bash
#SBATCH --time=04:00:00
#SBATCH --job-name="stencilprobe"
#SBATCH --partition=merlin
#SBATCH --exclusive


# Start the power monitoring
~/project/refactCode/getMerlinMeasurements.sh ~/project/refactCode/out/energy.csv &
myPid=$!
 
# Collect some seconds before starting the application
sleep 10s

srun --output=out/probe.csv bin/probe.exe

# Collect some seconds after the application finishes
sleep 10s
 
# Stop the power monitoring
kill $myPid
