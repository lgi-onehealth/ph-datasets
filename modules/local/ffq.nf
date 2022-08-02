
process FFQ {
    tag "$meta.id"
    label 'process_low'
    maxForks 1

    conda (params.enable_conda ? "bioconda::ffq=0.2.1" : null)
    container "andersgs/ffq:v0.2.1"

    input:
    val(meta)

    output:
    tuple val(meta), path("*.json"), emit: ffq
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    ffq --ftp ${meta.id} > ${meta.id}_ffq.json

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        ffq: 0.2.1
    END_VERSIONS
    """
}
