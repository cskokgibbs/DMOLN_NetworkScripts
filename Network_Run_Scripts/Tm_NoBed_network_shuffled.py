from inferelator import utils
from inferelator import workflow
from inferelator.distributed.inferelator_mp import MPControl
from inferelator.preprocessing import single_cell
from inferelator.crossvalidation_workflow import CrossValidationManager
from inferelator.regression.bbsr_multitask import BBSRByTaskRegressionWorkflowMixin
from inferelator.postprocessing.results_processor import InferelatorResults

INPUT_DIR = '~/fi-inferelator_sc/TmFinalNets/data'
OUTPUT_DIR = '~/fi-inferelator_sc/TmFinalNets'
TF_NAMES = "N_Z_DE_TFs.txt"
CV_SEEDS = list(range(42,43))
InferelatorResults.curve_data_file_name = "pr_curve.tsv"

MPControl.set_multiprocess_engine("dask-cluster")
MPControl.client.use_default_configuration("rusty_ccb", n_jobs=5)
WALLTIME = '24:00:00'
MPControl.client.walltime = WALLTIME
MPControl.client.add_worker_env_line('module load slurm')
MPControl.client.add_worker_env_line('module load gcc/8.3.0')
MPControl.client.add_worker_conda("source ~/.local/anaconda3/bin/activate winf")
MPControl.connect()

cv_wrap = CrossValidationManager()
cv_wrap.add_gridsearch_parameter('random_seed', CV_SEEDS)

worker = workflow.inferelator_workflow(regression="amusr", workflow="multitask")
worker.set_file_paths(input_dir=INPUT_DIR, output_dir=OUTPUT_DIR, tf_names_file=TF_NAMES,
                      gold_standard_file = 'P48Tm_NoBed_DE_goldstandard_092621.tsv')
worker.set_file_properties(expression_matrix_columns_are_genes=True)
worker.set_count_minimum(0.05)
worker.set_file_paths(gene_names_file="Tm1246_P24-48DGRP_markers.tsv")

worker.append_to_path('output_dir', "Tm_NoBed_network_Norm2_shuffled_010622")

P24P36P48 = worker.create_task(task_name="P24-P48", tf_names_file=TF_NAMES,expression_matrix_columns_are_genes=True, 
                           extract_metadata_from_expression_matrix=False, workflow_type="tfa",
                           priors_file='P48_NoBed_combinedFimoScores_091621.tsv')
P24P36P48.set_expression_file(h5ad="Zipursky_Tm_norm2_sparse_expression.h5ad")
P24P36P48.shuffle_prior_axis = 0

P30P40P50 = worker.create_task(task_name="P30-P50", tf_names_file=TF_NAMES,expression_matrix_columns_are_genes=True,
                           extract_metadata_from_expression_matrix=False, workflow_type="tfa",
                           priors_file='P48_NoBed_combinedFimoScores_091621.tsv')
P30P40P50.set_expression_file(h5ad="Desplan_Tm_norm2_sparse_expression.h5ad")
P30P40P50.shuffle_prior_axis = 0

worker.set_run_parameters(num_bootstraps=5)
cv_wrap.workflow = worker
cv_wrap.run()


