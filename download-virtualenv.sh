#!/usr/bin/env bash

# ########################################################################### #
#
#  Query PyPI for latest virtualenv package and download the sdist tar
#  archive to ./bin, extract it and create a bin/venv symlink to
#  ./bin/virtualenv-*/virtualenv.py
#
#  IMPORTANT:
#
#    Please note that this scipt is DESTRUCTIVE as it removes file and folders
#
#    virtualenv version in here matches the one used by virtualenv used by
#    scarab salt states, which is an ubuntu package of 1.7.1.2-1 (last -1)
#    is the ubuntu modifications to the PyPI package
#
# ########################################################################### #

# break on first error
set -e;

SCRIPT_FOLDER="$(dirname $(readlink -f ${0}))";

## code to get the url of the virtualenv with specific version
#
# PY_CODE='
# import xmlrpclib;
# PYPI_URL="https://pypi.python.org/pypi";
# PACKAGE_NAME="virtualenv";
# PACKAGE_VERSION="1.5.0.3"
# client = xmlrpclib.ServerProxy(PYPI_URL);
# release_urls = client.release_urls(PACKAGE_NAME, PACKAGE_VERSION);
# url = [pkg["url"] for pkg in release_urls if pkg["packagetype"] == "sdist"][0];
# print url;
# ';
# # get the download url for virtualenv
# DOWNLOAD_URL="$(python -c "${PY_CODE}")";

DOWNLOAD_URL="https://pypi.python.org/packages/8b/2c/c0d3e47709d0458816167002e1aa3d64d03bdeb2a9d57c5bd18448fd24cd/virtualenv-15.0.3.tar.gz";

# ........................................................................... #
function main {
    local virtualenv_folder;

    cd "${SCRIPT_FOLDER}/bin";

    # remove existing virtualenv directory and symlink
    rm -rf virtualenv*

    # download the tarball
    curl \
      --remote-name \
        "${DOWNLOAD_URL}";

    # extract tarball
    tar xf virtualenv*.tar.gz;
    # remove downloaded tarball
    rm virtualenv*.tar.gz

    # get the folder for the extracted virtualenv
    virtualenv_folder="$(cd virtualenv-*/; pwd)";

    # create 
    echo "#!/usr/bin/env python3.5" > "${virtualenv_folder}"/virtualenv3.py;
    tail -n +2 "${virtualenv_folder}"/virtualenv.py >> "${virtualenv_folder}"/virtualenv3.py;
    chmod +x "${virtualenv_folder}"/virtualenv3.py;

    # create virtualenv.py symlink which symlinks it for virtualenv3.py
    ln -s virtualenv-*/virtualenv3.py virtualenv.py;

    echo "";
    echo "./bin/virtualenv.py for Python 3.5 is now available"

}

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #
main;
