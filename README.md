# packer-seqc

## How to Build

Increment `image_version`.

```json
{
    "variables": {
        "image_version": "a1",
        "seqc_version": "0.2.5",
        "maintainer": "chunj@mskcc.org"
    },
    ...
```

```bash
$ ./make-ami.sh
```

## Enlisting as Official AMI

After the SEQC AMI has been successfully created, you can add a special signature to the SEQC AMI (as a tag). This will allow you to see the list of all the official AMIs by running `show-ami-list.sh`.

```bash
$ ./add-ami-to-list.sh -a ami-0530a8e9d69e60500
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
    }
]
```
