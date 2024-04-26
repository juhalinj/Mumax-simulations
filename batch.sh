#!/bin/bash

#SBATCH --time=0-2:00:00        # maximum runtime, D-HH:MM:SS
#SBATCH --mem=1500              # memory cap (500MB seems to work most of the time)
#SBATCH --gres=gpu:1            # 1 GPU, of any type (the crucial step for mumax)
#SBATCH --output=SOT_1.out

# load CUDA if you haven't already:
module --ignore-cache load cuda/11.0

# change to relevant directory:
cd $WRKDIR/mumax3.10_linux_cuda11.0

echo "Hello $USER! You are on node $HOSTNAME. The time is $(date)"

# run the desired .mx3 file:
srun $WRKDIR/mumax3.10_linux_cuda11.0/mumax3 -cache "$WRKDIR/Mumax3/3/cache/CurrentPulses" $WRKDIR/Mumax3/3/cache/CurrentPulses/SOT2/SOT2.mx3

