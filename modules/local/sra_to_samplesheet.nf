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
        def fastq_1 = "${params.outdir}/fastq/${fastq[0]}"
        def fastq_2 = meta.single_end ? "": "${params.outdir}/fastq/${fastq[1]}"
        samplesheet += "${meta.id},${fastq_1},${fastq_2}\n"

        def samplesheet_file = task.workDir.resolve("${meta.id}.samplesheet.csv")
        samplesheet_file.text = samplesheet
}