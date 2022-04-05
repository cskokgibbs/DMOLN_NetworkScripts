#!/bin/sh
#
#SBATCH --verbose
#SBATCH --job-name=inf
#SBATCH --mail-type=END
#SBATCH --output=inferelator.%j.out
#SBATCH --error=inferelator.%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem=768000
#SBATCH --time 48:00:00
#SBATCH --partition=ccb
#SBATCH --profile=all

module purge
module load slurm
module load gcc/8.3.0
source ~/miniconda3/bin/activate inferelator

# Control multithreading
# numpy/intel is compiled with MKL
export MKL_NUM_THREADS=1
# numpy in my env is OPENBLAS
export OPENBLAS_NUM_THREADS=1
# And I'm gonna set this one too cause why not
export NUMEXPR_NUM_THREADS=1

export PYTHONUNBUFFERED=TRUE
#export PYTHONOPTIMIZE=TRUE

echo "SLURM Environment: ${SLURM_JOB_NUM_NODES} Nodes ${SLURM_NTASKS} Tasks ${SLURM_MEM_PER_NODE} Memory/Node"
echo "Executing python workflow ${1}"
python -V
python -c "import numpy; print('NUMPY: ' + numpy.__version__)"
python -c "import pandas; print('PANDAS: ' + pandas.__version__)"
cat $1

time python ${1}


