###############
SocalPython.com
###############

Installation
============

Fork https://github.com/socalpython/socalpython_com into your own account
using GitHub.com Website.

Clone the repository

.. code::

    git clone <repository url>

Change to the cloned repository folder

.. code::

    cd socalpython_com

Use `download-virtualenv` script to install virtualenv.py in ./bin
folder. Please note this script is convinience.

.. code::

    ./download-virtualenv.sh

.. warning::

    You may use your own virtualenv.py script if you wish and adjust path to it
    bellow as needed. However, if you want it to match production it needs to
    be the same version.

Optionally, if the _env35 already exists remove it:

.. code::

    rm -rf _env35

Create a new Python virtual environment.

.. code::

    bin/virtualenv.py --prompt="(socalpython_com)" _env35

Activate your virtual environment

.. code::

    source _env35/bin/activate


Install socalpython package in development mode:

.. code::

    pip install --editable .


Creating the database
=====================

If this is the first time you setup the codebase or if you removed the previous
database you will need to (re)create it.

.. code::

   initialize_socalpython_db development.ini


Running Development SocalPython.com
===================================

To run socalpython.com locally development use the following:

.. code::

    pserve --reload development.ini

.. note::

    The ``--reload`` flag is used to automatically reload your codebase and
    templates when you modify them.

