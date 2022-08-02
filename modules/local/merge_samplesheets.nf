process MERGE_SAMPLESHEETS {
    tag "samplesheet.csv"
    label 'process_low'

    conda (params.enable_conda ? "bioconda::csvtk=0.23.0" : null)
    container "andersgs/csvtk:v0.24.0"

    input:
    path(samplesheets)

    output:
    path "samplesheet.csv"        , emit: samplesheet
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    csvtk concat *_samplesheet.csv | csvtk sort -k sample_id > samplesheet.csv

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        csvtk: \$(echo \$(csvtk version 2>&1) | sed 's/^.*csvtk //g' )
    END_VERSIONS
    """
}
