// A workflow to download data from Public Health Datasets

include { PH_DATASETS } from "./workflows/ph_datasets.nf"

workflow {
    PH_DATASETS()
}