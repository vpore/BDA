input_str = input("Enter data -\n")
elements = input_str.split()
data = [int(x) for x in elements]

def hash(x):
    return ((6*x)+2)%5

def binary(x):
    return (bin(x)[2:])

def count(x):
    temp, final = 0,0
    one = False

    for i in x[::-1]:
        if i == '1':
            one = True
            break
        temp += 1
    
    if one:
        final = temp
    return final

hash_data = list(map(hash, data))
print("\nHash data - ", hash_data)

binary_data = list(map(binary, hash_data))
print("\nBinary data - ", binary_data)

count_data = list(map(count, binary_data))
print("\nCount data - ", count_data)

print("\nNo. of unique elements - ", 2**max(count_data))