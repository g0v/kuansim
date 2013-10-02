# Kuansim

Kuansim is one of many projects initiated by “g0v”, a Taiwan-based NGO/NPO that aims to promote governmental information transparency, with a core vision of “creating the necessary tools and platforms that enable average folks to become socially active and aware citizens.”

With Kuansim, the developers of g0v wish to create a news platform that

1. introduces controversial topics and critical current events to average viewers,
1. provides notable commentaries and analysis for viewers to wholesomely understand each issue, and most importantly,
1. does follow-ups for each topic that would otherwise be easily forgotten by the public once the mainstream media loses its interest—which is often time the case for many issues in Taiwan.
1. In addition, this platform encourages active citizenship by providing a space for solution-based discussion. In sum, Kuansim is a project that keeps people continually “kuansim” (pay attention) to important issues and current event topics over a long duration of time.

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
(Add the git url in the end with space.)

# update all source codes

```
$ git submodule update --recursive
```

# run backend server.

Browse to the kuansim folder cloned from git.

```
$ cd cookbooks/kuansim/
$ vagrant up
```
The current project directory is shared as /vagrant in vagrant.

# run web frontend server.

```
$ cd frontend/web
$ npm run start
```

# setup git push url
All URLs of submodule are https. In order to push via ssh, add the following
configuration into ${HOME}/.gitconfig
```
[url "git@github.com:g0v/kuansim-frontend.git"]
    pushInsteadOf = https://github.com/g0v/kuansim-frontend.git
[url "git@github.com:g0v/kuansim-backend.git"]
    pushInsteadOf = https://github.com/g0v/kuansim-backend.git
[url "git@github.com:g0v/kuansim_chrome.git"]
    pushInsteadOf = https://github.com/g0v/kuansim_chrome.git
[url "git@github.com:g0v/kuansim-devops.git"]
    pushInsteadOf = https://github.com/g0v/kuansim-devops.git
```

# Acknowledgement

- Benjamin Tsai 
- Emily Lin
- raejin
- Michael Huang
- samuelololol

# See also

- Project site: http://hack.g0v.tw/kuansim
- Bug report or feedback here
