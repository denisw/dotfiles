#!/usr/bin/env python3
import argparse
import os
from pathlib import Path
import sys

prog = 'dotfiles.py'
description = 'Links or unlinks dotfiles for an app using GNU Stow.'


def parse_args():
    parser = argparse.ArgumentParser(prog=prog, description=description)
    parser.add_argument('-D', '--delete')
    parser.add_argument('command', choices=['link', 'unlink'])
    parser.add_argument('app')
    return parser.parse_args()


def target_directory(args):
    home = Path.home()
    if args.app == 'sublime-text':
        if sys.platform == 'darwin':
            return home / 'Library' / 'Application Support' / 'Sublime Text'
        else:
            return home / '.config' / 'sublime-text'
    else:
        return Path.home()

if __name__ == '__main__':
    args = parse_args()
    target = target_directory(args)

    stow_args = ['stow', args.app, '-t', str(target)]
    if args.command == 'unlink':
        stow_args.append('-D')

    os.execvp('stow', stow_args)
