vimrc
=====

my ~/.vimrc

Required Vim 7.3 (2010-08-15)+


Vim addon manager
-----------------
[Vim-Plug](https://github.com/junegunn/vim-plug) used!


Required packages
-----------------

* `cscope` for [tczengming/autoload_cscope.vim](https://github.com/tczengming/autoload_cscope.vim).

* `git` for [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter).

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
