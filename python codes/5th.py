import numpy as np

def odess(coff_a, b0):
    k = len(coff_a)-1;

    a = np.zeros(shape=(k,k))
    for i in range (k-1):
        a[i][i+1] = 1
    for i in range(k):
        a[-1][i] = -coff_a[i]/ coff_a[k]

    b = np.zeros(shape=(k,1))
    b[-1] = b0/coff_a[k]

    return a, b