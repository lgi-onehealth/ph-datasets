#!/usr/bin/env nextflow

include { SRA_TO_SAMPLESHEET } from '../../../modules/local/sra_to_samplesheet.nf'

workflow test_sra_to_samplesheet {
    
    input = [
        [id: "test", single_end: false],
        [file("test_1.fastq.gz"), file("test_2.fastq.gz")],
    ]
    SRA_TO_SAMPLESHEET ( input )

}