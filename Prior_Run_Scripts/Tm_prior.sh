#!/bin/bash

# Tm ChromA default threshold
python -m network_from_motifs -b P48_Tm14.19.33.34.ChromA.peaks.bed -m CisBPDrosophilaALL.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c14.19.33.34.10KBUPDOWN.GENEBODY.prior.Full.MEME.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100

# Tm ChromA 1e-3 threshold

python -m network_from_motifs -b P48_Tm14.19.33.34.ChromA.peaks.bed -m CisBP_select_TFs.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c14.19.33.34.10KBUPDOWN.GENEBODY.prior.Full.MEME.1e3FIMO.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100 --scan-threshold 1e-3 --lowmem

# Tm MergedDA default threshold

python -m network_from_motifs -b P48-clusters14-19-33-34_MergedDAv2.bed -m CisBPDrosophilaALL.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c14.19.33.34.MergedDAv2.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100

# Tm MergedDA 1e-3 theshold

python -m network_from_motifs -b P48-clusters14-19-33-34_MergedDAv2.bed -m CisBP_select_TFs.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c14.19.33.34.MergedDAv2.FIMO1e3.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100 --scan-threshold 1e-3 --lowmem

# Tm NoBed default threshold

python -m network_from_motifs -m CisBPDrosophilaALL.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c14.19.33.34.10KBUPDOWN.GENEBODY.prior.NoBedFile.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100 --lowmem

# Tm NoBed 1e-3 threshold

python -m network_from_motifs -m CisBP_select_TFs.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c14.19.33.34.10KBUPDOWN.GENEBODY.prior.NoBedFile.FIMO1e3.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100 --scan-threshold 1e-3 --lowmem

