#!/bin/bash

invokers=$(kubectl get pods -n openwhisk | grep invoker | awk '{print $1}')

array=($invokers)

num=${#array[@]}

for((i=0;i<num;i=$(($i+1))))
{
  #kubectl exec ${array[i]} -n openwhisk -- crictl rmi b00bf65799d58
  kubectl exec ${array[i]} -n openwhisk -- /rmi.sh &
}