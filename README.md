LAST UPDATE:2017-02-20

# docker-zsh-completion
Zsh completion for [docker](http://docker.io) and [docker-compose](https://github.com/docker/compose).
Completion files on the original repositories are automatically imported to this repository once a day. The batch application is running to update them (please refer to [execute.sh](/execute.sh) which is used by the batch).


Please follow the following instructions to import completion files (After the instllation, they are registered to zsh's `fpath`).

## Installation

### For [zplug](https://github.com/zplug/zplug) users:

```sh
zplug "greymd/docker-zsh-completion"
```

### For [Antigen](http://antigen.sharats.me/) users:

```sh
antigen bundle "greymd/docker-zsh-completion"
```
