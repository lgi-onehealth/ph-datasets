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

## Running a test

Once you have nextflow installed, you can run a small test to make sure it is working.

```bash
mkdir test_run && cd test_run
nextflow run lgi-onehealth/ph-datasets -profile test[,<conda|docker>]
```

To run the test, you need to set `-profile` to `test`. 

!!! Note
    If you don't have the tools installed in your `$PATH`, you can also set `-profile` to `test,docker` to run with Docker or `test,conda` to run with Conda.

This will download a small dummy dataset created to test the pipeline. It consists of 
sequence data for two Zika virus samples. The files are about 2MB in size each. The test
run takes about 15s to run on my laptop with a standard WiFi connection. If you are running with 
Conda for the first time, it may take a little longer as it will need to create the appropriate
conda environments.
