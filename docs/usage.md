## TLDR

!!! tldr "List the datasets, and specify the dataset to download using the `--key` flag"
    ```bash
        nextflow run lgi-onehealth/ph-datasets --list
        nextflow run lgi-onehealth/ph-datasets [-profile <conda|docker>] --key Se-1203NYJAP-1
    ```

## The basic workflow

A typical run of the workflow will look like this:

```bash
nextflow run lgi-onehealth/ph-datasets --list
```

The above command will output a list of all the available datasets. 

Here is an excerpt of what it will look like:

```bash
---------------------------------------------
key: Se-1203NYJAP-1
organism: Salmonella enterica
description: Salmonella enterica serovar Bareilly 1203NYJAP-1 Tuna Scrape Outbreak
---------------------------------------------
key: Lm-1408MLGX6-3WGS
organism: Listeria monocytogenes
description: Listeria monocytogenes stone fruit outbreak
---------------------------------------------
...
---------------------------------------------
key: SC2-nonvoivoc
organism: SARS-CoV-2
description: SARS-CoV-2 non-VOI/VOC sequence data
---------------------------------------------
key: SC2-voivoc
organism: SARS-CoV-2
description: SARS-CoV-2 VOI/VOC sequence data
---------------------------------------------
```

Once you determine the key of the dataset you want to download, you can run the workflow with the following command:

```bash
nextflow run lgi-onehealth/ph-datasets --key SC2-voivoc [-profile <conda|docker>]
```

The `-profile` portion is optional. You should use it if you don't have all the tools installed in your `$PATH`.

## Update the workflow

To ensure you are always up to date with the latest version of the workflow, you can add the `-latest` flag to the command. For example:

```bash
nextflow run lgi-onehealth/ph-datasets -latest [-profile <conda|docker>] --key SC2-voivoc
```

## Run a specific version of the workflow

To specify a specific commit or tag of the workflow to run, use the `-r` option. For example:

```bash
nextflow run lgi-onehealth/ph-datasets -r v0.1.0 [-profile <conda|docker>] --key SC2-voivoc
```

## The workflow outputs

The workflow will create, by default, a folder called `datasets` in the directory that you run the workflow from.

In the that folder, there will be three subfolders:

* `fastq` - contains the raw fastq files organised into subfolders named after the accession
* `metadata` - contains three files:
  * `metadata.csv` - contains the metadata for the dataset as provided by the repository, with one row per sample/accession
  * `metadataset.yml` - contains the key:value metadata for the dataset as provided in the header of the datafile in the repository
  * `samplesheet.csv` - contains the full path for each downloaded FASTQ file with one row per accession (this is useful for downstream analyses)
* `pipeline_info` - contains the pipeline runtime report, timeline, trace, and DAG, as well as a yaml with all the software versions used while executing the pipeline.

The folder structure for the test example looks like this:

```bash
datasets
├── fastq
│   ├── SRR17231514
│   │   ├── SRR17231514_1.fastq.gz
│   │   ├── SRR17231514_2.fastq.gz
│   │   └── SRR17231514_phcueck.json
│   └── SRR17231530
│       ├── SRR17231530_1.fastq.gz
│       ├── SRR17231530_2.fastq.gz
│       └── SRR17231530_phcueck.json
├── metadata
│   ├── metadata.csv
│   ├── metadataset.yml
│   └── samplesheet.csv
└── pipeline_info
    ├── execution_report_2022-08-25_09-26-55.html
    ├── execution_timeline_2022-08-25_09-26-55.html
    ├── execution_trace_2022-08-25_09-26-55.txt
    ├── execution_trace_2022-08-25_09-40-02.txt
    ├── pipeline_dag_2022-08-25_09-26-55.html
    └── software_versions.yml
```

