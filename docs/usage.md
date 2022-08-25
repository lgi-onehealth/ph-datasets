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

## The workflow outputs

