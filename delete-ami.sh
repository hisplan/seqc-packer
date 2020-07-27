#!/bin/bash

usage()
{
cat << EOF
USAGE: `basename $0` [options]

    -a  AWS EC2 AMI ID
    -s  AWS EC2 snapshot ID

EOF
}

while getopts "a:s:h" OPTION
do
    case $OPTION in
        a) ami_id=$OPTARG ;;
        s) snapshot_id=$OPTARG ;;
        h) usage; exit 1 ;;
        *) usage; exit 1 ;;
    esac
done

if [ -z "$ami_id" ]
then
    usage
    exit 1
fi

if [ -z "$snapshot_id" ]
then
    usage
    aws ec2 describe-images --image-ids ${ami_id}
    exit 1
fi

aws ec2 deregister-image --image-id ${ami_id}
aws ec2 delete-snapshot --snapshot-id ${snapshot_id}

echo "DONE."
