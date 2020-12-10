# pepe Python Embedded Programs in Eiffel

Work in progress update to Python Version 3.

## Python C API 
- https://docs.python.org/3/c-api/index.html

## Useful Links
- https://portingguide.readthedocs.io/en/latest/core-obj-misc.html


## Environment Variables

### Windows
`PYTHON_HOME` = to the path where you have Python Installed.
`PYTHON_LIB_NAME` = Python version for example `Python38`


### Linux
Be sure to have Python v3 installed, including the -dev package.
For instance on Debian system:
```
	sudo apt install python3 python3-dev
```

Then, check your python version, using `python3 --version`
And set `PYTHON_LIB_NAME` accordingly, for instance
```
	export PYTHON_LIB_NAME=python3.8
```
or
```
	export PYTHON_LIB_NAME=`python3 --version | sed -e 's/Python\s*\([0-9][0-9]*\.[0-9][0-9]*\).*/\1/'`
```
