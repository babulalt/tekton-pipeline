#!/bin/bash

# Check if the namespace parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi

# Store the namespace passed as a parameter
NAMESPACE=$1

# Function to delete Kubernetes resources in the specified namespace in reverse order
delete_resources() {
  kubectl delete -f pipeline.yaml -n $NAMESPACE
  kubectl delete -f task-build.yaml -n $NAMESPACE
  kubectl delete -f task-test.yaml -n $NAMESPACE
  kubectl delete -f task-lint.yaml -n $NAMESPACE
  kubectl delete -f task-clone.yaml -n $NAMESPACE
  kubectl delete -f resource.yaml -n $NAMESPACE
  kubectl delete ns $NAMESPACE
  echo "Successfully deleted all resources."
}

# Call the function to delete resources
delete_resources
