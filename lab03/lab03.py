def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """	
    if a%b == 0:
    	return b
    else:
        return gcd(b,a%b)    
    

def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    print(n)
    if n == 1:
        return n
    elif n%2 == 0:
        n = n//2
        return hailstone(n) + 1
    else:
        n = n*3 + 1
        return hailstone(n) + 1
