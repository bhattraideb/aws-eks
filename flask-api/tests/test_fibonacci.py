import pytest

from flask_api.views.fibonacci import generate_fibonacci, check_fibonacci


def test_fibonacci_0():
    assert generate_fibonacci(0) == []


def test_fibonacci_1():
    assert generate_fibonacci(1) == [0]


def test_negative_fibonacci():
    assert generate_fibonacci(-4) == []


def test_fibonacci_2():
    assert generate_fibonacci(2) == [0, 1]


def test_fibonacci_3():
    assert generate_fibonacci(3) == [0, 1, 1]


def test_fibonacci_5():
    assert generate_fibonacci(5) == [0, 1, 1, 2, 3]


def test_fibonacci_7():
    assert generate_fibonacci(7) == [0, 1, 1, 2, 3, 5, 8]


def test_check_fibonacci_1():
    assert check_fibonacci(1) is True


def test_check_fibonacci_3():
    assert check_fibonacci(3) is True


def test_check_fibonacci_4():
    assert check_fibonacci(4) is False


def test_check_fibonacci_7():
    assert check_fibonacci(7) is False
