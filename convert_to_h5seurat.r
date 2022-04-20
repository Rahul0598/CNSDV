library(dplyr)
library(Seurat)
library(patchwork)
library(SeuratDisk)
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("mojaveazure/seurat-disk")

setwd('/home/rstudio')
filenames <- c(
  'filtered_feature_bc_matrix',
  'GW18_motor',
  'GW19_M1_all',
  'GW19_M1_CP',
  'GW20_motor',
  'GW22_motor1',
  'GW22_motor2',
  'GW22T_motor1',
  'GW22T_motor2'
)
for (filename in filenames) {
  files = list.files(filename)
  barcodes_file <- sprintf('%s/%s/%s', getwd(), filename, files[1])
  features_file <- sprintf('%s/%s/%s', getwd(), filename, files[2])
  mtx_file <- sprintf('%s/%s/%s', getwd(), filename, files[3])
  expression_matrix <- ReadMtx(mtx=mtx_file, features=features_file, cells=barcodes_file)
  seurat_object <- CreateSeuratObject(counts = expression_matrix)
  SaveH5Seurat(seurat_object, sprintf('%s.h5seurat', filename))
}