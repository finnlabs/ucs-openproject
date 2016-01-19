# OpenProject version for UCS

This repo contains the scripts required to make OpenProject work on the UCS distribution.

We're following the Docker approach, outlined at <http://docs.software-univention.de/app-tutorial.html#docker:example:prerequisites>.

## Prerequisites

Ensure you have added the `openproject` debian-7 repo, otherwise the openproject package can't be downloaded.

## Status

What works:

* Registering the new app into a local appcenter appears to work
* Added the join scripts and store/restore data scripts
* Installing the packages required by the app (fails in the join script though)
