#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://repo1.maven.org/maven2/com/orientechnologies

dl()
{
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3
    local edition=$4
    local archive_type=${5:-tar.gz}
    local fq_ver="${major_ver}.${minor_ver}.${patch_ver}"
    local file="orientdb-${edition}-${fq_ver}.${archive_type}"
    local url="${MIRROR}/orientdb-${edition}/${fq_ver}/${file}"
    local lfile="${DIR}/${file}"

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $fq_ver $(sha256sum $lfile | awk '{print $1}')
}

dl 3 2 13 community
