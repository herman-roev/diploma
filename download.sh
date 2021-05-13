#!/bin/bash
for d in reads/COUNTS/TOTAL/*RR*
do
a=$fil/output_forward_paired.fq
b=$fil/output_reverse_paired.fq
echo "Обрабатывается $fil"
$HISAT2_HOME/hisat2 -q -t -p 4 -x /home/jerry/zz/RefBeet-1.2.2_ind -1 $a -2 $b -S $fil/1.sam
samtools sort -n -o $dirr/paired_sorted.sam -O sam -@ 4 $dirr/paired.sam
rm $dirr/paired.sam
htseq-count --order=name --format=sam $dirr/paired_sorted.sam ~/zz/#Beta_vulgaris.RefBeet-1.2.2.42.gtf > $dirr/noreads_counts.sam


f=${d##*/}
f=${f%.sam}

mv /home/jerry/reads/temp/${fil}_1.fastq /home/jerry/reads/temp/$fil/${fil}_1.fastq
mv /home/jerry/reads/temp/${fil}_2.fastq /home/jerry/reads/temp/$fil/${fil}_2.fastq
rm $fil/*.fastq

~/FastQC/fastqc -t 4 -o $fil ${fil}/output_forward_paired.fq

cp $d reads/COUNTS/TOTAL/aa/$f
echo $f > reads/COUNTS/TOTAL/te/${f}col
awk '{print $2}' $d >> reads/COUNTS/TOTAL/te/${f}col

java -jar ~/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 ${fil}/*_1.fastq ${fil}/*_2.fastq ${fil}/output_forward_paired.fq ${fil}/output_forward_unpaired.fq ${fil}/output_reverse_paired.fq ${fil}/output_reverse_unpaired.fq ILLUMINACLIP:/home/jerry/Trimmomatic-0.38/adapters/TruSeq2-PE.fa:2:30:10 SLIDINGWINDOW:4:25 MINLEN:36

java -jar ~/Trimmomatic-0.38/trimmomatic-0.38.jar SE -threads 4 $fil/*.fastq $fil/output.fq ILLUMINACLIP:TruSeq3-SE:2:30:10 SLIDINGWINDOW:4:20 MINLEN:25

firefox ${fil}/*.html
done

