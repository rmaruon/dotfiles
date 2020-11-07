# npm install n
set -x N_PREFIX $HOME/.n
set -x PATH $PATH $N_PREFIX/bin

# node
set PATH ./node_modules/.bin $PATH

# python
set -x PIPENV_VENV_IN_PROJECT true
set -x PYTHONIOENCODING utf-8
