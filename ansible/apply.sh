#!/bin/sh -x

INVENTORY=${INVENTORY:-"localhost,"}
if [ "${INVENTORY}" == "localhost," ]; then
    CONNECTION_TYPE="-c local"
fi
if [ -n "${INVENTORY_HOST}" ]; then
  LIMIT_HOST="-l ${INVENTORY_HOST}"
fi
ROLE=${1}
shift

ansible-playbook -i ${INVENTORY} ${LIMIT_HOST} ${CONNECTION_TYPE} -K -e "apply_role=${ROLE}" $@ apply.yml
