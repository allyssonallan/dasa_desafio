import os 
import pandas as pd

df = pd.read_csv(snakemake.input[0], sep="\t")
df1=df[["CHROM","POS","dbsnp_rs","REF","ALT","QUAL","FILTER","1kgp_af_afr","1kgp_af_amr","1kgp_af_eas","1kgp_af_eur","1kgp_af_sas","af_1kgp_all","ABQ","AMQ","DP","GQ","SB","SR","VA","VR","GT"]]
df2=df1.rename(columns={'CHROM':'chr','POS':'pos','REF':'ref','ALT':'alt','QUAL':'qual','FILTER':'filt','ABQ':'av_b_qual','AMQ':'av_m_qual','DP':'read_depth','GQ':'geno_qual','SB':'strand_bias','SR':'supp_reads','VA':'var_amb','VR':'var_reads','GT':'genotype'})
chr1 = df2[df2["chr"]=="chr1"]
chr1.to_html(snakemake.output[0], index = False)
