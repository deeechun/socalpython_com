####################################
Adding Documentation To Your Project
####################################

And solving problem's Shakespeare never had.

Warning!
========

In giving this talk I already hope I am preaching to the choir. In fact, 90% of
the topic discussed here are common sense and you will easily recognize it as
such.


What will you learn from this talk
==================================

* Why you need documentation
* Common problems behind missing or bad documentation
*

Why Do We Need Documentation
============================

* Documentation is always the first "entry point" to any project
* There is usually no such thing as too much documentation
* But there is plenty of confusing and unstructured documentation
* Written documentation always beats verbal story telling and retelling


Documentation benefits are many
===============================

* Helps you on-board people onto project and tasks quickly.
* Helps you avoid the "hit by a bus" scenarios
* Keeps your teammates and your future self relatively free of guessing

-----

    .. centered:: Extensive documentation SHOULD always be part of your project and
        without it the project will eventually be a failure

In fact, I will dare say, to every English literature teacher's horror,
that the story of Romeo and Juliet would have ended much differently had
Juliet properly and timely documented the implementation of her plot to
reconnect with Romeo.

Why does requirement for documentation need to be explained
============================================================

The "why is documentation necessary" should be self explanatory but often is
not.

* Developers love reading other's documentation, and get upset if it's missing
* Oddly enough, average developer, as data shows, does not a lot write
  documentation as part of their job
* Developers have multiple reasons for not writing documentation, some valid,
  some misplaced

Types of Documentation
======================

* Code Comments
* API Documentation (method, classes, modules)
* Narrative Documentation

 - Usage / QuickStart Guides
 - Maintenance and Development Manuals


How much documentation is enough
================================

While numbers may vary usually you should have nearly 3 times as much
documentation as you have code. This is actually true in most industries.

While that seems like a lot, I suggest you think of your car. Your owners
manual is usually nearly a 50-80 pages.

Meanwhile documentation given to car mechanics to work on one model of the car
is usually several thousand pages long when you factor in model style add-on,
schematics and various revisions.

+-------------+----------------------------------------------+----------------+
| Book                                                       | Pages          |
+============================================================+================+
| How to Rebuild Honda B-Series Engines                      | 144            |
+------------------------------------------------------------+----------------+
| Chilton's Honda Civic 2001-2010 & CR-V 2002-2009           | 464            |
+------------------------------------------------------------+----------------+

And these are large sized books: 8.2 x 0.8 x 10.8 inches


There NEVER was a story of more woe than this of Code & its Documentio
======================================================================

In "centuries" past many reasons have been given by developers as to why there
is no, little or bad documentation. Commonly the fall in to the following
categories:

* Process problems
* Training problems
* Job definition problems
* "Misplaced solution" problem


Process Problems
================


Process problems
================

Usually these problems sound like this:

* I have a deadlines
* I'll write it when I finish this project
* Just ask me and I'll tell you

Above usually indicates process problems with the team's software development
process. It comes from belief that documentation is unimportant or not
important enough to spend dedicated time on.

You should be addressing this problem with help of your leads and managers.  If
they fail to do so I strongly suggest **running away** from the job as soon as
possible.


I have a deadlines
==================

This usually means that a developer is not given the time, or believes there
is no time to do this.

Eventually this leads to fragmented knowledge and continuous journeys of
exploration to try to figure out or remember what that code that was written
2 years ago might have meant.

Solution to this should be integrating documentation time into the project
estimate. On overall data shows that 20% of of the project time should be
spent documenting. If you are just beginning the process this will easily be
as high as 50%.

Occasionally, you might have a case when the time is given but the developer
uses this an as excuse not write the documentation. We will talk more about
this is **Job definition problems** section


I'll write it when I finish this project
========================================

At first, this is approach usually seems fairly reasonable. It comes from a
belief that by the time the project is done, documentation can be written
quickly since project is no longer changing under the developer.

While this might work well for small batches of code, the approach does not
scale. Usually by the end of a 3 month project, much has been forgotten.
This is especially true when developers rotate on projects and hand off only
partial knowledge to each other.


Just ask me and I'll tell you
=============================

This style of verbal documentation tradition is most common in technology.
And while this approach has the human touch of teach it is also wrought with
following problems of inconsistency, reinterpretation and forgetfulness.

With verbal delivery there consistent base to refer next time something is
not clear and updates to this type of documentation are impossible to track.

You will need to interview every person who is ever involved in the project
then combine, cross reference what they said and resolve inconsistencies to
get a full picture.

Training problems
=================


Training problems
=================

If you hear arguments below usually are indication of lack of training

* I am bad at documentation
* We never had to write documentation before and we were fine
* It's not really my job, I write code

Job definition problems
=======================

What's Your Job Definition
==========================

* Process problems
* Training problems
* ``Job definition problems``
* "Misplaced solution" problem

One of the more common management issues is **job definition**. In fact,
if you scan most developer job posting you will often find no mentions of the
documentation as a requirement or often it is hidden in jumble of words on the
bottom after "Must know this, this or that language and latest shiny tech of
the month".


"Misplaced solution" problems
=============================


"Misplaced solution" problems
=============================

Often you will find developers applying a solution for one problem to another
problem. In documentation this usually

* I write code that is self documenting
* I documented the API, so we do not need narrative documentation
* I'll write a Wiki Page for this.


Self Documenting Code - Part 1
==============================

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


Self Documenting Code - Part 2
==============================

So we are done with our investigation and now we want to make the code more
self documenting.

.. code:: python

    def log_employee_ids(logger):
        employee_ids = [1, 10, 17]
        for employee_id in employee_id_list:
            logger.info("Employee ID", employee_id)

Now we know much better "WHAT" is happening because the code is more readable.

We no longer have to look at ``b`` and wonder what it is for one. Also
``a`` has become a tad more descriptive, so much so we can now change the
message we print out. We can now tell that ``l`` is a logger and ``print`` was
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
        # maintain it in code and do release every time we change it.
        # Management promised to address this in the next maintenance release


Back to Self Documenting Code
=============================

Flashback!. Let's try to transfer all the meaning we put in comments back to
code.

.. code:: python

    def log_application_administrators_employee_ids(logger):

        employee_ids_from_db = [1, 10, 17]
        for employee_id in employee_ids_from_db:
            logger.info("Employee ID", employee_id)
        logger.info("Need to address above next maintenance release")

The above certainly gets a lot of meaning across, however it fairly easy to
get confused as to what is going on. Variable and method names are long.  We
also seems to be polluting our logs with with "comments" which I am fairly sure
will make our system administrators very unhappy.

In short having self documenting code is great, but clearly not enough.


Evolving Past Comments: Docstrings
==================================

Comments are useful, but they are designed to be documentation specific to
blocks of code. What do we do for our methods, classes and modules?

Let' me introduce you to the **docstring** used for API documentation

Docstring is a python specific constract where by the documentation becomes the
property of the object. It is written usually using triple quotes ("""/''')
following defintion of the object.


.. code-block:: python

    def hello_world():
        """
        Return "hello world" string
        """
        return 'hello'

Getting Back to Our Project
===========================

We hope by now you have the project installed and virtualenv on your project
activated. If not, follow instructions in the **Installation** section of the
project all the way through to **Activating you virtual environment**

Your Last Step Should Be:

.. code-block:: shell

    source _env35/bin/activate

