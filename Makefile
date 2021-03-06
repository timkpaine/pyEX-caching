prebuild:  ## Copy assets from pyEX
	cp -r ../pyEX/pyEX/* ./pyEX/

tests: ## Clean and Make unit tests
	python3.7 -m pytest -v pyEX/caching/tests --cov=pyEX --junitxml=python_junit.xml --cov-report=xml --cov-branch

lint: ## run linter
	python3.7 -m flake8 pyEX/caching 

fix:  ## run autopep8/tslint fix
	autopep8 --in-place -r -a -a pyEX/caching/

annotate: ## MyPy type annotation check
	mypy pyEX/caching

annotate_l: ## MyPy type annotation check - count only
	mypy pyEX/caching | wc -l 

clean: ## clean the repository
	find . -name "__pycache__" | xargs  rm -rf 
	find . -name "*.pyc" | xargs rm -rf 
	rm -rf .coverage cover htmlcov logs build dist *.egg-info coverage.xml
	make -C ./docs clean
	rm -rf ./docs/*.*.rst  # generated
	rm -rf pyEX/*.py
	rm -rf pyEX/marketdata

docs:  ## make documentation
	make -C ./docs html
	open ./docs/_build/html/index.html

install:  ## install to site-packages
	pip3 install .

dist:  ## dist to pypi
	rm -rf dist build
	python3.7 setup.py sdist
	python3.7 setup.py bdist_wheel
	twine check dist/* && twine upload dist/*

# Thanks to Francoise at marmelab.com for this
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

print-%:
	@echo '$*=$($*)'

.PHONY: clean test tests help annotate annotate_l docs dist
