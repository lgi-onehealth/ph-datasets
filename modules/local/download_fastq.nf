process DOWNLOAD_FASTQ {
    tag "${meta.id}"
    maxForks params.max_downloads

    conda (params.enable_conda ? "conda-forge::curl=7.83.1" : null)
    container "andersgs/ffq:v0.2.1"

    input:
    tuple val(meta), val(ffq)

    output:
    tuple val(meta), path("*.fastq.gz"), emit: reads
    path("versions.yml"), emit: versions

    script:
    """
    cat ${ffq} \
        | grep -Eo '"url": "[^"]*"' \
        | grep -o '"[^"]*"\$' \
        | xargs -n1 curl -O

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        curl: \$(echo \$(curl --version | head -n 1 | sed 's/^curl //; s/ .*\$//'))
    END_VERSIONS
    """
}