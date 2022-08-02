#!/usr/bin/env nextflow

include { MERGE_SAMPLESHEETS } from '../../../modules/local/merge_samplesheets.nf'

workflow test_merge_samplesheets {
    
    input = [
        file("$baseDir/tests/data/test1_samplesheet.csv"),
        file("$baseDir/tests/data/test2_samplesheet.csv")
    ]
    MERGE_SAMPLESHEETS ( input )

}