# # # # GENERATED FILE -- DO NOT MODIFY # # # #
from setuptools import setup
from codecs import open
from os import path

here = path.abspath(path.dirname(__file__))

with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

with open(path.join(here, 'requirements.txt'), encoding='utf-8') as f:
    requires = f.read().split()

setup(
    name='pyEX.caching',
    version='0.0.3',
    description='Rest API to IEX',
    long_description=long_description,
    url='https://github.com/timkpaine/pyEX-caching',
    download_url='https://github.com/timkpaine/pyEX-caching/archive/v0.0.3.tar.gz',
    author='Tim Paine',
    author_email='timothy.k.paine@gmail.com',
    license='Apache 2.0',

    classifiers=[
        'Development Status :: 3 - Alpha',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
    ],

    keywords='finance data',
    packages=['pyEX.caching'],
    install_requires=requires,
    extras_require={'dev': requires + ['pytest', 'pytest-cov', 'pylint', 'flake8', 'mock', 'autopep8', 'codecov']}
)
