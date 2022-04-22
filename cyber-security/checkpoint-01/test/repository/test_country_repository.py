import unittest

import app.repository.country_repository as repository


class TestCountryRepository(unittest.TestCase):

    def test_aus_list(self):
        aus_list = repository.get_list("aus")
        self.assertEqual(len(aus_list), 301)
        self.assertEqual(aus_list[0], 870234366)
