#!/usr/bin/env bash

git init;
npm init -y;
git add .;
git commit -m "chore: add npm";
npm i -D git-commit-msg-linter;
echo "node_modules
.vscode" > .gitignore;
git add .;
git commit -m "chore: add commit linter";
npm i -D typescript @types/node ts-node;
echo '{
  "compilerOptions": {
    "outDir": "dist",
    "module": "commonjs",
    "target": "es2019",
    "esModuleInterop": true,
    "sourceMap": true,
    "rootDirs": ["src", "tests"],
    "baseUrl": "src",
    "paths": {
      "@/tests/*": ["../tests/*"],
      "@/*": ["*"]
    }
  },
  "include": ["src", "tests"],
  "exclude": []
}' > tsconfig.json;
git add .;
git commit -m "chore: add typescript";
npm i -D \
  typescript@\* \
  eslint@^7.12.1 \
  eslint-plugin-promise@^5.0.0 \
  eslint-plugin-import@^2.22.1 \
  eslint-plugin-node@^11.1.0 \
  @typescript-eslint/eslint-plugin@^4.0.1 \
  eslint-config-standard-with-typescript@latest;
echo "module.exports = {
  extends: 'standard-with-typescriptkl',
  parserOptions: {
    project: './tsconfig.json'
  }
}" > .eslintrc.js;
echo "node_modules
.vscode" > .eslintignore
git add .;
git commit -m "chore: add eslint";
npm i -D jest @types/jest ts-jest;
echo "module.exports = {
  collectCoverageFrom: ['<rooDir>/src/**/*.ts'],
  coverageDirectory: 'coverage',
  testEnvironment: 'node',
  roots: ['<rootDir>/tests'],
  transform: {
    '.*\\.ts': 'ts-jest'
  },
    moduleNameMapper: {
    '@/tests/(.*)': '<rootDir>/tests/$1',
    '@/(.*)': '<rootDir>/src/$1'
  }
}" > jest.config.js;
echo "const config = require('./jest.config')
config.testMatch = ['**/*.spec.ts']
module.exports = config" > jest-unit-config.js;
npm set-script test "jest --passWithNoTests --runInBand --no-cache";
npm set-script test:staged "npm test -- --findRelatedTests";
npm set-script test:unit "npm test -- --watch -c jest-unit-config.js";
git add .;
git commit -m "chore: add jest";
npx husky-init && npm install;
npm i -D lint-staged;
echo '{
  "*.ts": [
    "eslint . --fix",
    "npm run test:staged"
  ]
}' > .lintstagedrc.json;
npx husky add .husky/commit-msg ".git/hooks/commit-msg \$1";
git add .;
mkdir src;
mkdir tests;
touch tests/example.spec.ts;
echo "describe('ExampleSpec', () => {
    test('This is a example of the test stricture', () => {
        expect(1).toBe(1)
    })
})" > tests/example.spec.ts;
mkdir requirements;
git commit -m "chore: add lint-staged and husky";
