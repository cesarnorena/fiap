import unittest
import app.service.passport_validator_service as service


class PassportValidatorService(unittest.TestCase):

    def test_passport_allowed(self):
        is_allowed = service.is_passport_allowed(123456789)
        self.assertTrue(is_allowed)

    def test_passport_not_allowed(self):
        is_allowed = service.is_passport_allowed(596997461)
        self.assertFalse(is_allowed)
