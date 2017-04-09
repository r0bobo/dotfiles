#!/usr/bin/env python3

import logging
import os
import re
import sys
from os.path import expanduser, join


def main():
    logging.basicConfig(
        format='%(levelname)s: %(message)s',
        level=logging.INFO
        )

    try:
        dot = dotfiles(expanduser(sys.argv[1]), expanduser(sys.argv[2]))
        dot.read_dotfile_cfg()
        dot.create_symlinks()
    except IndexError:
        logging.error('No dotfile folder specified')


class dotfiles:
    """."""

    link_list = []
    dotfile_dir_path = []
    dotfile_cfg_path = []

    def __init__(self, dotfile_dir_path, dotfile_cfg_path):
        self.dotfile_dir_path = dotfile_dir_path
        self.dotfile_cfg_path = dotfile_cfg_path

    def create_symlinks(self):
        for link in self.link_list:
            if os.path.exists(link[0]):
                try:
                    os.makedirs(os.path.dirname(link[1]), exist_ok=True)
                    os.symlink(link[0], link[1])
                except FileExistsError:
                    if os.path.islink(link[1]):
                        os.remove(link[1])
                    else:
                        logging.debug('{0:s} exists. Backing up to {0:s}.bak'
                                      .format(link[1])
                                      )
                        os.rename(link[1], '{:s}.bak'.format(link[1]))

                    os.symlink(link[0], link[1])
                finally:
                    logging.debug(
                        'Symlinking {0:s} to {1:s}'.format(link[0], link[1]))
            else:
                logging.error(
                    'Symlink source {0:s} does not exist'.format(link[0]))

    def read_dotfile_cfg(self):

        # TODO replace with python "configparser"
        regex = re.compile('(?:\\s|[^#])*\'(.*)\'\\s*\'(.*)\'$')

        with open(self.dotfile_cfg_path, 'r') as fil:
            for line in fil:
                logging.debug('Reading line: \"{}\"'.format(line))
                match = regex.match(line)
                if match:
                    logging.debug('Parsed {} : {} from config'.format(match.group(1), match.group(2)))
                    self.link_list.append((
                        join(self.dotfile_dir_path, expanduser(match.group(1))),
                        expanduser(match.group(2))))


if __name__ == '__main__':
    main()
