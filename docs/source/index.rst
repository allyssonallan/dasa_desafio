<!DOCTYPE html>

<html lang="[pt]">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Desafio Dasa</title>
    <link rel="stylesheet" href="_static/pygments.css" type="text/css" />
    <link rel="stylesheet" href="_static/alabaster.css" type="text/css" />
    <script id="documentation_options" data-url_root="./" src="_static/documentation_options.js"></script>
    <script src="_static/jquery.js"></script>
    <script src="_static/underscore.js"></script>
    <script src="_static/doctools.js"></script>
      
  <link rel="stylesheet" href="_static/custom.css" type="text/css" />
  
  
  <meta name="viewport" content="width=device-width, initial-scale=0.9, maximum-scale=0.9" />

  </head><body>
  

    <div class="document">
      <div class="documentwrapper">
        <div class="bodywrapper">
          

          <div class="body" role="main">
            
  <div class="section" id="welcome-to-desafio-dasa-s-documentation">
<h1>Documentação do desafio Dasa<a class="headerlink" href="#welcome-to-desafio-dasa-s-documentation" title="Permalink to this headline">¶</a></h1>
<div class="toctree-wrapper compound">
</div>
</div>
<div class="section" id="indices-and-tables">
<h2>Cargo: Especialista em bioinformática<a class="headerlink" href="#inicio" title="Permalink to this headline">¶</a></h2>
<ul class="simple">
<body>
<br>
<h3 class="conteudo">Tarefa</h3>
<p>Implementar um pipeline de bioinformática a partir de um vcf fornecido pelo Dr. Rodrigo Guarischi, objetivando anotar as variantes disponíveis no dbSNP e obter as frequências de um banco de dados populacional. O resultado deverá ser entregue em interface interativa web para filtrar variantes por frequência.</p>

<br>
<h3 class="conteudo">Pensando a solução</h3>
<p>A primeira etapa compreendeu o download do arquivo em formato vcf (4.1) e checagem da integridade do arquivo usando a ferramenta "MD5SUM" que apresentou a hash "34fa1b4e3f0a2a908c238179882c9d14". A análise descritiva do arquivo foi realizada pelo programa "VCFtools 1.5.0". O arquivo vcf apresentou os dados genômicos do indivíduo "12878_S19" em referência ao genoma humano (hg19) com 98969 loci e 57.5502 como número médio de vezes que cada base foi lida. </p>

<p>A segunda etapa foi garantir a certificação dos bons modos de prática clínica e de construção de pipelines de bioinformatica a partir de artigos de revisão recentes ¹². </p>

<p> <a href="https://snakemake.readthedocs.io/en/stable/">Snakemake</a> foi o programa escolhido para gerenciar o fluxo de trabalho, a referência para anotação da nomenclatura do dbsnp <a href="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.vcf.gz"> versão 138 - 1.5GB </a> e o banco de dados de populações humanas escolhido foi o projeto 1000 genomas <a href=ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf.gz>(fase 3 - 1.8GB) </a> </p>

<p> Para filtragem das variantes bialélicas foi utilizado o programa vcftools, para anotação do vcf foi utilizado o programa vcfanno, e para gerenciamento de diferentes formatos de tabelas foram utilizados as ferramentas bcftools e tabix. As etapas finais foram auxilidas com o uso do script <a href="https://github.com/sigven/vcf2tsv">vcf2tsv</a>. </p>

<br>
<h3 class="conteudo"> Passo a passo </h3>


<p>Instale no Ubuntu:</p>
<a href="https://www.python.org/downloads/"> Python 3.8 </a>
<a href="https://conda.io/en/latest/miniconda.html"> Miniconda para py 3.8 </a>
<p>Mamba: conda install -c conda-forge mamba</p>
<p>Snakemake: mamba create -c conda-forge -c bioconda -n snakemake snakemake</p>

<p>Ative o snakemake: conda activated snakemake</p>

<p>Na pasta desafio3 crie a pasta e baixe as referencias:</p>

<p>mkdir references / cd references</p>

<p>wget -c ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf.gz</p>

<p>wget -c ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.vcf.gz</p>

<p>Prossiga com a instalação das dependências:</p>
<p>conda install bcftools vcftools tabix numpy vcfanno</p>
<p>pip install cyvcf2</p>

<p>Certifique-se que o arquivo Snakefile está na pasta desafio3 e rode:</p>

<p>snakemake --cores 4 12878_S19_snp.chr1.html</p>

<p>Recomenda-se rodar um dry-run antes:</p>

<p>snakemake -n --cores 4 12878_S19_snp.chr1.html</p>

<p> Caso esteja em um ambiente slurm: </p>

<p> snakemake --cluster 'sbatch -t 2-00:00:00' -j 10 12878_S19_snp.chr1.html </p>
<br>
<h3 class="conteudo">Resultados</h2>

<p> O arquivo com anotações para todas as variantes dos cromossomos autosomos encontra-se no <a href="https://drive.google.com/file/d/19znoY5-7vt5n1dfL9xmzCadfd7wQ7O6b/view?usp=sharing"> Google Drive </a>. Optei por incluir somente o <a href=https://drive.google.com/file/d/1d1f5X8qovJXM55QpIzsJcjL4hk1vSBr0/view?usp=sharing> chr1 </a> na tabela dinâmica com uso da ferramenta Datatable e jQuery. </p>

<p><a href:#tabeladinamica> Tabela Dinâmica </a></p>

<p> O relatório foi escrito em Sphinx e hospedado no .readthedocs. </p>



<br>

<p><b>References:</b></p>

<p>1 - SoRelle, Jeffrey A., Megan Wachsmann, and Brandi L. Cantarel. "Assembling and validating bioinformatic pipelines for next-generation sequencing clinical assays." Archives of pathology & laboratory medicine 144.9 (2020): 1118-1130</p>
<p>2 - Kadri, Sabah. "Building Infrastructure and Workflows for Clinical Bioinformatics Pipelines." Advances in Molecular Pathology (2020).</p>

<br>
<br>

<li><p><a class="reference internal" href="genindex.html"><span class="std std-ref">Index</span></a></p></li>
<li><p><a class="reference internal" href="py-modindex.html"><span class="std std-ref">Module Index</span></a></p></li>
<li><p><a class="reference internal" href="search.html"><span class="std std-ref">Search Page</span></a></p></li>
</ul>
</div>


          </div>
          
        </div>
      </div>
      <div class="sphinxsidebar" role="navigation" aria-label="main navigation">
        <div class="sphinxsidebarwrapper">
<h1 class="logo"><a href="https://allyssonallan.github.io/">allyssonallan</a></h1>







        </div>
      </div>
      <div class="clearer"></div>
    </div>
    <div class="footer">
      &copy;2021, Allysson Allan.
      
      |
      Powered by <a href="http://sphinx-doc.org/">Sphinx 3.5.2</a>
      &amp; <a href="https://github.com/bitprophet/alabaster">Alabaster 0.7.12</a>
      
      |
      <a href="_sources/index.rst.txt"
          rel="nofollow">Page source</a>
    </div>

    

    
  </body>
</html> 
