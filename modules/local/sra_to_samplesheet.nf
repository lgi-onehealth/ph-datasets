process SRA_TO_SAMPLESHEET {
    tag "${meta.id}"

    executor "local"

    input:
    tuple val(meta), path(fastq)

    output:
    tuple val(meta), path("*_samplesheet.csv"), emit: samplesheet

    exec:
        // Create a samplesheet for a single sample
        def baseDir = workflow.launchDir
        def samplesheet = "sample_id,fastq_1,fastq_2\n"
        def fastq_1 = [baseDir, params.outdir, "fastq", "${fastq[0]}"].join("/").replaceAll("/{2,}", "/")
        def fastq_2 = meta.single_end ? "":  [baseDir, params.outdir, "fastq", "${fastq[1]}"].join("/").replaceAll("/{2,}", "/")
        samplesheet += "${meta.id},${fastq_1},${fastq_2}\n"

        def samplesheet_file = task.workDir.resolve("${meta.id}_samplesheet.csv")
        samplesheet_file.text = samplesheet
}