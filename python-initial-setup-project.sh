!#/usr/bin/env bash

git init;
python3 -m venv venv;
source ./venv/bin/activate;
pip3 install --upgrade pip;
pip3 install pynvim;
pip3 install autopep8;
mkdir src tests requirements | touch src/__init__.py tests/__init__.py tests/test_example.py;
echo 'venv
*cache*
.coverage' > .gitignore;
git add .gitignore;
git commit -m "chore: add .gitignore";
git add src/__init__.py;
git commit -m 'chore: add src module';
git add tests/__init__.py;
git commit -m 'chore: add test module';
pip3 install pylint;
echo '[MASTER]
disable=
      C0114,
      C0115,
      C0116,
      W0201,
      E0401' > .pylintrc;
git add .pylintrc;
git commit -m "chore: add pylintrc";
pip3 install pytest pytest-cov codecov pytest-watch;
echo '[pytest]
minversion = 6.2.5
addopts = -ra -q
testpaths = "tests"
log_cli = True' > pytest.ini;
echo 'def test_this_is_a_example():
    assert isinstance("hello", str) == isinstance("world", str)' > tests/test_example.py;
git add pytest.ini;
git commit -m "chore: add pytest";
pip3 install pre-commit;
echo "repos:
  - repo: https://github.com/PyCQA/pylint
    rev: pylint-2.7.2
    hooks:
      - id: pylint
        exclude: ^server/
  - repo: https://github.com/pre-commit/mirrors-autopep8
    rev: v1.5.4
    hooks:
      - id: autopep8
        exclude: ^server/
  - repo: local
    hooks:
      - id: pytest
        name: pytest
        language: system
        entry: pytest -v -s
        always_run: true
        pass_filenames: false
        stages: [commit]
  - repo: local
    hooks:
      - id: requirements
        name: requirements
        entry: bash -c 'venv/bin/pip3 freeze > requirements.txt; git add requirements.txt'
        language: system
        pass_filenames: false
        stages: [commit]
" > .pre-commit-config.yaml;
pre-commit install;
git add .pre-commit-config.yaml;
git commit -m "chore: add pre-commit";
echo '[tool.poetry]
name = "CHANGE TO PROCJECT NAME"
version = "CHANGE TO PROCJECT VERSION"
description = ""
authors = ["CHANGE TO AUTHOR NAME <CHANGE TO AUTHOR EMAIL>"]

[tool.poetry.dependencies]
python = "==CHANGE TO PYTHON VERSION"

[tool.poetry.dev-dependencies]
pipenv-to-requirements = "*"
pre-commit = "*"
pylint = "*"' > pyproject.toml;
source ./venv/bin/activate;
pytest -v --cov=src;
