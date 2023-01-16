# dotfiles

dotfile repo based on [dotbot](https://github.com/anishathalye/dotbot) 

## install to new host

```sh
git clone https://github.com/mirweb/dotfiles.git ~/.dotfiles --recursive
cd ~/.dotfiles && ./install
```

## pull updates 

```sh
cd ~/.dotfiles
git pull
./install
```

## bootsrap extra settings

* changing default chell needs sudo to root rights

```sh
cd ~/.dotfiles
./install -c bootstrap.conf.yaml 
```