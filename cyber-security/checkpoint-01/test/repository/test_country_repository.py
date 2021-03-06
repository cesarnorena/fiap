import unittest

from repository import country_repository as repository


class TestCountryRepository(unittest.TestCase):

    def test_aus_list(self):
        aus_list = repository.get_list("aus")
        self.assertEqual(len(aus_list), 301)
        self.assertEqual("870234366", aus_list[0], )

    def test_fra_list(self):
        aus_list = repository.get_list("fra")
        self.assertEqual(len(aus_list), 301)
        self.assertEqual("316363850", aus_list[0], )
