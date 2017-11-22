# Squid Contianer image

Create a container image for the squid internetproxy with verry basic default settings.

## Usage

```
docker run -d -p 3128:3128 --name squid  squid:latest
```

### Build

```
git clone this repo
```

modify source/squid.conf as you want other settings

```
./build.sh [<tag>]
```