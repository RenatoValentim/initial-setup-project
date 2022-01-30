# Initial Setup to Projects

## Requirements

- git
- curl
- NodeJS to initialize Node project
- Python3 to initialize Python project

> **NOTE**: No need to clone this repository, just run the specified curl.

## Node

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
bash <(curl -fsSL https://raw.githubusercontent.com/RenatoValentim/initial-setup-project/main/python-initial-setup-project.sh) -y
```

> **NOTE**: The `-y` flag sets default values, if you need to set project info right at the beginning remove it.

Post config

1. change white spaces to tabulation on `Makefile`

To development using TDD with started `venv` execute

```BASH
make test-watch
``` 
