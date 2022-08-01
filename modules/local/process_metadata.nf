
process PROCESS_METADATA {
    tag "${metadata}"
    label 'process_low'

    conda (params.enable_conda ? "python=3.10" : null)
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/YOUR-TOOL-HERE':
        'quay.io/biocontainers/YOUR-TOOL-HERE' }"

    input:
    path metadata

    output:
    path "metadata.csv", emit: metadata
    path "sra.csv", emit: sra
    path "metadataset.yml", emit: metadataset
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    process_metadata.py --input $metadata

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        python: \$(echo \$(python --version 2>&1) | sed 's/^.*Python //g' )
        process_metadata.py: \$(echo \$(process_metadata.py --version) | sed 's/^.*process_metadata.py //g' )
    END_VERSIONS
    """
}
