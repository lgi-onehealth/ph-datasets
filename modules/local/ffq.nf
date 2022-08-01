
process FFQ {
    tag "$meta.id"
    label 'process_low'

    conda (params.enable_conda ? "bioconda::ffq=0.2.1 conda-forge::jq=1.6" : null)
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/YOUR-TOOL-HERE':
        'quay.io/biocontainers/YOUR-TOOL-HERE' }"

    input:
    val(meta)

    output:
    tuple val(meta), path("*.fastq.gz"), emit: reads
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    ffq --ftp ${meta.id} \
        | grep -Eo '"url": "[^"]*"' \
        | grep -o '"[^"]*"\$' \
        | xargs -n1 curl -O

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        ffq: 0.2.1
    END_VERSIONS
    """
}
