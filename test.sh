#!/bin/bash

cases=(./test/test_cli/basic.sh ./test/test_cli/multiple_keypairs.sh ./test/test_cli/user_id_required.sh ./test/test_cli/valid_email.sh )
results=("eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoiMTIzIiwiZW1haWwiOiJ2QGdtYWlsLmNvbSJ9."
"eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoiMTIzIiwiZW1haWwiOiJ2QGdtYWlsLmNvbSIsIm5hbWUiOiJsaW5kYSIsInJvbGUiOiJhZG1pbiJ9."
"eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoiMTIzIiwiZW1haWwiOiJ2QGdtYWlsLmNvbSJ9."
"eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoiMTIzIiwiZW1haWwiOiJ2QGdtYWlsLmNvbSJ9."
)

for i in "${!cases[@]}"
do
  bash -c ${cases[$i]}
  if [ $(pbpaste) == ${results[$i]} ]; then
    echo $'Success\n'
  else
    echo "Fail"
    exit
  fi
done

echo $'Run minitest\n'
rake test
