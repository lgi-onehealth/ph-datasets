// The main workflow

include { FFQ } from '../modules/local/ffq.nf'

if (params.list) {
    list_sources()
    exit(0)
}


workflow PH_DATASETS {

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
