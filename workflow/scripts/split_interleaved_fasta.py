import fastq as fq
import gzip
import sys
from itertools import zip_longest

def grouper(n, iterable, fillvalue=None):
    # from itertools docs
    "grouper(3, 'ABCDEFG', 'x') --> ABC DEF Gxx"
    args = [iter(iterable)] * n
    return zip_longest(fillvalue=fillvalue, *args)

if __name__ == "__main__":

    infile = fq.FastqFile(sys.argv[1])

    outpre = sys.argv[2]

    out_r1 = fq.FastqFile(outpre + "_R1.fastq.gz")
    out_r2 = fq.FastqFile(outpre + "_R2.fastq.gz")

    for entry1, entry2 in grouper(2, infile.stream_file()):
        out_r1.add_entry(entry1)
        out_r2.add_entry(entry2)

    out_r1.write(out_r1.infile)
    out_r2.write(out_r2.infile)
