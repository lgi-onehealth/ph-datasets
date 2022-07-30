#!/usr/bin/env nextflow

include { FFQ } from '../../../modules/local/ffq.nf'

workflow test_ffq {
    
    input = [ 
        id:'SRR12826465' 
    ]

    FFQ ( input )
}