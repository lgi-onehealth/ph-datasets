## Installing Nextflow

The pipeline is written in Nextflow, and requires it to be able to run.

### Native install

Good instructions on installing Nextflow can be found here: [https://www.nextflow.io/docs/latest/getstarted.html](https://www.nextflow.io/docs/latest/getstarted.html).

### Using conda

If you are using Conda, you can install Nextflow into an existing environment with the following command:

```bash
conda install -c conda-forge -c bioconda nextflow
```

Or, you can create a new environment with the following:

```bash
conda create -c conda-forge -c bioconda -n nextflow nextflow
```

## Running it with Docker

If you do not wish to install Nextflow, you can run it with Docker.

Here is an example command to list all the available datasets using Nextflow installed on Docker:

```bash
docker run -it -v $(pwd):/data nextflow run lgi-onehealth/ph-datasets -profile docker --list
```
