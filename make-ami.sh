#!/bin/bash -e

usage()
{
cat << EOF
USAGE: `basename $0` [options]
    -r  destination AMI region (e.g. us-east-1, eu-west-1, ...)
EOF
}

while getopts "r:h" OPTION
do
    case $OPTION in
        r) ami_region=$OPTARG ;;
        h) usage; exit 1 ;;
        *) usage; exit 1 ;;
    esac
done

if [ -z "$ami_region" ]
then
    usage
    exit 1
fi

# run packer
# send stdout to build.log
packer build \
    -only=amazon-ebs \
    -machine-readable \
    -var-file=config.${ami_region}.json \
    seqc.packer | tee build.log

# exit if packer failed
if [ $? -ne 0 ]
then
    echo "Failed!"
    exit 1
fi

# get ami id
ami_id=`grep 'artifact,0,id' build.log | cut -d, -f6 | cut -d: -f2`

echo "AMI ID: ${ami_id}"

if [ -z "$ami_id" ]
then
    echo "Unable to get AMI ID"
    exit 1
fi

# get ami metadata
image_meta=`aws ec2 describe-images --image-ids ${ami_id} --region ${ami_region}`

# get ebs snapshot id
ebs_snapshot_id=`echo ${image_meta} | python -c "import json; import sys; data=json.load(sys.stdin); print(data['Images'][0]['BlockDeviceMappings'][0]['Ebs']['SnapshotId'])"`

echo "EBS Snapshot ID: ${ebs_snapshot_id}"
