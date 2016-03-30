#!/usr/bin/bash

# Create a set of functions to start sqlplus sessions for
#   oracle databases, setting the correct ORACLE_HOME and
#   ORACLE_SID


# Loop over /etc/oratab

while read line; do
  params=(${line//:/ })
  SID=${params[0]}
  ORAHOME=${params[1]}

 # define a function for each SID
 eval "$(cat <<EOF
   sqlplus_${SID}() { 
    export ORACLE_SID=${SID}
    export ORACLE_HOME=${ORAHOME}
    \$ORACLE_HOME/bin/sqlplus / as sysdba
  }
EOF
)"

done </etc/oratab


