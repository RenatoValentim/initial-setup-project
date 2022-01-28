# Initial Setup to Projects

### Requirements

- git
- curl

> **NOTE**: No need to clone this repository, just run the specified curl.

## None

- nodeJS

```BASH
curl -fsSL https://raw.githubusercontent.com/RenatoValentim/initial-setup-project/main/node-initial-setup-project.sh | bash
```

Post config

1. change `.git/hooks/commit-msg` adding `$1` like this `.git/hooks/commit-msg $1` in path `.husky/commit-msg`
2. remove `npm test` into the `.husky/pre-commit` in path `.husky/commit-msg`

To development using TDD execute

```BASH
npm run test:unit
``` 

## Python

- python3

```BASH
curl -fsSL https://raw.githubusercontent.com/RenatoValentim/initial-setup-project/main/python-initial-setup-project.sh | bash
```

Post config

1. edit pyproject.toml conforme your project information
