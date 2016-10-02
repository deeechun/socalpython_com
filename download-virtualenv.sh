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
#set -e;

# virtualenv package version
VIRTUALENV_PACKAGE_VERSION="15.0.3";

# get the script folder in a Linux and BSD/OSX friendly manner
SCRIPT_FOLDER="$(cd $(dirname $0); pwd -P;)";

# ........................................................................... #
function find_python_binary {
    local found;

    for python_binary in "python35" "python3.5"; do
        found="$(type -P ${python_binary} > /dev/null 2>&1; echo $?)";
        if [[ $found == 0 ]]; then
            type -P "${python_binary}";
            return 0;
        fi
    done

    return 1;
}

# ........................................................................... #
# download virtualenv, and create virtualenv3.py with a sheebang to python 3.5
# then make this virtualenv script available as ./bin/virtualenv.py
# Note: this will also clean up any past virtualenv
function main {
    local virtualenv_folder;
    local python_binary_name;

    cd "${SCRIPT_FOLDER}/bin";

    # remove existing virtualenv directory and symlink
    rm -rf virtualenv*

    # download the virtualenv tarball
    curl \
      --remote-name \
        "$(get_virtualenv_download_url)";

    # extract tarball
    tar xf virtualenv*.tar.gz;
    # remove downloaded tarball
    rm virtualenv*.tar.gz

    # get the folder for the extracted virtualenv
    virtualenv_folder="$(cd virtualenv-*/; pwd)";

    python_binary_name="$(basename $(find_python_binary))";

    # create virtualenv3.py with a sheebang to
    echo "#!/usr/bin/env ${python_binary_name}" > "${virtualenv_folder}"/virtualenv3.py;
    tail -n +2 "${virtualenv_folder}"/virtualenv.py >> "${virtualenv_folder}"/virtualenv3.py;
    chmod +x "${virtualenv_folder}"/virtualenv3.py;

    # create virtualenv.py symlink which symlinks it for virtualenv3.py
    ln -s virtualenv-*/virtualenv3.py virtualenv.py;

    echo "";
    echo "./bin/virtualenv.py for Python 3.5 is now available"

}

# ........................................................................... #
# use python and xmlrpc client to get the URL for virtualenv package
# this code accomodates both python2 and python3
# echo out the url
# user VIRTUALENV_PACKAGE_VERSION global variable
function get_virtualenv_download_url {
    local py_code="
PACKAGE_NAME='virtualenv';
PACKAGE_VERSION='${VIRTUALENV_PACKAGE_VERSION}';
PYPI_URL='https://pypi.python.org/pypi';

import sys

if sys.version_info.major == 2:
    import xmlrpclib as xmlrpc_client;
elif sys.version_info.major == 3:
    import xmlrpc.client as xmlrpc_client;

client = xmlrpc_client.ServerProxy(PYPI_URL);
release_urls = client.release_urls(PACKAGE_NAME, PACKAGE_VERSION);
url = [pkg['url'] for pkg in release_urls if pkg['packagetype'] == 'sdist'][0];
print(url);
sys.exit(0);
";

    echo "$(python -c "${py_code}")";
}


# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #
main;
