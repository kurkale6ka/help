```bash
# The completion needs the venv path in ~/.awsume/zsh-autocomplete/_awsume +
# autoload -z ~/.awsume/zsh-autocomplete/_awsume in zshrc
alias awsume-autocomplete=~/py-envs/awsume/bin/awsume-autocomplete
alias awsumepy=~/py-envs/awsume/bin/awsumepy
alias awsume=". ~/py-envs/awsume/bin/awsume"
```

`awsume -otemp` will output a token in `~/.aws/credentials`  
`credential.https://git-codecommit...helper=!aws --profile ImportantDev codecommit credential-helper $@` will be then able to use the temporary credentials

```cfg
~/.aws/config
[profile ImportantDev]
...
source_profile = temp
...
```
