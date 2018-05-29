import unittest

from pystan import StanModel, stan

class TestCovExpQuad(unittest.TestCase):
    """
    Unit test added to address issue discussed here: https://github.com/stan-dev/pystan/issues/271
    """
    
    covexpquad = """
        data {
        real rx1[5];
    }
    model {
        matrix[5,5] a;

        a = cov_exp_quad(rx1, 1, 1);
    }
        """

    def test_8schools_pars(self):
        model = StanModel(model_code=self.covexpquad)
        self.assertIsNotNone(model)
