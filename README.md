vimrc
=====

my ~/.vimrc

Required Vim 7.3 (2010-08-15)+


Vim addon manager
-----------------
[Vim-Plug](https://github.com/junegunn/vim-plug) used!


256-colors terminal
-------------------

I enabled 256 colors in vim, so you should use it with a terminal supported 256 colors to get full effect.
AFAIK, recent modern terminal emulators have already supported 256 colors, but not `rxvt-unicode` (URxvt) which can be replace with `rxvt-unicode-256color`.
Please check [256 colors in vim](http://vim.wikia.com/wiki/256_colors_in_vim) for more details.


Required packages
-----------------

* `pdftotext` for `:Rpdf` custom command to view PDF file inside vim.
  (Note that the executable is located in a not intuitive Ubuntu package name `poppler-utils`.)

* `cscope` for [tczengming/autoload_cscope.vim](https://github.com/tczengming/autoload_cscope.vim).

* `git` for [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) and [tjennings/git-grep-vim](https://github.com/tjennings/git-grep-vim).

* Android `adb` for [thinca/vim-logcat](https://github.com/thinca/vim-logcat).

* `ack` (`ack-grep`) for [mileszs/ack.vim](https://github.com/mileszs/ack.vim).

    Ubuntu need to add a symlink `ack` linked to `ack-grep` package
    by `update-alternatives` command.

    - for Ubuntu 12.04: (no man page file from [ack-grep 2.12 PPA](https://launchpad.net/~leonard-ehrenfried/+archive/ubuntu/ack2))
    ```bash
    sudo update-alternatives --install /usr/bin/ack ack /usr/bin/ack-grep 100
    ```

    - for Ubuntu 14.04+:
    ```bash
    sudo update-alternatives --install /usr/bin/ack ack /usr/bin/ack-grep 100 --slave /usr/share/man/man1/ack.1p.gz ack.1p.gz /usr/share/man/man1/ack-grep.1p.gz
    ```

    Moreover, `ack` must be newer than v2.0, so Ubuntu 12.04
    need one more step to upgrade from v1.92 by adding [ack-grep 2.12 PPA](https://launchpad.net/~leonard-ehrenfried/+archive/ubuntu/ack2).

    ```bash
    sudo add-apt-repository ppa:leonard-ehrenfried/ack2
    sudo apt-get update
    sudo apt-get dist-upgrade
    ```
