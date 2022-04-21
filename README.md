# Cell Type Distribution Analysis

## Requirements

1. Pull the docker image : `bioconductor/bioconductor_docker:devel`. This image comes pre-installed with the rstudio and most of the required libraries. If Seurat and its dependencies are not installed, install them (Seurat, SeuratDisk, patchwork and dplyr) using the rstudio GUI : 
  - `docker pull bioconductor/bioconductor_docker`.
  - `docker run -it --name bioc -v (pwd)/data:~/ -e PASSWORD=password -p 8788:8787 bioconductor/bioconductor_docker:devel`
4. Clone the github repository ![portal_client](https://github.com/IGS/portal_client) and build its docker image.

## Fetch the files
We can use the portal client repository to interact with NeMO data portal. For this, we need to supply the generated manifest file as a parameter and the client downloads all the files in a compressed format. 

`docker run -it --rm -v (pwd):/tmp portal_client portal_client --manifest /tmp/NeMO_manifest_9765c85ed.tsv --destination /tmp/data`

Once the required files are downloaded, we can unzip.

## Convert to appropriate format
The files that NeMO provides us with, are in MTX and TSV format, whereas azimuth expects files in H5Seurat format. So, I have written an R script to convert the files to the required format which can now be uploaded on azimuth.

The aggregated data can be found in this google sheet : https://docs.google.com/spreadsheets/d/16-MHAkZ21QG6GLut7cu6JQ47OF5o8tXE7hiEBBhphFA/edit?usp=sharing

