# OpenProject version for UCS

This repo contains the scripts required to make OpenProject work on the UCS distribution.

We're following the Docker approach, outlined at <http://docs.software-univention.de/app-tutorial.html#docker:example:prerequisites>.

## Testing locally

```bash
wget -qO - https://deb.packager.io/key | sudo apt-key add -
echo "deb https://deb.packager.io/gh/opf/openproject-ce wheezy stable/5" | sudo tee /etc/apt/sources.list.d/openproject-ce.list
sudo apt-get update
ucr set repository/online/unmaintained='yes'
apt-get install -y univention-appcenter-dev univention-appcenter-docker univention-appcenter
univention-app dev-setup-local-appcenter
```

Register the app (do it every time you change stuff):

```bash
./bin/test-local
```

Install the app:

```bash
univention-app install openproject
```

Remove the app:

```bash
univention-app remove openproject
```
