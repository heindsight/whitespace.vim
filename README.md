#whitespace.vim

This plugin provides a commands to highlight or strip extraneous whitespace
at the ends of lines.

##Installation

You can use your favourite installation method. With Tim Pope's
[pathogen](https://github.com/tpope/vim-pathogen) it is simply a question of
cloning the `whitespace.vim` repository into your vim bundle directory.

```bash
    cd ~/.vim/bundle
    git clone git://github.com/heindsight/whitespace.vim
```

##Usage

Use the `:WSHighlightOn`, `:WSHighlightOff` and `:WSHighlightToggle` commands
to turn on, off or toggle highlighting of whitespace at ends of lines.

Use `:WSStrip` to remove trailing whitespace from a range of lines:

```vim
    :[range]WSStrip
```

##Customising

Whitespace highlighting uses the `ExtraWhitespace` highlight group. By default
this is linked to the standard `Error` group. The `highlight` command can be
used to customize highlighting. For example:

```vim
    :highlight ExtraWhitespace ctermbg=Green
```

## License

Copyright (c) 2015, Heinrich Kruger. Distributed under the MIT license (see the
LICENSE file).
