#!/bin/bash

cp lib/templatesubmit.htc lib/condorsubmit.htc
echo arguments = ${xml_file} >> lib/condorsubmit.htc
echo transfer_input_files = ${xml_file} >> lib/condorsubmit.htc
echo queue >> lib/condorsubmit.htc

jobid=`condor_submit lib/condorsubmit.htc`
jobid=`echo $jobid | sed -e 's/Sub.*uster //'`
jobid=`echo $jobid | sed -e 's/\.//'`

#echo $jobid

#echo going to monitor job $jobid
condor_tail -f $jobid

exit 0
