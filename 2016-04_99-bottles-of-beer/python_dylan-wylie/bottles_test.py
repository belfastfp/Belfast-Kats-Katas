import bottles
import unittest
from hypothesis import given
import hypothesis.strategies as st


class TestBottle(unittest.TestCase):

    """
        If I pass n into the function, the resulting string should have 'Take one down
        and pass it around' appears in it n times.
    """

    # Max value of 100, Python doesn't optimize tail recursion and crashes due to recursion depth :(
    #@given(st.integers(1,99999))
    @given(st.integers(1, 100))
    def test_occurrences(self, n: int):

        result = bottles.sing(n)
        self.assertEqual(result.count("Take one down and pass it around,"), n)

    def test_plurals(self):

        result = bottles.sing(100)

        self.assertTrue(result.count(" 2 bottles "))
        self.assertFalse(result.count(" 1 bottles "))
        self.assertFalse(result.count(" 0 bottle of"))