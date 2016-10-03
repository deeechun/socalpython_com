import os

from setuptools import find_packages
from setuptools import setup

# ........................................................................... #
install_requires = [
    'pyramid',
    'pyramid_jinja2',
    'pyramid_debugtoolbar',
    'pyramid_tm',
    'SQLAlchemy',
    'transaction',
    'zope.sqlalchemy',
    'waitress',
    ]

tests_requires = [
    'WebTest >= 1.3.1',  # py3 compat
    'pytest',            # includes virtualenv
    'pytest-cov',
    ]

# install requires
docs_requires = [
    'sphinx',
    'sphinx_rtd_theme',
    'sphinxjp.themes.gopher',
    ]

# ........................................................................... #
def main():
    """
    Runs setuptools setup function which configures this package options like
    requirements.
    """

    package_folder = os.path.abspath(os.path.dirname(__file__))
    with open(os.path.join(package_folder, 'README.rst')) as readme_file:
        README = readme_file.read()
    with open(os.path.join(package_folder, 'CHANGES.rst')) as changes_file:
        CHANGES = changes_file.read()

    setup(
        name='socalpython',
        version='0.1dev',
        description='socalpython',
        long_description=README + '\n\n' + CHANGES,
        classifiers=[
            "Programming Language :: Python",
            "Framework :: Pyramid",
            "Topic :: Internet :: WWW/HTTP",
            "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
        author='',
        author_email='',
        url='',
        keywords='pyramid',
        packages=find_packages(),
        include_package_data=True,
        zip_safe=False,
        extras_require={
            'testing': tests_requires,
            'docs': docs_requires,
        },
        install_requires=install_requires,
        entry_points="""\
        [paste.app_factory]
        main = socalpython:main
        [console_scripts]
        initialize_socalpython_db = socalpython.scripts.initializedb:main
        """,
        )


# ........................................................................... #
if __name__ == '__main__':
    main()
