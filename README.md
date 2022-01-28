# Initial Setup to Project

## None

### Requirements
- git
- nodeJS
- curl

> **NOTE**: No need to clone this repository, just run
```BASH
curl -fsSL https://raw.githubusercontent.com/RenatoValentim/initial-setup-node-project/main/node-initial-setup-project.sh | bash
```
Post config
1. change `.git/hooks/commit-msg` adding `$1` like this `.git/hooks/commit-msg $1` in path `.husky/commit-msg`
2. remove `npm test` into the `.husky/pre-commit` in path `.husky/commit-msg`

To development using TDD execute
```BASH
npm run test:unit
``` 
