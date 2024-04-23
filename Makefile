MAKEFLAGS += --no-print-directory -s

check: mypy
	printf "\033[35mBLACK\033[0m\n==============\n"
	poetry run black .
	printf "\n\n\033[35mISORT\033[0m\n==============\n"
	poetry run isort .
	printf "\n\n\033[35mFLAKE8\033[0m\n==============\n"
	poetry run flake8 . || true
	printf "\n\n\033[35mPYLINT\033[0m\n==============\n"
	poetry run pylint sample || true
	printf "\n\n\033[35mMYPY\033[0m\n==============\n"
	poetry run mypy . || true

init:
	poetry install
	poetry shell
	pre-commit install

update: init
	poetry update
	pre-commit autoupdate

mypy:
	poetry run poetry types update
