#!/usr/bin/env bash
set -e
set -x

branch=$DRONE_COMMIT_BRANCH
tag=$DRONE_TAG
DOMAIN="x46085.com"

# app.x46085.com
FQDN="app.${DOMAIN}"
RELEASE="dev-stack"
NAMESPACE="dev-stack"

# ab-1234-app.x46085.com
branch_pattern="[a-z]+-[0-9]+"

if [[ "${branch}" != "development" ]]; then

  # Check for branch prefix
  prefix="$(echo "${branch}" | grep -E -i -o "${branch_pattern}" | tr '[:upper:]' '[:lower:]')"
  if [[ -z "${prefix}" ]]; then
    echo "ERROR: branch name must contain a ticket number in the form of '"${branch_pattern}"': $branch"
    exit 1
  fi

  FQDN="${prefix}-${FQDN}"
  RELEASE="${prefix}-${RELEASE}"
  NAMESPACE="${prefix}-${NAMESPACE}"
fi

# `env_file` is sourced into other Drone steps for deployment and running tests
cat << EOF > fqdn_env_file
FQDN=${FQDN}
DOMAIN=${DOMAIN}
RELEASE=${RELEASE}
NAMESPACE=${NAMESPACE}
EOF

# Print some general info for future debugging
cat << EOF
FQDN:              ${FQDN}
RELEASE/NAMESPACE: ${RELEASE}
EOF
