# ph-datasets: A Nextflow workflow for downloading benchmarking public health datasets

## Background
As part of validating bioinformatic pipelines, we need benchmarking and ground truth datasets for our pipelines. Timme _et al_. (2017)
published a first set of public health datasets for outbreak investigation using genomic data in foodborne bacterial pathogens. As part 
of the publication, they created a GitHub repository with descritptions of the datasets they described in their papers (https://github.com/WGS-standards-and-analysis/datasets). A number of organisations have since forked this repository, and added their own data.

Here, we provide a Nextflow workflow that will download the datasets described in the paper, and hosted in the original GitHub repository.
We have also added a few datasets from some of the forked repositories.

Source repositories:

* https://github.com/WGS-standards-and-analysis/datasets
* https://github.com/globalmicrobialidentifier-WG3/datasets
* https://github.com/CDCgov/datasets-sars-cov-2

## Using the workflow

## References
Timme, R. E., Rand, H., Shumway, M., Trees, E. K., Simmons, M., Agarwala, R., Davis, S., Tillman, G. E., Defibaugh-Chavez, S., Carleton, H. A., Klimke, W. A., & Katz, L. S. (2017). Benchmark datasets for phylogenomic pipeline validation, applications for foodborne pathogen surveillance. PeerJ, 5, e3893. [https://doi.org/10.7287/peerj.3893](https://doi.org/10.7287/peerj.3893)