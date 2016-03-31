# Build

```sh
make
```

# Run

## Environment variables

Setup the following env variables:

* `MYSQL_ROOT_PASSWORD=?`
* `MYSQL_USER=phabricator`
* `MYSQL_PASSWORD=?`
* `MYSQL_DATABASE='phabricator\_%'`

## Volumes

Mount a volume into `/var/lib/mysql`.
