# packer-seqc

This package automates the creation of SEQC AMI (Amazon Machine Image). The AMI will contain SEQC, Docker, Miniconda, STAR, and samtools.

## Prerequisites

- AWS CLI 1.10.47+ (https://aws.amazon.com/cli/)
- Packer 1.5.4+ (https://packer.io/downloads.html)
- Python 3+

Make sure that you can run the following commands from your bash terminal:

```
$ aws --version
aws-cli/1.16.217 Python/3.7.3 Darwin/18.7.0 botocore/1.12.249

$ packer --version
1.4.1

$ python --version
Python 3.7.3
```

## Building SEQC AMI

To create a SEQC AMI in the `us-east-1` region (based on `ami-0ab4d1e9cf9a1215a` / `amzn2-ami-hvm-2.0.20210617.0-x86_64-gp2`):

```bash
$ ./make-ami.sh -r us-east-1
```

To create a SEQC AMI in the `eu-west-1` region (based on `ami-02f24ad9a1d24a799` / `amzn2-ami-hvm-2.0.20210617.0-x86_64-gp2`):

```bash
$ ./make-ami.sh -r eu-west-1
```

## Incrementing Image Version

Increment `image_version` in the `seqc.packer` file:

```json
{
    "variables": {
        "image_version": "a1",
        "seqc_version": "0.2.10",
        "maintainer": "chunj@mskcc.org"
    },
    ...
```

## Enlisting as Official AMI

(*) _This is only for SCRI (Single-Cell Research Inititive)_

After the SEQC AMI has been successfully created, you can add a special signature to the SEQC AMI (as a tag). This will allow you to see the list of all the official AMIs by running `show-ami-list.sh`.

```bash
$ ./add-ami-to-list.sh -a ami-0a4d2955fe21dee72
```

```bash
$ ./show-ami-list.sh

[
    {
        "ID": "ami-0530a8e9d69e60500",
        "Name": "seqc-v0.2.4_a1"
    },
    {
        "ID": "ami-05fd54e8d80f2665f",
        "Name": "seqc-v0.2.3-alpha.5_a1"
    },
    {
        "ID": "ami-0a4d2955fe21dee72",
        "Name": "seqc-v0.2.5_a2"
    },
    {
        "ID": "ami-0c97def6c08694a9a",
        "Name": "seqc-v0.2.9_a1"
    },
    {
        "ID": "ami-0f7bddb56c574069c",
        "Name": "seqc-v0.2.7_a3"
    },
    {
        "ID": "ami-0fa8f038a73ccd865",
        "Name": "seqc-v0.2.10_a1"
    }
]
```
