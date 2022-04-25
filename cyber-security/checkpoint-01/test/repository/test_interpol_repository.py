import unittest

import app.repository.interpol_repository as repository


class TestInterpolRepository(unittest.TestCase):

    def test_interpol_list(self):
        interpol_list = repository.get_list()
        self.assertEqual(len(interpol_list), 63)
        self.assertEqual(interpol_list[0], "priscila dos santos pereira")
