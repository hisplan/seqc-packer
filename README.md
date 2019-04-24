# packer-seqc

## How to Build

Increment `image_version`.

```
{
    "variables": {
        "image_version": "a1",
        "seqc_version": "0.2.3-alpha.5",
        "maintainer": "chunj@mskcc.org"
    },
    ...
```

```bash
$ ./make-ami.sh
```
