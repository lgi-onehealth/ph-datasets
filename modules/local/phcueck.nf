process PHCUECK {
    tag "${meta.id}"
    label 'process_low'
    conda (params.enable_conda ? "bioconda::phcue-ck=0.1.2" : null)
    container "lighthousegenomics/phcue-ck:v0.1.2"

    input:
    val(meta)

    output:
    tuple val(meta), path("*.json"), emit: json
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    """
    phcue-ck \\
        ${args} \\
        -a ${meta.id} \\
        > ${meta.id}_phcueck.json
    
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        phcueck: \$(echo \$(phcue-ck --version 2>&1) | sed 's/^.*phcue-ck //g' )
    END_VERSIONS
    """
}
