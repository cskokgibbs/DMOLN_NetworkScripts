#!/bin/bash

# Lamina ChromA default threshold
python -m network_from_motifs -b P48_Lamina.c18.ChromA.070821.bed -m CisBPDrosophilaALL.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c18.Lamina.10KBUPDOWN.GENEBODY.prior.ChromA.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100

# Lamina ChromA 1e-3 threshold
python -m network_from_motifs -b P48_Lamina.c18.ChromA.070821.bed -m CisBP_select_TFs.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c18.Lamina.10KBUPDOWN.GENEBODY.prior.ChromA.FIMO1e3.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100 --scan-threshold 1e-3 --lowmem

# Lamina MergedDA default threshold
python -m network_from_motifs -b P48-clusters18sub_MergedDAv2.bed -m CisBPDrosophilaALL.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c18.Lamina.10KBUPDOWN.GENEBODY.prior.MergedDAv2.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100

# Lamina MergedDA 1e-3 threshold
python -m network_from_motifs -b P48-clusters18sub_MergedDAv2.bed -m CisBP_select_TFs.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c18.Lamina.10KBUPDOWN.GENEBODY.prior.MergedDAv2.FIMO1e3.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100 --scan-threshold 1e-3 --lowmem

# Lamina NoBed default threshold
python -m network_from_motifs -m CisBPDrosophilaALL.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c18.Lamina.10KBUPDOWN.GENEBODY.prior.NoBedFile.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100

# Lamina NoBed 1e-3 threshold
python -m network_from_motifs -m CisBP_select_TFs.meme -f Drosophila_melanogaster.BDGP6.dna.toplevel.fa -g Drosophila_melanogaster.BDGP6.88.gtf -o P48_c18.Lamina.10KBUPDOWN.GENEBODY.prior.NoBedFile.FIMO1e3.091021 --species fly --no_tss -c 10 --scan FIMO -w 10000 10000 --tandem_window 100 --scan-threshold 1e-3 --lowmem




