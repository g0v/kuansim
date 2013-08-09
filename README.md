# Kuansim

A society issues tracking system

- [How to join](https://g0v.hackpad.com/--1OaXIxVVPSd)

# prepare 

## install vagrant

http://downloads.vagrantup.com/

Don't install from Ubuntu/Linux Mint Software Center.

## install vagrant berkshelf

```
$ vagrant plugin install vagrant-berkshelf
```

# Get all source codes.

```
$ git clone --recursive
```

# update all source codes

```
$ git update --recursive
```

# run backend server.

```
$ cd cookbooks/kuansim/
$ vagrant up
```

# run web frontend server.

```
$ cd frontend/web
$ npm run start
```

# See also

- Project site: http://hack.g0v.tw/kuansim
- Bug report or feedback here
