#!/usr/bin/env nextflow

include { PROCESS_METADATA } from '../../../modules/local/process_metadata.nf'

workflow test_process_metadata {
    
    input = file("https://raw.githubusercontent.com/WGS-standards-and-analysis/datasets/master/datasets/Salmonella_enterica_1203NYJAP-1.tsv")
    PROCESS_METADATA ( input )

}