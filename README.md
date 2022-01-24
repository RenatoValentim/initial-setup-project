# Initial Setup to Node Project

## Requirements
- git
- nodeJS

> **NOTE**: No need to clone this repository, just run
```BASH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/RenatoValentim/initial-setup-node-project/main/node-initial-setup-project.sh | bash)"
```
After finish setup open the file `commit-msg` into the `.husky` and modify the text `.git/hooks/commit-msg` adding `$1` like this `.git/hooks/commit-msg $1`

To development using TDD execute
```BASH
npm run test:unit
``` 
