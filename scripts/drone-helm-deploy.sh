#!/bin/bash
set -x

source $HELMCONFIG

helm init --client-only
helm dependency update $CHART

# file for dev
helm upgrade \
--debug \
--wait \
--timeout 500 \
--install $RELEASE $CHART \
--force \
--namespace $NAMESPACE \
--kubeconfig deploy/kubeconfig \
-f deploy/values.yaml

if [ $? -ne 0 ]; then
  echo "Pods, PVCs, and/or Services failed to reach Ready state"
  kubectl get pods --kubeconfig=deploy/kubeconfig --namespace=$NAMESPACE
  exit 1
fi
