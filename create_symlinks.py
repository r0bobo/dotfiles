#!/usr/bin/env python3

import os
import sys


def main():
    try:
        dot = dotfiles(os.path.expanduser(sys.argv[1]))
        dot.create_symlinks()
    except IndexError:
        print('ERROR: No dotfile folder specified')


class dotfiles:
    """."""

    link_list = []
    dotfile_dir_path = []

    def __init__(self, dotfile_dir_path):
        self.dotfile_dir_path = dotfile_dir_path

    def read_dotfile_cfg(self):
        pass

    def create_symlinks(self):
        link_list = [
                    ('nvim/init.vim', '~/.config/nvim/init.vim'),
                    ('nvim/airline.vimrc', '~/.config/nvim/airline.vimrc'),
                    ('nvim/general.vimrc', '~/.config/nvim/general.vimrc'),
                    ('nvim/plug.vimrc', '~/.config/nvim/plug.vimrc'),
                    ('tmux/tmux.conf', '~/.tmux.conf'),
                    ('tmux/tmuxline.conf', '~/.tmuxline.conf'),
                    ]

        for link in link_list:
            dst = os.path.expanduser(link[1])
            src = os.path.join(self.dotfile_dir_path, link[0])

            if os.path.exists(src):
                try:
                    os.symlink(src, dst)
                except FileExistsError:
                    if os.path.islink(dst):
                        os.remove(dst)
                    else:
                        print('{0:s} exists. Backing up to {0:s}.bak'.format(dst))
                        os.rename(dst, '{:s}.bak'.format(dst))
                    os.symlink(src, dst)
                finally:
                    print('Symlinking {0:s} to {1:s}'.format(src, dst))
            else:
                print('Symlink dstination {0:s} does not exist'.format(src))


if __name__ == '__main__':
    main()
