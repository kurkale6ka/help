alias awsumepy=~/py-envs/awsume/bin/awsumepy
alias awsume=". ~/py-envs/awsume/bin/awsume"

awsume -otemp will output a token in ~/.aws/credentials
credential.https://git-codecommit...helper=!aws --profile ImportantDev codecommit credential-helper $@ will be then able to use the temporary credentials

~/.aws/config
[profile ImportantDev]
...
source_profile = temp
...
