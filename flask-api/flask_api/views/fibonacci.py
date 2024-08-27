import math


def is_perfect_square(x):
    s = int(math.sqrt(x))
    return s * s == x


def generate_fibonacci(n) -> list:
    if n <= 0:
        return []
    if n == 1:
        return [0]
    result = [0, 1]
    if n == 2:
        return result
    for i in range(2, n):
        result.append(result[i - 2] + result[i - 1])
    return result


def check_fibonacci(n):
    # A number is Fibonacci in nature if and only if (5*n2 + 4) or (5*n2 – 4) is a perfect square.
    # if one of 5*n*n + 4 or 5*n*n - 4 or both is a perfect square
    return is_perfect_square(5 * n * n + 4) or is_perfect_square(5 * n * n - 4)
