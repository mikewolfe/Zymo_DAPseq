rm peak_to_promoters.tsv
for peak in ../../results/peak_calling/macs2_all/macs2/*_summits.bed;
do
    bedtools closest -a ${peak} -b "2020_Vera_promoter_gene_pairs.bed" -D b >> peak_to_promoters.tsv
done


rm promoters_to_peaks.tsv
for peak in ../../results/peak_calling/macs2_all/macs2/*_summits.bed;
do
    bedtools closest -b ${peak} -a "2020_Vera_promoter_gene_pairs.bed" -D a >> promoters_to_peaks.tsv
done
