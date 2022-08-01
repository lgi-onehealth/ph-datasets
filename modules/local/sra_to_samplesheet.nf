process SRA_TO_SAMPLESHEET {
    tag "${meta.id}"

    executor "local"

    input:
    tuple val(meta), path(fastq)

    output:
    tuple val(meta), path("*_samplesheet.csv"), emit: samplesheet

    exec:
        // Create a samplesheet for a single sample 
        def samplesheet = "sample_id,fastq_1,fastq_2\n"
        def fastq_1 = new File(workflow.launchDir, params.outdir, "fastq", "${fastq[0]}")
        def fastq_2 = meta.single_end ? "": new File(workflow.launchDir, params.outdir, "fastq", "${fastq[1]}")
        samplesheet += "${meta.id},${fastq_1.getAbsolutePath()},${fastq_2.getAbsolutePath()}\n"

        def samplesheet_file = task.workDir.resolve("${meta.id}_samplesheet.csv")
        samplesheet_file.text = samplesheet
}