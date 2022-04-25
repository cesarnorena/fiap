import unittest

import app.service.name_validator_service as service


class TestNameValidatorService(unittest.TestCase):

    def test_remove_numbers(self):
        name = service._remove_numbers("Cesar 123")
        self.assertEqual("Cesar", name)

        name = service._remove_numbers("123 Cesar")
        self.assertEqual("Cesar", name)

        name = service._remove_numbers("Cesar 123 Norena")
        self.assertEqual("Cesar  Norena", name)

    def test_name_allowed(self):
        is_allowed = service.is_name_allowed("Cesar Norena")
        self.assertTrue(is_allowed)

    def test_name_not_allowed(self):
        is_allowed = service.is_name_allowed("Priscila dos Santos")
        self.assertFalse(is_allowed)
