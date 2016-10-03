########################
Creating Pyramid Project
########################

First follow instructions in the **Installation** section of the project
all the way through to **Activating you virtual environment**

Your Last Step Should Be:

.. code-block:: shell

    source _env35/bin/activate


Pyramid Web Framework Scaffolds
===============================

Pyramid comes with a number of scaffolds/templates which allow you to easily
start on the project.

This convinience is provided so you do not have to spend
time writing a lot boilerplate, identical code everytime you want to start
a project that requires the same components.

To create a project from a scaffold you can use **pcreate** utility.


Installing Pyramid
==================

Let's first install pyramid so we can use it to create our project using a
scaffold.

.. code-block:: shell

    pip install pyramid


Take a Look at Scaffolds
========================

Now let's look at available scaffolds.


.. code-block:: shell

    pcreate --list

    Available scaffolds:
      alchemy:                 Pyramid project using SQLAlchemy, SQLite, URL dispatch, and Jinja2
      pyramid_jinja2_starter:  Pyramid Jinja2 starter project
      starter:                 Pyramid starter project using URL dispatch and Chameleon
      zodb:                    Pyramid project using ZODB, traversal, and Chameleon
