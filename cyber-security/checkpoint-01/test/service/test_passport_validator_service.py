import unittest

import app.service.passport_validator_service as service
from app.service.validator_error import ValidatorError


class PassportValidatorService(unittest.TestCase):

    def test_error_on_empty_passport(self):
        with self.assertRaises(ValidatorError):
            service.is_passport_allowed("")

    def test_error_on_special_chars(self):
        with self.assertRaises(ValidatorError):
            service.is_passport_allowed("aus-0123456789")

    def test_error_on_wrong_format(self):
        with self.assertRaises(ValidatorError):
            service.is_passport_allowed("cesar0123456789")

    def test_error_missing_country(self):
        with self.assertRaises(ValidatorError):
            service.is_passport_allowed("123456789")

    def test_passport_allowed(self):
        is_allowed = service.is_passport_allowed("aus123456789")
        self.assertTrue(is_allowed)

    def test_passport_not_allowed(self):
        is_allowed = service.is_passport_allowed("aus752706488")
        self.assertFalse(is_allowed)
