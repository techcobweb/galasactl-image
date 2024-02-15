#!/bin/env bash

echo "Entry point called"
echo "Parameters: $*"

# # A list of the supported versions.
# supported_versions=("0.30.0" "0.31.0")

# # Make sure a version has been selected.
# if [[ "${GALASA_VERSION}" == "" ]]; then 
#     echo "Error: Environment GALASA_VERSION needs to be set."
#     echo "For example 0.31.0"
#     echo "Supported versions are: ${supported_versions[*]}"
#     exit 1
# fi

# # Check that the version is one of those we support so far.
# if [[ ${supported_versions[@]} =~ $GALASA_VERSION ]]; then
#     echo "Info: Version $GALASA_VERSION of the 'galasactl' tool selected."
# else 
#     echo "Error: Unsupported version of Galasa tool requested ($GALASA_VERSION)"
#     exit 1
# fi
    
# Invoke the appropriate version of the tool.
/galasa/galasactl $*
