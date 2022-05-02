import unittest

from sklearn.metrics import precision_score

from repository import interpol_repository
from service import name_service, ValidatorError
from true_negative_names import true_negative_names
from true_positive_names import true_positive_names


class TestNameValidatorService(unittest.TestCase):
    name_list = None

    @classmethod
    def setUpClass(cls):
        cls.name_list = interpol_repository.get_list()

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

    # Precision is the chosen score since false positives have a high cost for the business
    def test_name_match_precision(self):
        x_test = true_positive_names + true_negative_names
        y_true = ([True] * len(true_positive_names)) + ([False] * len(true_negative_names))

        match = lambda txt: name_service._match(txt, self.name_list)
        y_pred = list(map(match, x_test))

        precision = precision_score(y_true, y_pred)
        print(f"Precision score: {precision}")

        self.assertGreater(precision, 0.99)
