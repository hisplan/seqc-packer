# packer-seqc

## How to Build

Increment `image_version`.

```
{
    "variables": {
        "image_version": "a3",
        "seqc_version": "0.2.3-alpha.4",
        "maintainer": "chunj@mskcc.org"
    },
    ...
```

```bash
$ ./make-ami.sh
```
