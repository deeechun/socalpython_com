####################
Adding Documentation
####################

Why, Where, When, What and How!


Why Do We Need Documentation
============================

* Documentation is always the first entry point to any project
* There is usually no such thing as too much documentation
* ... but there is plenty of unstructured documentation
* Your teammates and your future self will thank you
* Helps you avoid the "hit by a bus" scenarios


Why does requirement for documentation need to be explained
============================================================

* The "why" should be self explanatory, but often is not!
* Developers love reading other's documentation, and get upset if it's missing
* Average developer, as data shows, write very little documentation
* Developers have multiple reasons for not writing documentation


There NEVER was a story of more woe than this of Code & it's Documentioo
========================================================================

In centuries past many reasons have been given by developers as to why there
is no, little or bad documentation. Commonly the fall in to the following
categories:

* Process problems:
* Training problems
* "Misplaced Solution" problem
* Job definition problems


Process problems
================

Usually these problems sound like this:

* I'll do it later, I have a deadline
* I'll write it when I finish this project
* Just ask me and I'll tell you

Above usually indicates process problems. Ones where the people running the
project believe that documentation is unimportant or not important enough.

The developer is then usually not given then time, or believes there is no time
to do this. This usually results in a lot of loss of productivity since the
knowledge is pieces in various heads, assuming those heads have not moved on
to the next job.

It also lacks consistence since everytime "verbal documentation" tales are told
they change, grow or lessen with each person retelling.

Problems like this are problems with your software development process. You
should ask your manager to address they can not I strongly suggest running
away from the job as soon as possible.


Training problems
=================

If you hear arguments below usually are indication of lack of training

* I am bad at documentation
* We never had to write documentation before and we were fine
* It's not really my job, I write code


"Misplaced Solution" problem
============================

Often you will find developers applying a solution for one problem to another
problem. In documentation this usually

* I write code that is self documenting
* I documented the API, so we do not need narrative documentation
* There is a Wiki Page for this.

"Misplaced Solution" problem: Self Documenting Code - Part 1
============================================================

Self documenting code usually address the question of **WHAT?**. Consider the
following.

.. code:: python

    def print_ids(l):
        e = [1, 10, 17]
        for i in e:
            l.print("ID", a)

Code wise it is fairly obvious what is happening. We are iterating over a list
and printing out what looks like IDs. Or so we think start investigating.

Investigation like this usually involves:
* Reading large amounts of code
* Asking developer who been there longer or more senior what it does
* Looking through Git (or even Subversion) commits for meaningful messages
* Asking everyone from Database Administrators to HR what "ID" might mean


"Misplaced Solution" problem: Self Documenting Code - Part 2
============================================================

So we are done with our investigation and now we want to make the code more
self documenting.

.. code:: python

    def log_employee_ids(logger):
        employee_ids = [1, 10, 17]
        for employee_id in employee_id_list:
            logger.info("Employee ID", employee_id)

Now we know much better "WHAT" is happening because the code is more readable.

We no longer have to look at **"b"** and wonder what it is for one. Also
**"a"** has become a tad more descriptive, so much so we can now change the
message we print out. We can now tell that "l" is a logger and **print** was
really and "info" level log message.

However, during the investigation we learned so much more. So were do we put
this knowledge.


Beyond Self Documenting Code: Commenting
========================================

Documenting the "WHY" of code will help you understand it in larger context.
That "why" is usually hard to expressed in variable and method names. So let's
try using human language.

.. code:: python

    def log_employee_ids(logger):

        # Go over a hardcoded list of employees its and print them out one per
        # line so we can see during the application start which employees are
        # allowed to login as administrators (still need to look in the
        # database to match employee id's to actual employees).

        employee_ids = [1, 10, 17]
        for employee_id in employee_id:
            logger.info("Employee ID", employee_id)

        # TODO: should really come from the database so we would not have to
        # maintain it in code and do release everytime we change it. Management
        # promised to address this in the next maintenance release


Beyond Self Documenting Code: Back to Self Documenting Code
===========================================================

It's flash back time. Let's try to transfer all the comment meaning to code.

.. code:: python

    def log_application_administrators_employee_ids(logger):

        employee_ids_from_db = [1, 10, 17]
        for employee_id in employee_ids_from_db:
            logger.info("Employee ID", employee_id)
        logger.info("Need to address above next maintenance release")

The above certaining get's a lot of meaning accross, however it fairly easy
to get confused as to what is going on. Variable and method names are fairly
long. We also seems to be poluting our logs with with "comments" which I am
fairly sure will make our system administrators unhappy.

In short having self documenting code is great, but it is not enough.


Evolving our


Getting Back to Our Project
===========================

We hope by now you have the project installed and virtualenv on your project
activated. If not, follow instructions in the **Installation** section of the
project all the way through to **Activating you virtual environment**

Your Last Step Should Be:

.. code-block:: shell

    source _env35/bin/activate

