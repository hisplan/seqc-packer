#!/bin/bash

# special signature indicating that this is a SEQC AMI.
# do not change the value. this is being used in multiple repositories.
signature="708B13E3-3207-4C96-836B-E3AE591EEA47"

usage()
{
cat << EOF
USAGE: `basename $0` [options]

    -a  AWS AMI ID

EOF
}

while getopts "a:h" OPTION
do
    case $OPTION in
        a) ami_id=$OPTARG ;;
        h) usage; exit 1 ;;
        *) usage; exit 1 ;;
    esac
done

if [ -z "$ami_id" ]
then
    usage
    exit 1
fi

aws ec2 create-tags \
    --resources=${ami_id} \
    --tags Key=Signature,Value=${signature}

echo "DONE."
