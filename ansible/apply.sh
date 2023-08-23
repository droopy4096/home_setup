#!/bin/sh -x

INVENTORY=${INVENTORY:-"localhost,"}
if [ "${INVENTORY}" == "localhost," ]; then
    CONNECTION_TYPE="-c local"
fi
ROLE=${1}
shift

ansible-playbook -i ${INVENTORY} ${CONNECTION_TYPE} -e "apply_role=${ROLE}" $@ apply.yaml
