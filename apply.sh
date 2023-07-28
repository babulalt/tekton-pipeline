#!/bin/bash

# Check if the namespace parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi

# Store the namespace passed as a parameter
NAMESPACE=$1

# Function to apply Kubernetes resources in the specified namespace
apply_resources() {
  kubectl create ns $NAMESPACE
  kubectl apply -f resource.yaml -n $NAMESPACE
  kubectl apply -f task-clone.yaml -n $NAMESPACE
  kubectl apply -f task-lint.yaml -n $NAMESPACE
  kubectl apply -f task-test.yaml -n $NAMESPACE
  kubectl apply -f task-build.yaml -n $NAMESPACE
  kubectl apply -f pipeline.yaml -n $NAMESPACE
  kubectl create -f pipeline-run.yaml -n $NAMESPACE
  echo "Successfully created all resources."
}

# Call the function to apply resources
apply_resources
