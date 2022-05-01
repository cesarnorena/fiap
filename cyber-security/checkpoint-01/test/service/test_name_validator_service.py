import unittest

from app.service import *


class TestNameValidatorService(unittest.TestCase):

    def test_error_on_empty_name(self):
        with self.assertRaises(ValidatorError):
            name_service.is_name_allowed("")

    def test_error_on_name_with_error(self):
        with self.assertRaises(ValidatorError):
            name_service.is_name_allowed("Ces4r 123")

    def test_name_allowed(self):
        is_allowed = name_service.is_name_allowed("Cesar Norena")
        self.assertTrue(is_allowed)

    def test_name_not_allowed(self):
        is_allowed = name_service.is_name_allowed("Priscila dos Santos")
        self.assertFalse(is_allowed)
