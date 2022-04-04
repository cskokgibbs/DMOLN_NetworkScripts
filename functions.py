import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import cairocffi
import scanpy as sc
import scipy.io as scio
import csv
import scipy.sparse as sp
from scipy.sparse import isspmatrix
from matplotlib.backends.backend_pdf import PdfPages

# Code by Giuseppe-Antonio Saldi

def read_betas(t, cardinal_class, boot_path, n_boot=10):
    return {'boot_{}'.format(b): pd.read_table(
            boot_path.format(t=t, b=b),
            index_col=0,header=0) for b in range(1, n_boot+1)}


def B_dot_A(B, A, n_boot):
    acc = B['boot_1']
    for i in range(2, n_boot+1):
        acc += B['boot_{}'.format(i)]
    return acc.dot(A.T) / n_boot
