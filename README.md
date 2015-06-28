# Kensa Docker image

This is a Docker image for running the Heroku [Kensa](https://github.com/heroku/kensa) tool used when [developing Heroku Addons](https://devcenter.heroku.com/articles/building-a-heroku-add-on).

## How to use

Get instructions for using `kensa`:

```term
docker run friism/kensa kensa
```

Kensa needs your `addon-manifest.json` file to work. To do that, tou can mount the current directory in the kensa container:

```term
docker run -v $PWD:/root -ti friism/kensa kensa test manifest
```

Typically, you'll want to use the image with `docker-compose` to have `kensa` test your running code:

```term
$ cat docker-compose.yml
web:
  build: .
  command: <command to start your add-on service>
kensa:
  image: friism/kensa
  command: kensa test all --without-sso
  volumes:
    - .:/root
  links:
    - web
$ docker-compose up kensa
...
```