## Desafio Dasa

Cargo: especialista em bioinformática

### Tarefa

Implementar um pipeline de bioinformática a partir de um vcf fornecido pelo Dr. Rodrigo Guarischi, objetivando anotar as variantes disponíveis no dbSNP e obter as frequências de um banco de dados populacional. O resultado deverá ser entregue em interface interativa web para filtrar variantes por frequência.

### Pensando a solução

A primeira etapa compreendeu o download do arquivo em formato vcf (4.1) e checagem da integridade do arquivo usando a ferramenta "MD5SUM" que apresentou a hash "34fa1b4e3f0a2a908c238179882c9d14". A análise descritiva do arquivo foi realizada pelo programa "VCFtools 1.5.0". O arquivo vcf apresentou os dados genômicos do indivíduo "12878_S19" em referência ao genoma humano (hg19) com 98969 loci e 57.5502 como número médio de vezes que cada base foi lida.

A segunda etapa foi garantir a certificação dos bons modos de prática clínica e de construção de pipelines de bioinformatica a partir de artigos de revisão recentes ¹².

[https://snakemake.readthedocs.io/en/stable/](Snakemake) foi o programa escolhido para gerenciar o fluxo de trabalho, a referência para anotação da nomenclatura do dbsnp [ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.vcf.gz"](versão 138 - 1.5GB) e o banco de dados de populações humanas escolhido foi o projeto 1000 genomas [ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf.gz](fase 3 - 1.8GB) </a>


```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/allyssonallan/dasa_desafio/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
