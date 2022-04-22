import unittest

import app.service.name_validator_service as service


class TestNameValidatorService(unittest.TestCase):

    def test_name_allowed(self):
        is_allowed = service.is_name_allowed("Cesar Norena")
        self.assertTrue(is_allowed)

    def test_name_not_allowed(self):
        is_allowed = service.is_name_allowed("Priscila dos Santos")
        self.assertFalse(is_allowed)
