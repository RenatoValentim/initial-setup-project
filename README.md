# Initial Setup to Node Project

With git and nodeJS intalled execute
```BASH
source node-initial-setup-project.sh
```
After finish setup open the file `commit-msg` into the `.husky` and modify the text `.git/hooks/commit-msg` adding `$1` like this `.git/hooks/commit-msg $1`

To development using TDD execute
```BASH
npm run test:unit
```
