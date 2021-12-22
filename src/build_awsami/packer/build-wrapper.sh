#!/bin/bash
#
# Wraps the build process for validations, etc
#

# TODO: validate environment variables before execution

REPOSITORY_URL="https://github.com/ut-is/ut.git"

usage(){
cat <<EOF

  usage: build-wrapper.sh [ARGUMENTS]

    --subnet-id        [Subnet ID]           - REQUIRED
    --subnet-type      [Subnet Type]         - REQUIRED.  public or private
    --vpc-id           [VPC ID]              - REQUIRED
    --instance-profile-name
                       [Profile Name]        - REQUIRED
    --ut-version     [Number Version]      - OPTIONAL.  If omitted, master branch will be used.

    Example:

   build-wrapper.sh \\
                    --subnet-id subnet-99999999 \\
                    --subnet-type private \\
                    --vpc-id vpc-99999999 \\
                    --instance-profile-name ut-packer-123abc \\
                    --ut-version 0.2.34 \\

EOF
}

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        --help)
            usage
            shift
            exit 0
            ;;
        --ut-version)
            UT_VERSION="$2"
            shift
            shift
            ;;
        --vpc-id)
            VPC_ID="$2"
            shift
            shift
            ;;
        --subnet-id)
            SUBNET_ID="$2"
            shift
            shift
            ;;
        --subnet-type)
            SUBNET_TYPE="$2"
            shift
            shift
            ;;
        --instance-profile-name)
            INSTANCE_PROFILE_NAME="$2"
            shift 2
            ;;
    esac
done

UT_NAME_VERSION="$UT_VERSION"  # Used by AMI name


if [ "$SUBNET_TYPE" == "public" ]; then
    ASSOCIATE_PUBLIC_IP_ADDRESS="true"
    SSH_INTERFACE="public_ip"
elif [ "$SUBNET_TYPE" == "private" ]; then
    ASSOCIATE_PUBLIC_IP_ADDRESS="false"
    SSH_INTERFACE="private_ip"
else
    echo "Invalid subnet type.  Valid types are public or private."
    exit 1
fi

export AWS_MAX_ATTEMPTS=600  # Builds time out with default value
#packer build -on-error=abort --var ut_name_version="$UT_NAME_VERSION" \
packer build -on-error=abort  --var ut_name_version="$UT_NAME_VERSION" \
             --var ut_version="$UT_VERSION" \
             --var subnet_id="$SUBNET_ID" \
             --var associate_public_ip_address="$ASSOCIATE_PUBLIC_IP_ADDRESS" \
             --var ssh_interface="$SSH_INTERFACE" \
             --var vep_version="$VEP_VERSION" \
             --var vpc_id="$VPC_ID" \
             --var instance_profile_name="$INSTANCE_PROFILE_NAME" \
             --var-file=build.vars \
             amazon-linux.json
