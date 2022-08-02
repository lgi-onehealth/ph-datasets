// The main workflow
include { PROCESS_METADATA } from '../modules/local/process_metadata.nf'
include { FFQ } from '../modules/local/ffq.nf'
include { DOWNLOAD_FASTQ } from '../modules/local/download_fastq.nf'
include { SRA_TO_SAMPLESHEET } from '../modules/local/sra_to_samplesheet.nf'
include { MERGE_SAMPLESHEETS } from '../modules/local/merge_samplesheets.nf'

if (params.list) {
    list_sources()
    exit(0)
}

def dataset = params.sources.find {data -> data.key == params.key}
println "Working on dataset: ${dataset.key}..."
def input_file = file(dataset.data)


workflow PH_DATASETS {

    main:
        versions_ch = Channel.empty()

        PROCESS_METADATA(input_file)
        versions_ch.mix(PROCESS_METADATA.out.versions)

        sra_ids = PROCESS_METADATA.out.sra
                    .splitText()
                    .map {sra_id -> [id: sra_id.trim()]}
        FFQ(sra_ids)
        versions_ch = versions_ch.mix(FFQ.out.versions)

        DOWNLOAD_FASTQ(FFQ.out.ffq)
        versions_ch = versions_ch.mix(DOWNLOAD_FASTQ.out.versions)

        samplesheet_ch = DOWNLOAD_FASTQ.out.reads.map {meta, reads ->
                         meta.single_end = !(reads instanceof List && reads.size() == 2)
                         return [meta, reads]
                        }
        
        SRA_TO_SAMPLESHEET(samplesheet_ch)
        
        merge_samplesheet_ch = SRA_TO_SAMPLESHEET.out.samplesheet
                                .map {meta, samplesheet -> samplesheet}
                                .collect()
        
        MERGE_SAMPLESHEETS(merge_samplesheet_ch)
        versions_ch = versions_ch.mix(MERGE_SAMPLESHEETS.out.versions)
        versions_ch.unique().collectFile(name: 'software_versions.yml', storeDir: "${params.tracedir}")

    emit:
        metadata = PROCESS_METADATA.out.metadata
        sra_id = PROCESS_METADATA.out.sra
        reads = samplesheet_ch
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
