#!/bin/bash --login

### JOB NAME
#SBATCH --job-name=bb_reichardt

### OUTPUT FILE
#SBATCH --output=./outputs/log-%J

### ERROR FILE
#SBATCH --error=./outputs/err-%J

### TIME ALLOCATION
#SBATCH --time=40:00:00

### PARALLELIZATION
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=1

### MEMORY USAGE
###SBATCH --mem-per-cpu=4000

### CORRECT PARTITION
#SBATCH -p c_compute_physics1

### CORRECT ACCOUNT
#SBATCH -A scw1361

### PRIORITY QUEUE GOES BRRRRRRRRR
###SBATCH --qos=express

### GIVE ME EMAILS
#SBATCH --mail-type=ALL
#SBATCH --mail-user=beringueb@cardiff.ac.uk

### LOAD MODULDES
module load python/3.9.2
module load anaconda
source activate 
conda activate mflike-highL

### RUN COBAYA
python3 -m cobaya run -r run_highL_cp.yaml

