##########################################
Welcome to SocalPython.com's documentation
##########################################

This is project for SocalPython.com website.

Contents:

.. toctree::
   :maxdepth: 2


Installation
============

Forking the Project
-------------------

Fork https://github.com/socalpython/socalpython_com into your own account
using GitHub.com Website.

Clone the repository
--------------------

Now clone the repository under your account to your computer

.. code::

    git clone git@github.com:<your_username>/socalpython_com


Change to the cloned repository folder
--------------------------------------

.. code::

    cd socalpython_com

Downloading Virtualenv Package
------------------------------

Virtualenv is used to Sandbox our projects for the system python packages.
It is recommended development practice which allows for ease of development.


Use `download-virtualenv` script to install virtualenv.py in ./bin
folder.

.. code::

    ./download-virtualenv.sh

If successfull you should see something like this:

.. code::

    ./bin/virtualenv.py for Python 3.5 is now available

.. note:: Alternative: Using Your Own VirtualEnv

    You may use your own virtualenv.py script if you wish and adjust path to it
    bellow as needed. However, if you want it to match production it needs to
    be the same version.


Optional: Removing Existing virtualenv for the project
------------------------------------------------------

**If you never created an virtualenv for this project skip this section**

If you already create a virtualenv for this project you can deactivate and
remove it like so:

.. code::

    deactivate
    rm -rf _env35

Create a new virtual environment for the project
------------------------------------------------

Let's use create our virtualen in a ``_env35`` folder. We will also specify a
custom prompt so we know what this project is when we are on the terminal that
is using project virtualenv.

.. code::

    bin/virtualenv.py --prompt="(socalpythoncom)" _env35


Activate your virtual environment
---------------------------------

.. code::

    source _env35/bin/activate


Install socalpython package in development mode
-----------------------------------------------

To work on the projec you need to install the project and it's dependencies
in the devlopment mode (also know as ``editable`` mode)

.. code::

    pip install --editable .


Creating the database
=====================

If this is the first time you setup the codebase or if you removed the previous
database you will need to (re)create it.

.. code::

   initialize_socalpython_db development.ini


Running development server
==========================

To run socalpython.com locally development use the following:

.. code::

    pserve --reload development.ini

.. note::

    The ``--reload`` flag is used to automatically reload your codebase and
    templates when you modify them.


Testing setup
=============

Project setup uses a popular and extensible `pytest <http://pytest.org>`_
testing framework.

It can be used to run unit, functional and integration tests.

For BDD style testing we use `pytest-bdd <https://pytest-bdd.readthedocs.io/>`_
package).


Installing testing tools
------------------------

Basic setup project setup does not install tools used for testing. This is done
so to make it possible to deploy the application in production where the
testing tools are not needed on the server itself.


.. code::

    pip install --editable .[testing]


The packages that are installed for testing are specified in the 'testing'
section in ``setup.py``.


Running Tests
-------------

To run test use the `pytest` utility.

.. code::

   pytest --verbose


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
