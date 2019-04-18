#!/bin/bash -e

# run packer
# send stdout to build.log
packer build \
    -only=amazon-ebs \
    -machine-readable \
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

# get ebs snapshot id
ebs_snapshot_id=`aws ec2 describe-images --image-ids ${ami_id} | jq -r .Images[].BlockDeviceMappings[0].Ebs.SnapshotId`

echo "EBS Snapshot ID: ${ebs_snapshot_id}"
