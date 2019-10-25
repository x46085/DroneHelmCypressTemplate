#!/bin/bash
set -x

source $HELMCONFIG

kubectl \
  --kubeconfig=deploy/kubeconfig \
  --namespace $NAMESPACE \
  delete pods \
  -l test=true

helm --kubeconfig=deploy/kubeconfig test $RELEASE --parallel --debug --timeout 1200

exit_code=$?

kubectl \
  --kubeconfig=deploy/kubeconfig \
  --namespace $NAMESPACE \
  delete pods \
  -l test=true \
  --field-selector 'status.phase=Succeeded'

test_results_service_url="https://$FQDN/test-results/"
echo ""
echo "Pinging test-results service to trigger downloads: $test_results_service_url"
echo ""
curl $test_results_service_url
echo ""
echo "Test Results Available Here: "
echo "  - Mochawesome Report:      https://$FQDN/test-results/"
echo "  - Cypress Failure Videos:  https://$FQDN/test-results/assets/"
echo ""
# This allows the test runner to run it's course, all subsquent commands will
# noop appropriately but we want them to run for cleanups sake
exit $exit_code
