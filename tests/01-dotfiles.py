import unittest
import subprocess
import os.path

programs = [
  'ansible',
  'terraform',
  'nvim',
  'tree',
  'aws',
  'vagrant',
  'virtualbox',
]

links = [
  '~/.zshrc',
  '~/.zshenv',
  '~/.zshaliases',
  '~/.zshfunctions',
  '~/.config/nvim',
  '~/.gitconfig',
  '~/.fzf.zsh',
  '~/.tmux.conf',
]

class DotfilesTest(unittest.TestCase):

  def test_programs_installed(self):
    for program in programs:
      with self.subTest(program=program):
        proc = subprocess.Popen(['which', program])
        proc.communicate()
        self.assertEqual(proc.returncode, 0)

  def test_links_placed(self):
    for link in links:
      with self.subTest(link=link):
        link_path = os.path.expanduser(link)
        dir_or_file = os.path.isfile(link_path) or os.path.isdir(link_path)
        self.assertTrue(dir_or_file and os.path.islink(link_path))
