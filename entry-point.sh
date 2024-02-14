#!/bin/env bash

echo "Entry point called"
echo "Parameters: $*"

if [[ "${GALASA_VERSION}" == "" ]]; then 
    echo "Error: Environment GALASA_VERSION needs to be set."
    echo "For example 0.30.0 or 0.31.0"
    exit 1
fi

supported_versions=("0.30.0" "0.31.0")

if [[ ${supported_versions[@]} =~ $GALASA_VERSION ]]; then
    echo "Info: Version $GALASA_VERSION of the 'galasactl' tool selected."
else 
    echo "Error: Unsupported version of Galasa tool requested ('$GALASA_VERSION}')"
    exit 1
esac
    
/galasa/galasactl-${GALASA_VERSION} $*
