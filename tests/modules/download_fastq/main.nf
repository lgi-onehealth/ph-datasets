#!/usr/bin/env nextflow

include { DOWNLOAD_FASTQ } from '../../../modules/local/download_fastq.nf'

workflow test_download_fastq {
    
    input = [[id: "SRR12826465"], "$launchDir/tests/data/SRR12826465_ffq.json"]

    DOWNLOAD_FASTQ ( input )
}