
=Python applications=

Most Python applications are bundled in <code>python2/recommended</code> and/or <code>python3/recommended</code> rather than having their own module files. Some are listed below and you can see a fully up-to-date list of these at 
* [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-2.list Python 2 only]
* [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-3.list Python 3 only] 
* [https://github.com/UCL-RITS/rcps-buildscripts/blob/master/lists/python-shared.list Available on both]

=Applications available (maintained centrally)=

A number of centrally supported applications are available on the Legion cluster:
{|style="background-color:#F9F9F9;"
|- style="vertical-align:top;"
!Name
!Description
!Version no. installed
!Links

|- style="vertical-align:top;"
|Amber
|Assisted Model Building with Energy Refinement - molecular force fields and simulation programs.
|14
|[http://ambermd.org/ Amber home]


|- style="vertical-align:top;"
|ANSYS/CFX and
ANSYS/Fluent
|ANSYS/CFX and ANSYS/Fluent are commercial fluid dynamics packages.
|16.1, 17.0
|[[ANSYS CFX on Legion]]
[[ANSYS Fluent on Legion]]

|- style="vertical-align:top;"
|ANTs
|Advanced Normalization Tools. ANTs is a state-of-the-art medical image registration and segmentation toolkit.
|2.1.0
|[https://github.com/stnava/ANTs ANTs home]


|- style="vertical-align:top;"
|AutoDock
|AutoDock is a suite of automated docking tools. It is designed to predict how small molecules, such as substrates or drug candidates, bind to a receptor of known 3D structure.
|4.2.6
|[http://autodock.scripps.edu/ AutoDock home]


|- style="vertical-align:top;"
|bamtools
|BamTools is a project that provides both a C++ API and a command-line toolkit for reading, writing, and manipulating BAM (genome alignment) files.
|2.3.0
|[https://github.com/pezmaster31/bamtools/wiki bamtools documentation wiki]
[[BamTools on Legion]]

|- style="vertical-align:top;"
|BCFtools
|BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. 
|2.1
|[https://samtools.github.io/bcftools/bcftools.html BCFtools home]


|- style="vertical-align:top;"
|BEAST
|BEAST is a package for Bayesian MCMC analysis of molecular sequences. 
|2.3.0
|[http://beast.bio.ed.ac.uk/ BEAST homepage]
[[BEAST on Legion]].

|- style="vertical-align:top;"
|bedtools
|Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks.
|2.25.0
|[http://bedtools.readthedocs.org/en/latest/ bedtools home]


|- style="vertical-align:top;"
|Bioconductor
|Bioconductor provides tools for the analysis and comprehension of high-throughput genomic data. Bioconductor uses the R statistical programming language - see below for information about R on Legion.
|3.3 (r/recommended), 3.2
|[http://www.bioconductor.org/ Bioconductor web site]
[[Bioconductor on Legion]]

See the [[#R_and_Bioconductor | R and Bioconductor]] entry below.

|- style="vertical-align:top;"
|BLAST and BLAST+
|BLAST is a tool for comparing sequence information.
|2.2.26, 2.2.30
|[[BLAST on Legion]]

|- style="vertical-align:top;"
|Bowtie and Bowtie2
|The Bowties are tools for aligning sequencing reads to their reference sequences. Bowtie 1 is geared towards reads shorter than 50bp and Bowtie 2 towards longer reads.
|1.1.2 and 2.2.5
|[http://bowtie-bio.sourceforge.net/index.shtml Bowtie website]
[http://bowtie-bio.sourceforge.net/bowtie2/index.shtml Bowtie2 website]
[[Bowtie on Legion]]

|- style="vertical-align:top;"
|BWA
|BWA is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer sequences ranged from 70bp to 1Mbp. 	  	
|0.7.12
|[http://bio-bwa.sourceforge.net/ BWA website]
[[BWA on Legion]]

|- style="vertical-align:top;"
|CASTEP
|Materials modelling code. Not provided as a central install, see page for compilation suggestions.
|
|[http://www.castep.org/ CASTEP website]
[[CASTEP on Legion]]

|- style="vertical-align:top;"
|cctools
|The Parrot connector to CVMFS, the CernVM File System.
|5.4.1
|[https://cernvm.cern.ch CernVM website]
[https://cernvm.cern.ch/portal/filesystem/parrot Parrot Connector]
[[cctools on RC Systems]]

|- style="vertical-align:top;"
|CESM
|Community Earth System Model is a fully-coupled, global climate model that provides state-of-the-art computer simulations of the Earth's past, present, and future climate states.
|1.0.6, 1.2.2
|[http://www2.cesm.ucar.edu/ CESM website]
[[CESM on Legion]]

|- style="vertical-align:top;"
|Clustal Omega
|"The last alignment program you'll ever need" 
|1.2.1
|[http://www.clustal.org/omega/ Clustal Omega home]


|- style="vertical-align:top;"
|CompuCell3D
|CompuCell3D is an open-source simulation environment for multi-cell, single-cell-based modeling of tissues, organs and organisms. 
|3.7.4
|[http://www.compucell3d.org/ CompuCell3D home]

|- style="vertical-align:top;"
|Crystal14
|Crystal14 is a general-purpose program for the study of crystalline solids. The CRYSTAL program computes the electronic structure of periodic systems within Hartree Fock, density functional or various hybrid approximations.
|1.0.3 & 1.0.4
|[http://www.crystalsolutions.eu/ Crystal Solutions home]
[[Crystal14|Crystal14 on Legion and Grace]]


|- style="vertical-align:top;"
|Cufflinks
|Transcriptome assembly and differential expression analysis for RNA-Seq.
|2.2.1
|[http://cole-trapnell-lab.github.io/cufflinks/ Cufflinks home]


|- style="vertical-align:top;"
|cutadapt
|cutadapt removes adapter sequences from DNA high-throughput sequencing data. 
|Python2, Python3
|[https://pypi.python.org/pypi/cutadapt/ cutadapt homepage]
[[cutadapt on Legion]]

|- style="vertical-align:top;"
|CVXOPT
|CVXOPT is a free software package for convex optimization based on the Python programming language. This install uses ATLAS for BLAS and LAPACK, FFTW3, and GSL for random numbers.
|Python2, Python3
|[http://cvxopt.org CVXOPT website]
[[CVXOPT on Legion]]

|- style="vertical-align:top;"
|DL_Poly Classic
|DL_Poly Classic is the open source release of DL_Poly 2, a classical molecular dynamics package.
|1.9
|[http://ccpforge.cse.rl.ac.uk/gf/project/dl_poly_classic/ DL_Poly Classic at CCPForge]
[[DL_Poly Classic 1.9 on Legion]]

|- style="vertical-align:top;"
|DL_Poly 4
|DL_poly 4 is the latest release of DL_Poly.  Please read the license before using this software.
|4.07
|[http://www.stfc.ac.uk/SCD/research/app/ccg/software/DL_POLY/44516.aspx DL_Poly 4 web page]
[http://www.stfc.ac.uk/SCD/research/app/ccg/software/DL_POLY/40526.aspx DL_Poly 4 license]
[[DL_Poly 4 on Legion]]

|- style="vertical-align:top;"
|dos2unix
|dos2unix / unix2dos - Text file format converters.
|7.3
|

|- style="vertical-align:top;"
|ea-utils
|Command-line tools for processing biological sequencing data. Barcode demultiplexing, adapter trimming, etc. 
|822
|[https://code.google.com/p/ea-utils/ ea-utils home]

|- style="vertical-align:top;"
|EIGENSOFT
|Population genetics methods and EIGENSTRAT stratification correction method.
|6.1.1
|[http://www.hsph.harvard.edu/alkes-price/software/ EIGENSOFT home]
[[EIGENSOFT on RC Systems]]

|- style="vertical-align:top;"
|ExaML
|Exascale Maximum Likelihood (ExaML) code for phylogenetic inference using MPI.
|8dcf2cc
|[http://sco.h-its.org/exelixis/web/software/examl/index.html ExaML home]

|- style="vertical-align:top;"
|Exonerate
|Exonerate is a generic tool for pairwise sequence comparison. It allows you to align sequences using a many alignment models, either exhaustive dynamic programming or a variety of heuristics.
|2.2.0
|[http://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate Exonerate home]

|- style="vertical-align:top;"
|FigTree
|FigTree is designed as a graphical viewer of phylogenetic trees and as a program for producing publication-ready figures. In particular it is designed to display summarized and annotated trees produced by BEAST.
|1.4.2
|[http://tree.bio.ed.ac.uk/software/figtree/ FigTree home]

|- style="vertical-align:top;"
|FreeSurfer
|FreeSurfer is a set of tools for analysis and visualization of structural and functional brain imaging data.
|5.3.0
|[[FreeSurfer on Legion]]

[http://surfer.nmr.mgh.harvard.edu/fswiki FreeSurfer Wiki at Harvard]

|- style="vertical-align:top;"
|FMRIB Software Library (FSL)
|FSL is a comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data.
|5.0.9
|[[FSL on Legion]]
[http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/ FSL Wiki at Oxford]

|- style="vertical-align:top;"
|GAMESS
|The General Atomic and Molecular Electronic Structure System (GAMESS) is a general ab initio quantum chemistry package.
|5Dec2014_R1
|[[GAMESS on RC Systems]]
[http://www.msg.ameslab.gov/gamess/gamess.html GAMESS home]

|- style="vertical-align:top;"
|GATK
|The Genome Analysis Toolkit or GATK is a software package developed at the Broad Institute to analyze high-throughput sequencing data.
|3.4.46
|[[GATK on Legion]]
[https://www.broadinstitute.org/gatk/index.php GATK website]

|- style="vertical-align:top;"
|Gaussian 09
|Gaussian 09 is a system of linked programs for electronic structure modelling.
|Revisions: D.01
|[[Gaussian 09 on Legion]]
[http://www.gaussian.com/g_tech/g_ur/g09help.htm Gaussian 09 User's Reference] documentation on the Gaussian Inc website.

|- style="vertical-align:top;"
|GaussView
|A graphical tool to help prepare input for submission to Gaussian and view output. Part of the Gaussian module.
|5.0.8
|[[GaussView 5 on Legion]]
[http://www.gaussian.com/g_tech/gv5ref/gv5ref_toc.htm GaussView 5 Reference manual] on the Gaussian Inc website.

|- style="vertical-align:top;"
|GDAL
|Geospatial Data Abstraction Library. GDAL is a translator library for raster and vector geospatial data formats. It also comes with a variety of useful commandline utilities for data translation and processing.
|2.0.0
|[http://www.gdal.org/ GDAL home]

|- style="vertical-align:top;"
|Ghostscript
|Ghostscript is a set of commonly used tools for manipulating PostScript and PDF files.
|9.16
|[[Ghostscript on Legion]]

|- style="vertical-align:top;"
|GMT
|GMT is an open source collection of about 80 command-line tools for manipulating geographic and Cartesian data sets and producing PostScript illustrations.
|5.1.2
|[http://gmt.soest.hawaii.edu/ GMT home]


|- style="vertical-align:top;"
|Gnuplot
|Gnuplot is a commonly used command-line plotting tool.
|5.0.1
|[[gnuplot on Legion]]

|- style="vertical-align:top;"
|Grace
|Grace (sometimes referred to as XMGrace) is a commonly used graphing tool.
|5.1.25
|[[Grace on Legion]]

|- style="vertical-align:top;"
|GraphicsMagick
|GraphicsMagick Image Processing System provides a robust and efficient collection of tools and libraries which support reading, writing, and manipulating an image in over 88 major formats.
|1.3.31
|[http://www.graphicsmagick.org/ GraphicsMagick home]


|- style="vertical-align:top;"
|Graphviz
|The Graphviz layout programs take descriptions of graphs in a simple text language, and make diagrams in useful formats, such as images and SVG for web pages; PDF or Postscript for inclusion in other documents; or display in an interactive graph browser. 
|2.38.0
|[http://www.graphviz.org/ Graphviz home]


|- style="vertical-align:top;"
|GROMACS
|GROMACS is an open source molecular dynamics package. Both double and single precision builds of GROMACS are provided. Also a version with plumed.
|5.0.4
|[http://www.gromacs.org/ GROMACS web site]
[[GROMACS on Legion]]

|- style="vertical-align:top;"
|Hammock
|Hammock is a tool for peptide sequence clustering. It is able to cluster extremely large amounts of short peptide sequences into groups sharing sequence motifs. Typical Hammock applications are NGS-based experiments using large combinatorial peptide libraries, e.g. Phage display. We provide a module which loads dependencies and a quick-install script.
|1.0.5
|[http://www.recamo.cz/en/software/hammock-cluster-peptides/ Hammock web site]
[[Hammock on RC Systems]]

|- style="vertical-align:top;"
|HMMER
|HMMER: biosequence analysis using profile hidden Markov models.
|3.1b2
|[http://hmmer.janelia.org/ HMMER home]


|- style="vertical-align:top;"
|HOPSPACK
|HOPSPACK (Hybrid Optimization Parallel Search PACKage) solves derivative-free optimization problems using an open source, C++ software framework.
|2.0.2
|[http://www.sandia.gov/hopspack/index.shtml HOPSPACK website]
[[HOPSPACK on Legion]]

|- style="vertical-align:top;"
|IDL
|IDL is a complete environment and language for the analysis and visualisation of scientific and other technical data. It can be used for everything from quick interactive data exploration to building complex applications.
|8.4.1
|[[IDL on Legion]]
[http://www.exelisvis.com/docs/using_idl_home.html IDL documentayion] on the EXELIS website.

|- style="vertical-align:top;"
|IVA
|Iterative Virus Assembler. IVA is a de novo assembler designed to assemble virus genomes that have no repeat sequences, using Illumina read pairs sequenced from mixed populations at extremely high and variable depth.
|0.11.6, 1.0.0
|[https://github.com/sanger-pathogens/iva IVA home]

|- style="vertical-align:top;"
|JAGS
|JAGS (Just Another Gibbs Sampler) is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation  not wholly unlike BUGS.
|3.4.0
|[[JAGS on Legion]]

JAGS documentation is available on the [http://mcmc-jags.sourceforge.net/ JAGS website].

|- style="vertical-align:top;"
|KMC
|KMC is a disk-based program for counting k-mers from (possibly gzipped) FASTQ/FASTA files.
|2.1.1
|[https://github.com/marekkokot/KMC KMC home]


|- style="vertical-align:top;"
|LAMMPS 	
|LAMMPS is an open source parallel molecular dynamics code which exhibits good scaling in a wide range of environments.  The version deployed on Legion has been built as both an executable ("lmp_legion") and as a library ("liblmp_legion.a").

The additional "replica" package has been installed.
|10Feb15
|[http://lammps.sandia.gov/ LAMMPS website]
[[LAMMPS on Legion]]

|- style="vertical-align:top;"
|MACS and MACS2
|MACS is a code for Model-based Analysis of ChIP-Seq (MACS) on short reads sequencer data from sources such as Genome Analyzer (Illumina / Solexa). 
|Python2
|[[MACS on Legion]]
[http://liulab.dfci.harvard.edu/MACS/ MACS Website]

|- style="vertical-align:top;"
|Mathematica
|Mathematica is a general purpose package and language for mathematical applications. It can be used for numerical calculations, symbolic computation and visualization. Mathematica supports numbers of any precision.
|10.1.0
10.2.0
|[[Mathematica on Legion]]

|- style="vertical-align:top;"
|MATLAB 	
|<nowiki>*Serial*</nowiki> multi-threaded Matlab programs can be run on the cluster using either the full Matlab installation or by compiling using the Matlab compiler on your local machine.

You can bundle the Matlab runtime environment with your compiled program and use it in Legion as per Matlab documentation.

<nowiki>*Parallel*</nowiki>  Matlab jobs can be submitted using the Matlab Distributed Computing Server. As of March 2016 Matlab DCS jobs can only run in a single node.
|Full Matlab including UCL licensed toolboxes and the NAG Toolbox for Matlab: R2015b

|[[Full Matlab on Legion]]

[http://www.mathworks.co.uk/products/compiler/ Matlab Compiler]

[[Building and Running Matlab Programs | How to build a Matlab program to run on Legion]]

|- style="vertical-align:top;"
|Meep
|Meep is a free finite-difference time-domain (FDTD) simulation software package developed at MIT to model electromagnetic systems.
|1.3, 1.3-ompi
|[http://ab-initio.mit.edu/wiki/index.php/Meep Meep home]


|- style="vertical-align:top;"
|MEME Suite
|MEME Suite: Motif-based sequence analysis tools. This install is for the command-line tools and connects to their website for further analysis.
|4.10.1_4
|[http://meme.nbcr.net/meme/intro.html MEME Suite website]
[[MEME Suite on Legion]]

|- style="vertical-align:top;"
|MGLTools
|Applications for visualization and analysis of molecular structures. Contains AutoDockTools (ADT), Python Molecular Viewer (PMV) and Vision.
|1.5.6
|[http://mgltools.scripps.edu/ MGLTools home]


|- style="vertical-align:top;"
|miRDeep2
|Discovering known and novel miRNAs from deep sequencing data

miRDeep2 is a completely overhauled tool which discovers microRNA genes by analyzing sequenced RNAs. The tool reports known and hundreds of novel microRNAs with high accuracy in seven species representing the major animal clades. 
|2.0.0.7 
|[[miRDeep2 on Legion]]
[https://www.mdc-berlin.de/8551903/en/research/research_teams/systems_biology_of_gene_regulatory_elements/projects/miRDeep mIRDeep2 website]

|- style="vertical-align:top;"
|MISO (misopy)
|MISO (Mixture of Isoforms) is a probabilistic framework that quantitates the expression level of alternatively spliced genes from RNA-Seq data, and identifies differentially regulated isoforms or exons across samples. By modeling the generative process by which reads are produced from isoforms in RNA-Seq, the MISO model uses Bayesian inference to compute the probability that a read originated from a particular isoform.
|Python2, Python3
|[http://genes.mit.edu/burgelab/miso/docs/ MISO website]
[[MISO on Legion]]

|- style="vertical-align:top;"
|Molden
|Molden is a package for displaying Molecular Density from the Ab Initio packages GAMESS-UK , GAMESS-US and GAUSSIAN, the Semi-Empirical packages Mopac/Ampac, and a number of other programs via the Molden Format.
|5.2.2
|[http://www.cmbi.ru.nl/molden/ Molden website]
[[Molden on Legion]]

|- style="vertical-align:top;"
|MOLPRO
|Molpro is a complete system of ab initio programs for molecular electronic structure calculations.
|2012.1.25, 2015.1.3
|[http://www.molpro.net/ MOLPRO website]
[[MOLPRO on Legion]]

|- style="vertical-align:top;"
|MPB
|The MIT Photonic-Bands (MPB) package is a free program for computing the band structures (dispersion relations) and electromagnetic modes of periodic dielectric structures.
|1.5, 1.5-ompi
|[http://ab-initio.mit.edu/wiki/index.php/MIT_Photonic_Bands MPB home]


|- style="vertical-align:top;"
|MrBayes
|MrBayes is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models. MrBayes uses Markov chain Monte Carlo (MCMC) methods to estimate the posterior distribution of model parameters.
|3.2.5, serial and mpi
|[http://mrbayes.sourceforge.net/ MrBayes home]


|- style="vertical-align:top;"
|MRtrix
|MRtrix provides a set of tools to perform diffusion-weighted MRI white matter tractography in the presence of crossing fibres.
|0.3.12
|[http://www.brain.org.au/software/mrtrix/index.html MRtrix website]
[[MRtrix on Legion]]

|- style="vertical-align:top;"
|MUMmer
|MUMmer is a system for rapidly aligning entire genomes, whether in complete or draft form.
|3.23
|[http://mummer.sourceforge.net/ MUMmer home]


|- style="vertical-align:top;"
|MUSCLE
|MUSCLE is a multiple sequence alignment program.
|3.8.31
|[http://www.drive5.com/muscle/ MUSCLE home]


|- style="vertical-align:top;"
|MuTect
|MuTect is a GATK-based variant caller specialized for somatic/cancer variants.
|1.1.7
|[[MuTect on Legion]]
[https://www.broadinstitute.org/gatk/download/ MuTect/GATK website]

|- style="vertical-align:top;"
|NAMD
|NAMD is a parallel molecular dynamics package which shows exceptional scaling on a variety of systems. NAMD was developed by the Theoretical and Computational Biophysics Group in the Beckman Institute for Advanced Science and Technology at the University of Illinois at Urbana-Champaign.
|2.10
|[http://www.ks.uiuc.edu/Research/namd/ NAMD website]
[http://www.ks.uiuc.edu/Research/namd/license.html NAMD license]
[[NAMD on Legion]]

|- style="vertical-align:top;"
|NCO
|The NCO toolkit manipulates and analyzes data stored in netCDF-accessible formats, including DAP, HDF4, and HDF5. 
|4.5.0
|[http://nco.sourceforge.net/ NCO home]


|- style="vertical-align:top;"
|NONMEM®
|NONMEM® is a nonlinear mixed effects modelling tool used in population pharmacokinetic / pharmacodynamic analysis.
Both serial and parallel MPI runs are working. There is an example run script for parallel runs in ''/shared/ucl/apps/NONMEM/examples/run-NONMEM-Intel-MPI.sh''
|7.3.0
|[[NONMEM on Legion]]
|[http://www.iconplc.com/technology/products/nonmem/ NONMEM website]

|- style="vertical-align:top;"
|NWChem
|NWChem is used by thousands of researchers worldwide to investigate questions about chemical processes by applying theoretical techniques to predict the structure, properties, and reactivity of chemical and biological species ranging in size from tens to millions of atoms.
|6.5 r26243
|[[NWChem on Legion]]
[http://www.nwchem-sw.org/index.php/Main_Page NWChem.org]

|- style="vertical-align:top;"
|Octopus
|Octopus is a scientific program aimed at the ab initio virtual experimentation on a hopefully ever-increasing range of system types. Electrons are described quantum-mechanically within density-functional theory (DFT), in its time-dependent form (TDDFT) when doing simulations in time.
|4.1.2 serial and mpi
|[http://www.tddft.org/programs/octopus/wiki/index.php/Main_Page Octopus home]


|- style="vertical-align:top;"
|OpenFOAM
|OpenFOAM is free, open source software for computational fluid dynamics (CFD).
|2.3.1
|[http://www.openfoam.org/ OpenFOAM home]

|- style="vertical-align:top;"
|Picard
|Picard comprises Java-based command-line utilities that manipulate SAM files, and a Java API (SAM-JDK) for creating new programs that read and write SAM files. Both SAM text format and SAM binary (BAM) format are supported.
|1.136
|[http://broadinstitute.github.io/picard/ Picard website]
[[Picard on Legion]]

|- style="vertical-align:top;"
|PLINK
|PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner.
|1.07
|[http://pngu.mgh.harvard.edu/~purcell/plink/index.shtml Plink Website]
[[Plink on Legion]]

|- style="vertical-align:top;"
|PLUMED
|PLUMED is an open source library for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines.
|2.1.1
|[http://www.plumed.org/ PLUMED]


|- style="vertical-align:top;"
|Primer3
|Design PCR primers from DNA sequence.
|2.3.6
|[http://bioinfo.ut.ee/primer3/ Primer3 home]


|- style="vertical-align:top;"
|ProbABEL
|Genome-wide association analysis of imputed data
|0.4.5
|[http://www.genabel.org/manuals/ProbABEL ProbABEL Website]
[[ProbABEL on Legion]]

|- style="vertical-align:top;"
|PROJ.4
|Cartographic Projections Library
|4.9.1
|[https://github.com/OSGeo/proj.4 PROJ.4 home]

|- style="vertical-align:top;"
|PyMOL
|Molecular visualisation system.
|1.7.7.2
|[https://www.pymol.org/ PyMOL home]

|- style="vertical-align:top;"
|PyRosetta
|PyRosetta is an interactive Python-based interface to the powerful Rosetta molecular modeling suite. It enables users to design their own custom molecular modeling algorithms using Rosetta sampling methods and energy functions.
|release-73
|[http://www.pyrosetta.org/ PyRosetta home]

|- style="vertical-align:top;"
|Quantum Espresso
|Quantum Espresso is an integrated suite of Open-Source computer codes for electronic-structure calculations and materials modelling at the nanoscale. It is based on density-functional theory, plane waves, and pseudopotentials.
|5.2.0
|[[Quantum Espresso on Legion]]

[http://www.quantum-espresso.org/ Quantum Espresso Website]
<div id="R_and_Bioconductor"></div>

|- style="vertical-align:top;"
|R & Bioconductor
|R (GNU S) is an integrated suite of software for data manipulation, analysis and graphical display with strong support for a wide range of statistical methods. A number of add-on packages are also installed.

Bioconductor provides tools for the analysis and comprehension of high-throughput genomic data. 
|R: 3.3.0 (r/recommended), 3.2.2

Bioconductor: 3.3 (r/recommended), 3.2

|[[R on Legion]]

[[R packages available on Legion | List of packages]] available

|- style="vertical-align:top;"
|Randfold
|Minimum free energy of folding randomization test software
|2.0
|[http://bioinformatics.psb.ugent.be/supplementary_data/erbon/nov2003/ Randfold home]

|- style="vertical-align:top;"
|Repast HPC
|Repast for High Performance Computing (Repast HPC) is a next generation agent-based modeling system intended for large-scale distributed computing platforms. It implements the core Repast Simphony concepts (e.g. contexts and projections), modifying them to work in a parallel distributed environment.
|2.1
|[http://repast.sourceforge.net/repast_hpc.html Repast HPC website]
[[Repast HPC on Legion]]

|- style="vertical-align:top;"
|ROOT
|ROOT provides a set of OO frameworks for handling, analysing, and visualising large amounts of data. Included are specialised storage methods, methods for histograming, curve fitting, function evaluation, minimization etc. ROOT includes a built-in CINT C++ interpreter.
|5.34.30 and 6.04.00
|[[ROOT on Legion]]
[http://root.cern.ch/drupal/ ROOT website hosted by CERN]

|- style="vertical-align:top;"
|Rosetta
|The Rosetta software suite includes algorithms for computational modeling and analysis of protein structures.
|2015.31.58019 serial and mpi
|[https://www.rosettacommons.org/ Rosetta home]

|- style="vertical-align:top;"
|SAC
|SAC (Seismic Analysis Code) is a general purpose interactive program designed for the study of sequential signals, especially time series data.
|101.6a
|[http://ds.iris.edu/ds/nodes/dmc/software/downloads/SAC/101-6a/ SAC home]

|- style="vertical-align:top;"
|SAMTools
|SAM Tools provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format.
|0.1.19 and 1.2
|[http://samtools.sourceforge.net/ SAMtools website]
[[SAMTools on Legion]]

|- style="vertical-align:top;"
|SAS
|SAS is a statistics package providing a wide range of tools for data management, analysis and presentation.
|9.4/64
|[[SAS on Legion]]

|- style="vertical-align:top;"
|SMALT
|SMALT aligns DNA sequencing reads with genomic reference sequences. It employs hashing combined with dynamic programming.
|0.7.6
|[http://sourceforge.net/projects/smalt/ SMALT home]

|- style="vertical-align:top;"
|SPM
|SPM is a package written in MATLAB for analysing brain image data. The SPM package requires the MATLAB runtime.
|8 (r6313), 
12 (r6470)
|[[SPM on Legion]]

|- style="vertical-align:top;"
|StarCCM+
|StarCCM+ is a commercial code for running fluid dynamics, heat transfer and stress simulations.
|9.06.011
|[[StarCCM+ on Legion]]

|- style="vertical-align:top;"
|StarCD
|StarCD is a commercial package for modelling and simulating combustion and engine dynamics.
|4.22.058, 4.26.011
|[[StarCD on Legion]]

|- style="vertical-align:top;"
|Stata/MP
|Stata is a statistics, data management, and graphics system. Stata/MP is the version of the package that runs on multiple cores.
|14
|[[Stata/MP on Legion]]

|- style="vertical-align:top;"
|TauP
|The TauP Toolkit is a seismic travel time calculator. In addition to travel times, it can calculate derivative information such as ray paths through the earth, pierce and turning points.
|2.1.2
|[http://www.seis.sc.edu/taup/ TauP home]

|- style="vertical-align:top;"
|Tephra2
|Tephra2 uses the advection diffusion equation to forecast tephra dispersion in a given location based on a user-defined set of eruptive conditions.
|normal-r149
|[https://vhub.org/resources/tephra2 Tephra2 home]

|- style="vertical-align:top;"
|Texinfo
|The GNU Documentation System. Texinfo uses a single source file to produce output in a number of formats, both online and printed (dvi, html, info, pdf, xml, etc.).
|5.2
|[http://www.gnu.org/software/texinfo/ Texinfo home]

|- style="vertical-align:top;"
|TeX Live
|TeX Live is an easy way to get up and running with the TeX document production system. It includes all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world.
|2014
|[https://www.tug.org/texlive/ TeX Live home]

|- style="vertical-align:top;"
|TopHat
|TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.
|2.0.14
|[http://tophat.cbcb.umd.edu/ TopHat home page]
[[TopHat on Legion]]

|- style="vertical-align:top;"
|Torch
|Torch is a scientific computing framework with wide support for machine learning algorithms that puts GPUs first. 
We provide a torch-deps module bundle that contains all the dependencies and creates a quick-install alias for Torch.
|
|[[Torch on RC Systems]]
[http://torch.ch Torch home page]

|- style="vertical-align:top;"
|Tracer
|Tracer is a program for analysing the trace files generated by Bayesian MCMC runs (that is, the continuous parameter values sampled from the chain). It can be used to analyse runs of BEAST, MrBayes, LAMARC and possibly other MCMC programs.
|1.6
|[http://tree.bio.ed.ac.uk/software/tracer/ Tracer home]

|- style="vertical-align:top;"
|TractoR
|TractoR is an R application for reading, writing, analysing and visualising magnetic resonance images.
|2.4.2 and 2.2.1
|[http://www.tractor-mri.org.uk/ TractoR homepage]
[[TractoR on Legion]]

|- style="vertical-align:top;"
|Trimmomatic
|A flexible read trimming tool for Illumina NGS data.
|0.33
|[http://www.usadellab.org/cms/?page=trimmomatic Trimmomatic home]

|- style="vertical-align:top;"
|Turbomole
|Turbomole an ab initio computational chemistry program that implements various quantum chemistry methods.
|6.6, 6.4
|[[Turbomole on Legion]]

|- style="vertical-align:top;"
|UDUNITS
|The UDUNITS package supports units of physical quantities. Its C library provides for arithmetic manipulation of units and for conversion of numeric values between compatible units.
|2.2.19
|[http://www.unidata.ucar.edu/software/udunits/ UDUNITS home]

|- style="vertical-align:top;"
|VarScan
|VarScan is a platform-independent mutation caller for targeted, exome, and whole-genome resequencing data generated on Illumina, SOLiD, Life/PGM, Roche/454, and similar instruments.
|2.3.7
|[[VarScan on Legion]]
[http://varscan.sourceforge.net/ VarScan website]

|- style="vertical-align:top;"
|VASP
|VAMP/VASP is a package for performing ab-initio quantum-mechanical
molecular dynamics (MD) using pseudo-potentials and a plane wave basis
set.
|5.4.1-24jun15
|[[VASP on Legion]]

|- style="vertical-align:top;"
|Velvet
|Sequence assembler for very short reads.
|1.2.10
|[https://www.ebi.ac.uk/~zerbino/velvet/ Velvet home]

|- style="vertical-align:top;"
|Vienna RNA 
|RNA Secondary Structure Prediction and Comparison

The Vienna RNA Package consists of a C code library and several stand-alone programs for the prediction and comparison of RNA secondary structures. 
|2.1.9 
|[[Vienna RNA on Legion]]
[http://www.tbi.univie.ac.at/~ivo/RNA/ Vienna RNA docs]
[http://www.tbi.univie.ac.at/~ronny/RNA/index.html Vienna RNA homepage]

|- style="vertical-align:top;"
|VisIt
|VisIt is a distributed, parallel visualization and graphical analysis tool for data defined on two- and three-dimensional (2D and 3D) meshes.
|2.9.2
|[[VisIt on Legion]]
[https://wci.llnl.gov/simulation/computer-codes/visit/ VisIt homepage]

|- style="vertical-align:top;"
|XMDS
|XMDS allows the fast and easy solution of sets of ordinary, partial and stochastic differential equations, using a variety of efficient numerical algorithms.
|2.2.2
|[[XMDS on Legion]]
[http://www.xmds.org/ XMDS home]

|}

See the [https://wiki.rc.ucl.ac.uk/wiki/Category:Legion_User_Guide RC Systems User Guide] for information about how to use these items and other available software. 

[[#top | back to top]]

=Applications available (maintained by departments)=

These packages are maintained by members of the departments listed. Support requests should nevertheless be directed to the [mailto:rc-support@ucl.ac.uk rc-support@ucl.ac.uk] email address.

Departmental modules are not visible by default - they can be shown by entering: 
<code>
 module load <department>-modules
</code>
Currently <department> can be either chemistry or physics. Typing:
<code>
 module avail
</code>
will then show you the available modules - departmental modules are listed at the end.
{|style="background-color:#F9F9F9;"
|- style="vertical-align:top;"
!Name
!Description
!Version no.
!Links
!Dept.
|- style="vertical-align:top;"
|CP2K
|CP2K performs atomistic and molecular simulations. Available in the chemistry-modules bundle.
|2.6.0
|[[CP2K on Legion]]
|Chemistry

|- style="vertical-align:top;"
|GULP
|GULP (General Utility Lattice Program) is a force-field program for performing a variety of tasks on a range of system types. Available in the chemistry-modules bundle.
|3.4, 4.0.3.mpi, 4.2.mpi, 4.4.mpi
|[[GULP on RC Systems]]
|Chemistry

|}

[[#top | back to top]]

=Applications Available only on Grace=

{|style="background-color:#F9F9F9;"
|- style="vertical-align:top;"
!Name
!Description
!Version no. installed
!Links

|- style="vertical-align:top;"
|ADF
|ADF is an accurate, parallelized, powerful computational chemistry program to understand and predict chemical structure and reactivity with density functional theory (DFT).
|2014.10
|[[ADF|ADF on Grace]]
[https://www.scm.com/ADF/ ADF home]

|}

=Applications being tested (experimental)=

Some of these applications are not publicly available yet, but we are seeking users to test them. Others are available under the "experimental-modules" module bundle.

(None at this time)

If an application is not available as an experimental module, please contact [mailto:rc-support@ucl.ac.uk rc-support@ucl.ac.uk] for instructions on how to test it.

[[#top | back to top]]

=Unsupported applications=

The following packages have been determined to not function properly on Legion.  If you have managed to get these packages to work on your own, we would be keen to hear from you so that we can provide these to our other users.

(None at this time)

[[#top | back to top]]
