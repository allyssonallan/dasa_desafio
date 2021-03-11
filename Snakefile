#Snakefile para filtrar arquivos vcf, anotar os 'ids' das variantes do dbsnp e retornar um arquivo anotado em formato tsv, csv e html.

#filtra o vcf da amostra e apresenta as características gerais da arquivo
rule filter_biallelic:
	input:'{prefix}.vcf.gz' 
	output:'{prefix}_input_filtered.vcf.gz'
	resources: mem=512
	log:'{prefix}_biallelic.log'
	conda: 'config.sk'
	shell: '''vcftools --gzvcf {input} --keep-filtered PASS --min-alleles 2 --max-alleles 2 --remove-indels --recode -c | bgzip -c > {output}'''
        
#indexa os vcfs
rule tabix:
	input:'{prefix}_input_filtered.vcf.gz'
	output:'{prefix}_input_filtered.vcf.gz.tbi'
	conda: 'config.sk'
	shell: "tabix -p vcf {input}"

#pip install cyvcf2 para rodar vcfanno

rule vcfanno:
	input:'{prefix}_input_filtered.vcf.gz',
		tom=expand('references/filter.toml')
	output:'{prefix}_input.annotated.vcf'
	shell:'''vcfanno {input[1]} {input[0]} > {output}'''

#caso de errado instalar no seu env: conda install -c bioconda vcfanno 


#transforma os vcfs em arquivos separados por tab
rule vcf2tsv:
	input:'{prefix}_input.annotated.vcf'
	output:'{prefix}.annotated.tsv'
	shell:'''python vcf2tsv.py {input[0]} {output}'''

#transformar o arquivo anotado separado por tab em multiplos formatos

rule html_annotated_chr1:
	input:'{prefix}.annotated.tsv'
	output:'{prefix}.chr1.html'
	script:'change_files_chr1.py'

rule tsv_annotated_allchr:
	input:'{prefix}.annotated.tsv'
	output:'{prefix}.all_chr.tsv'
	script:'change_files.py'

        
