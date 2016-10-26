import datetime

from pyramid.response import Response
from pyramid.view import view_config

from sqlalchemy.exc import DBAPIError

from ..models import MyModel

@view_config(route_name='home', renderer='../templates/mytemplate.jinja2')
def my_view(request):
    try:
        query = request.dbsession.query(MyModel)
        one = query.filter(MyModel.name == 'one').first()
    except DBAPIError:
        return Response(db_err_msg, content_type='text/plain', status=500)
    return {'one': one, 'project': 'kiki'}

@view_config(route_name='jobs', renderer='../templates/jobs.jinja2')
def jobs(request):
    """
    Returns a list of job entries where each job is a dict containing 
    the following keys: title, employer, qualifications, description,
    location, date_posted.
    """
    now = datetime.datetime.now()
    # This is job 1
    job1= {
        "title": "Senior Web Developer",
        "employer": "Hello All, Inc.", 
        "qualifications": "Three years experience with Python",
        "description": "This is a fake job.",
        "location": "West LA",
        "picture": "/static/socalpython_logo.jpg",
        "date_posted": now.strftime("%Y-%m-%d")
        }

    # This is job 2
    job2= {
        "title": "Junior Web Developer",
        "employer": "Goodbye Yall, Inc.", 
        "qualifications": "0 years experience with Python",
        "description": "This is a another fake job.",
        "location": "East LA",
        "date_posted": now.strftime("%Y-%m-%d")
        }

    # This is the list of jobs
    jobs = [job1, job2]

    # Return list of jobs to jinja
    return {"jobs":jobs}




db_err_msg = """\
Pyramid is having a problem using your SQL database.  The problem
might be caused by one of the following things:

1.  You may need to run the "initialize_socalpython_db" script
    to initialize your database tables.  Check your virtual
    environment's "bin" directory for this script and try to run it.

2.  Your database server may not be running.  Check that the
    database server referred to by the "sqlalchemy.url" setting in
    your "development.ini" file is running.

After you fix the problem, please restart the Pyramid application to
try it again.
"""
