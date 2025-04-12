rm peak_to_genes.tsv
for peak in ../../results/peak_calling/macs2_all/macs2/*_summits.bed;
do
    bedtools closest -a ${peak} -b "ZM4_gene_starts.bed" -D b >> peak_to_genes.tsv
done


rm genes_to_peaks.tsv
for peak in ../../results/peak_calling/macs2_all/macs2/*_summits.bed;
do
    bedtools closest -b ${peak} -a "ZM4_gene_starts.bed" -D a >> genes_to_peaks.tsv
done
