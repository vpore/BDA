m = int(input('enter mod: '))
n = int(input('enter number of hash functions: '))

hashes = []
for i in range(0, n):
	fxn = input(f'enter hash fxn {i+1}: ')
	hash = []
	for j in range(0, len(fxn)):
		if fxn[j] == 'x':
			if j == 0:
				hash.append(1)
			else:
				hash.append(int(fxn[j-1]))
		elif fxn[j] == '+':
			hash.append(int(fxn[j+1]))

	if len(hash) == 1:
		hash.append(0)
	hashes.append(hash)

filter = [0 for _ in range(0, m)]
print(f'\ncurrent bloom filter: {filter}')

n = int(input('\nenter number of values to insert: '))
for i in range(0, n):
	v = int(input(f'enter value {i+1}: '))
	for hash in hashes:
		filter[(v*hash[0]+hash[1]) % m] = 1
	print(f'current bloom filter: {filter}\n')

n = int(input('\nenter number of values to query: '))
for i in range(0, n):
	v = int(input(f'enter value {i+1}: '))
	neg = False
	for hash in hashes:
		if filter[(v*hash[0]+hash[1]) % m] == 0:
			print(f'{v} is surely not present - NEGATIVE\n')
			neg = True
			break

	if neg == False:
		print(f'{v} is probably present - FALSE POSITIVE\n')