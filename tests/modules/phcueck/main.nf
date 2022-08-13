#!/usr/bin/env nextflow

include { PHCUECK } from '../../../modules/local/phcueck.nf'

workflow test_phcueck {
    
    input = [ 
        id:'SRR12826465' 
    ]

    PHCUECK ( input )
}