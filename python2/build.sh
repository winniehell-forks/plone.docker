#!/usr/bin/env bash

set -o errexit
set -o nounset

buildDeps=(
  default-libmysqlclient-dev
  dpkg-dev
  gcc
  libbz2-dev
  libc6-dev
  libffi-dev
  libjpeg62-turbo-dev
  libldap2-dev
  libopenjp2-7-dev
  libpcre3-dev
  libpq-dev
  libsasl2-dev
  libssl-dev
  libtiff5-dev
  libxml2-dev
  libxslt1-dev
  virtualenv
  wget
  zlib1g-dev
)

apt-get update
apt-get install -y --no-install-recommends "${buildDeps[@]}"

wget "https://dist.plone.org/release/${PLONE_VERSION}/requirements.txt"
echo "${REQUIREMENTS_MD5} requirements.txt" | md5sum -c -

wget "https://dist.plone.org/release/${PLONE_VERSION}/versions.cfg"
echo "${VERSIONS_MD5} versions.cfg" | md5sum -c -

virtualenv .
bin/pip install --no-cache-dir -r requirements.txt
bin/buildout
