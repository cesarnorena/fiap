import unittest

import app.repository.interpol_repository as repository


class TestInterpolRepository(unittest.TestCase):

    def test_interpol_list(self):
        interpol_list = repository.get_list()
        self.assertEqual(63, len(interpol_list))
        self.assertEqual("priscila dos santos pereira", interpol_list[0])
