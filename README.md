# Cell Type Distribution Analysis

## Requirements

1. Pull the docker image : bioconductor/bioconductor_docker. This image comes pre-installed with the rstudio and most of the required libraries. If Seurat and its dependencies are not installed, install the them (Seurat, SeuratDisk, patchwork and dplyr) using the rstudio :  `docker pull bioconductor/bioconductor_docker`.
2. Clone the github repository ![portal_client](https://github.com/IGS/portal_client) and build its docker image.

## Fetch the files
We can use the portal client repository to interact with NeMO data portal. For this, we just supply the generated manifest files as a parameter and the client downloads all the files in a compressed format. 

`docker run -it --rm -v (pwd):/tmp portal_client portal_client --manifest /tmp/NeMO_manifest_9765c85ed.tsv --destination /tmp/data`

Once the required files are downloaded, we can unzip.

## Convert to appropriate format
The files that NeMO provides us with, are in MTX and TSV format, whereas azimuth expects files in H5Seurat format. So, I have written an R program to convert the files to the required format.
These files can now be uploaded on azimuth.
The aggregated data can be found in this ![google_sheet](https://docs.google.com/spreadsheets/d/16-MHAkZ21QG6GLut7cu6JQ47OF5o8tXE7hiEBBhphFA/edit?usp=sharing)

