#!/bin/bash

EMTPY_TEXT=-z
NO_EMPTY_TEXT=-n

make_initial_folder_setup() {
  mkdir src tests requirements;
  touch src/__init__.py tests/__init__.py tests/test_example.py;
}

make_initial_setup_gitignore() {
  echo "venv
*cache*
.coverage" > .gitignore;
}

make_initial_setup_pylint() {
  echo "[MASTER]
disable=
      C0114,
      C0115,
      C0116,
      W0201,
      E0401" > .pylintrc;
}

make_initial_setup_pytest() {
  echo "[pytest]
minversion = `pytest --version 2>&1| sed -e "s/pytest//g" | xargs`
addopts = -ra -q
testpaths = \"tests\"
log_cli = True" > pytest.ini;
}

make_test_example() {
  echo "def test_this_is_a_example():
    assert isinstance('hello', str) == isinstance('world', str)" > tests/test_example.py;
}

make_initial_setup_pre-commit() {
  echo "repos:
  - repo: local
    hooks:
      - id: pylint
        name: pylint
        entry: pylint
        language: system
        types: [python]
  - repo: local
    hooks:
      - id: autopep8
        name: autopep8
        entry: autopep8
        language: system
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
}

make_initial_setup_tool_project() {
  echo "[tool.poetry]
name = \"$1\"
version = \"$2\"
description = \"$3\"
authors = [\"$4 <$5>\"]

[tool.poetry.dependencies]
python = \"==`python3 --version 2>&1| sed -e "s/Python//g" | xargs`\"

[tool.poetry.dev-dependencies]
pipenv-to-requirements = \"*\"
pre-commit = \"*\"
pylint = \"*\"" > pyproject.toml;
}

make_initial_setup_makefile() {
  echo "test-watch:
  ptw" > Makefile;
}

normalize_value() {
  if [ $EMTPY_TEXT $1 ]; then
    echo "\"\""
  fi
}

main() {
  yes_for_all=$1
  if [[ $yes_for_all != "-y" && $yes_for_all != "" ]]; then
    echo "Invalid parameter: expect -y";
    return
  fi
  project_name="USER_NAME";
  project_version="PROCJECT_VERSION";
  project_description="PROCJECT_DESCRIPTION";
  author_name="AUTHOR_NAME";
  author_email="AUTHOR_EMAIL";
  if [ $EMTPY_TEXT $yes_for_all ]; then
    printf "Project name: ";
    read project_name;
    normalize_value $project_name;
    printf "Project version: ";
    read project_version;
    normalize_value project_version; 
    printf "Description: ";
    read project_description;
    normalize_value project_description;
    printf "Author: ";
    read author_name;
    normalize_value author_name;
    printf "Email: ";
    read author_email;
    normalize_value author_email;
    echo "";
  fi
  git init;
  python3 -m venv venv;
  source ./venv/bin/activate;
  pip3 install --upgrade pip;
  pip3 install pynvim;
  pip3 install autopep8;
  make_initial_folder_setup;
  make_initial_setup_gitignore;
  git add .gitignore;
  git commit -m "chore: add .gitignore";
  git add src/__init__.py;
  git commit -m 'chore: add src module';
  git add tests/__init__.py;
  git commit -m 'chore: add test module';
  pip3 install pylint;
  make_initial_setup_pylint;
  git add .pylintrc;
  git commit -m "chore: add pylintrc";
  pip3 install pytest pytest-cov codecov pytest-watch;
  make_initial_setup_pytest;
  make_test_example;
  git add pytest.ini;
  git commit -m "chore: add pytest";
  pip3 install pre-commit;
  make_initial_setup_pre-commit;
  git add .pre-commit-config.yaml;
  git commit -m "chore: add pre-commit";
  make_initial_setup_makefile;
  git add Makefile;
  git commit -m "chore: add Makefile";
  make_initial_setup_tool_project $project_name $project_version $project_description $author_name $author_email;
  if [ $EMTPY_TEXT $yes_for_all ]; then
    git add pyproject.toml;
    git commit -m "chore: add pyproject.toml";
  fi
}

main $1
