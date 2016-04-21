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

## Releasing a new version

Update the `.ini` file with the proper OpenProject version.

Make sure the `VERSION` numbers have been incremented if you've made changes to the `inst`/`uinst` files.

Use the provided `Makefile` to generate the require tarball with the right
structure as per the documentation at
<http://docs.software-univention.de/app-tutorial.html#provide>.

```
make all
```

This will package everything into an `openproject.tar.gz` file. You can then
upload it using the form at <https://upload.univention.de/upload.php>.


## Important

* The `inst` join script MUST BE IDEMPOTENT! See
  https://docs.software-univention.de/developer-reference.html#join:write. Make
sure that you're not overwriting any configuration file that may have been
updated by the package or the user.

