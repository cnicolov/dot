import unittest
import subprocess

class CommandNotFoundException(Exception): pass

programs = [
  'ansible',
  'terraform',
  'nvim',
  'tree',
  'aws',
  'vagrant',
  'virtualbox',
]

class ProgramsTest(unittest.TestCase):

  def test_programs_installed(self):
    for program in programs:
      with self.subTest(program=program):
        proc = subprocess.Popen(['which', program])
        proc.communicate()
        self.assertEqual(proc.returncode, 0)
