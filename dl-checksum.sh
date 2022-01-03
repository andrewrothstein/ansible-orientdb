#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://s3.us-east-2.amazonaws.com


dl()
{
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3
    local archive_type=${4:-tar.gz}
    local fq_ver="${major_ver}.${minor_ver}.${patch_ver}"
    local file="orientdb-${fq_ver}.${archive_type}"
    local url="${MIRROR}/orientdb${major_ver}/releases/${fq_ver}/${file}"
    local lfile="${DIR}/${file}"

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $fq_ver $(sha256sum $lfile | awk '{print $1}')
}

dl 3 1 15
#dl 3 2 4
