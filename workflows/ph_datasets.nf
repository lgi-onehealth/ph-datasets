// The main workflow
include { PROCESS_METADATA } from '../modules/local/process_metadata.nf'
include { FFQ } from '../modules/local/ffq.nf'

if (params.list) {
    list_sources()
    exit(0)
}

def dataset = params.sources.find {data -> data.key == params.key}
println "Working on dataset: ${dataset.key}..."
def input_file = file(dataset.data)


workflow PH_DATASETS {

    main:
        PROCESS_METADATA(input_file)
        sra_ids = PROCESS_METADATA.out.sra
                    .splitText()
                    .map {sra_id -> [id: sra_id.trim()]}
                    .take(2)
        FFQ(sra_ids)
    emit:
        metadata = PROCESS_METADATA.out.metadata
        sra_id = PROCESS_METADATA.out.sra
}   


def list_sources() {
    for(source in params.sources) {
        println "-"*45
        println "key: " + source.key
        println "organism: " + source.organism
        println "description: " + source.description
    }
    println "-"*45
}
