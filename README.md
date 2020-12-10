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


## Scripts

Python Scripts to generate Eiffel code to wrap Python Modules and Classes. These scripts came from  [ePolyglot](http://epolyglot.sourceforge.net/) updated to be used with
Pepe and Python3.

[make_eiffel_stub.py](/scripts/make_eiffel_stub.py) 
		A simple stub program designed to create an Eiffel stub class from a given python
		module and class name.  It currently creates an Eiffel-callable function for
		each method it finds in the class table after importing the class.
#### Exmple
	make_eiffel_stub.py smtplib SMTP > smtplib_smtp.e


[make_eiffel_module_stub.py](/scripts/make_eiffel_module_stub.py) 
		A simple stub program designed to create an Eiffel stub class from a given python
		module.  It currently creates an Eiffel-callable function for
		each function it finds in the module dictionary after importing the module.
		
#### Example
	make_eiffel_module_stub.py matplotlib.pyplot > matplotlib_pyplot.e
