import subprocess,os
import pandas as pd

with open('/home/jerry/samples1.txt','r') as fil:
    f1=fil.readlines()
f1=map(lambda x: x.strip(),f1)

def fun():
    for i in f1:
        status=subprocess.call("wget 'http://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?save=efetch&rettype=runinfo&db=sra&term=%s' -O /home/jerry/SraRunInfo1.csv"%i,shell=True)
        data=pd.read_csv('SraRunInfo1.csv')
        status=subprocess.call("rm /home/jerry/SraRunInfo1.csv",shell=True)
        status=subprocess.call("mkdir /home/jerry/data/%s"%i,shell=True)
        for ii in range(data.shape[0]):
            r=data.iloc[ii]['Run']
            l=data.iloc[ii]['LibraryLayout']
            if l=='SINGLE':
                _=subprocess.call("/home/jerry/sratoolkit.2.9.4-2-ubuntu64/bin/./fastq-dump -O /home/jerry/data/%s %s"%(i,r),shell=True)
            elif l=='PAIRED':
                _=subprocess.call("/home/jerry/sratoolkit.2.9.4-2-ubuntu64/bin/./fastq-dump --split-files -O /home/jerry/data/%s %s"%(i,r),shell=True)
            else:
                print 'ERROR',l,i,r
                break
fun()

