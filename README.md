# packer-seqc

## How to Build

Increment `image_version`.

```
{
    "variables": {
        "image_version": "0.0.4",
        "seqc_version": "0.2.3-alpha.3",
        "maintainer": "chunj@mskcc.org"
    },
    ...
```

```bash
$ ./make-ami.sh
```
