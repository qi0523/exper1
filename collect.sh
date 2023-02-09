#!/bin/bash

kubectl exec -n openwhisk owdev-scheduler-0 -- cat /tmp/scheduler.logs > ../res/scheduler.log

invokers=$(kubectl get pods -n openwhisk | grep invoker | awk '{print $1}')

array=($invokers)

num=${#array[@]}

for((i=0;i<num;i=$(($i+1))))
{
  kubectl exec ${array[i]} -n openwhisk -- cat /tmp/pull.logs > ../res/${array[i]}.log &
}