#!/bin/sh

INVENTORY=${INVENTORY:-"localhost,"}
if [ "${INVENTORY_TYPE}" == "localhost," ]; then
    CONNECTION_TYPE="-c local"
fi
ROLE=${1}
shift

ansible-playbook -i ${INVENTORY} ${CONNECTION_TYPE} -e "apply_role=${ROLE}" $@ apply.yaml
