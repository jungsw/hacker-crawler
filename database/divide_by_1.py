

def divide_to_one(n):
	'''
	if (n % 3 == 0), valid operation
	if (n % 2 == 0), valid operation
	if (n - 1 > 0), valid operation
	d(n) = min( d(n/3), d(n/2), d(n-1) ) + 1
	'''
	d = [0] * (n + 1)
	for i in xrange(2, n + 1):
		if i - 1 > 0:
			d[i] = d[i-1] + 1
		if i % 2 == 0 and d[i/2] >= d[i]:
			d[i] = d[i/2] + 1
		if i % 3 == 0 and d[i/3] >= d[i]:
			d[i] = d[i/3] + 1
	return d[n]


def main():
	# test case 1
	divide_to_one(1)

	# test case 2
	divide_to_one(3)

	# test case 3
	divide_to_one(5)

	# test case 4
	divide_to_one(10)

	# test case 5
	divide_to_one(35)


main()