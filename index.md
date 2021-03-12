## Desafio Dasa

### Cargo: especialista em bioinformática

### Tarefa

Implementar um pipeline de bioinformática a partir de um vcf fornecido pelo Dr. Rodrigo Guarischi, objetivando anotar as variantes disponíveis no dbSNP e obter as frequências de um banco de dados populacional. O resultado deverá ser entregue em interface interativa web para filtrar variantes por frequência.

### Pensando a solução

A primeira etapa compreendeu o download do arquivo em formato vcf (4.1) e checagem da integridade do arquivo usando a ferramenta "MD5SUM" que apresentou a hash "34fa1b4e3f0a2a908c238179882c9d14". A análise descritiva do arquivo foi realizada pelo programa "VCFtools 1.5.0". O arquivo vcf apresentou os dados genômicos do indivíduo "12878_S19" em referência ao genoma humano (hg19) com 98969 loci e 57.5502 como número médio de vezes que cada base foi lida.

A segunda etapa foi garantir a certificação dos bons modos de prática clínica e de construção de pipelines de bioinformatica a partir de artigos de revisão recentes ¹².

[Snakemake](https://snakemake.readthedocs.io/en/stable/) foi o programa escolhido para gerenciar o fluxo de trabalho, a referência para anotação da nomenclatura do dbsnp foi a [versão 138 - 1.5GB](ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.vcf.gz), e o banco de dados de populações humanas escolhido foi o projeto 1000 genomas [fase 3 - 1.8GB](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf.gz)

Para filtragem das variantes bialélicas foi utilizado o programa vcftools, para anotação do vcf foi utilizado o programa vcfanno, e para gerenciamento de diferentes formatos de tabelas foram utilizados as ferramentas bcftools e tabix. As etapas finais foram auxilidas com o uso do script [vcf2tsv](https://github.com/sigven/vcf2tsv).

### Passo a passo

Instale no Ubuntu (tutorial testado no 20.04.2 LTS):

[Python 3.8](https://www.python.org/downloads/) 
[Minconda para py 3.8](https://conda.io/en/latest/miniconda.html)
Mamba: 
``` 
conda install -c conda-forge mamba
``` 

Snakemake: 
```bash
mamba create -c conda-forge -c bioconda -n snakemake snakemake
``` 
Ative o snakemake: 
```bash
conda activated snakemake
``` 
Na pasta desafio3 crie a pasta e baixe as referencias:

``` bash
mkdir references / cd references

wget -c ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf.gz

wget -c ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.vcf.gz
``` 

Prossiga com a instalação das dependências:
```bash 
conda install bcftools vcftools tabix numpy vcfanno

pip install cyvcf2
``` 

Certifique-se que o arquivo Snakefile está na pasta desafio3 e rode:

``` bash
snakemake --cores 4 12878_S19_snp.chr1.html
``` 
Recomenda-se rodar um dry-run antes para checar se todos os arquivos estão presentes:
``` bash 
snakemake -n --cores 4 12878_S19_snp.chr1.html
``` 
Caso esteja em um ambiente slurm:

``` bash
snakemake --cluster 'sbatch -t 2-00:00:00' -j 10 12878_S19_snp.chr1.html
``` 
### Resultados

O arquivo com anotações para todas as variantes dos cromossomos autosomos encontra-se no [Google Drive](https://drive.google.com/file/d/19znoY5-7vt5n1dfL9xmzCadfd7wQ7O6b/view?usp=sharing). Optei por incluir somente o [chr1](https://drive.google.com/file/d/1d1f5X8qovJXM55QpIzsJcjL4hk1vSBr0/view?usp=sharing) na tabela dinâmica com uso da ferramenta Datatable e jQuery. 

Tabela dinâmica do cromossomo 1 usando datatable e jQuery:

[Chr1](https://allyssonallan.github.io/dasa_desafio/chr1.html)

O relatório foi escrito em [Markdown](https://guides.github.com/features/mastering-markdown/) e hospedado no [github](https://pages.github.com/).

### Referências

1. SoRelle, Jeffrey A., Megan Wachsmann, and Brandi L. Cantarel. "Assembling and validating bioinformatic pipelines for next-generation sequencing clinical assays." Archives of pathology & laboratory medicine 144.9 (2020): 1118-1130</p>
2. Kadri, Sabah. "Building Infrastructure and Workflows for Clinical Bioinformatics Pipelines." Advances in Molecular Pathology (2020).
