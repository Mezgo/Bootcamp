import numpy as np

list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
listNP = np.arange(1, 11)
print('\nEJERCICIO 1\n')
print('1. En ambos se pueden crear listas:\n',
      'list = [1,2,3,4,5,6,7,8,9,10]:\n {} \n listNP = np.arange(1, 11): \n {}\n'.format(list, listNP))

print('2. sumarle al arreglo un escalar:\n',
      'listNP = {}\n listNP + 10 = {}\n'.format(listNP, listNP + 10))

ar1 = np.array([1, 2, 3, 4])  # n,...
ar2 = np.array([[1], [5], [10]])  # n,1
ar3 = np.array([[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]])  # 1,n
print('3. \n(n,):\n', 'ar1: {}\n ar1.shape = {}\n'.format(ar1, ar1.shape), '\n(n,1):\n ar2: \n {}\n ar2.shape = {}\n'.format(ar2, ar2.shape),'\n(1,n):\n ar3: {}\n ar3.shape = {}'.format(ar3, ar3.shape))

print('\nEJERCICIO 2\n')

E2a1 = np.arange(0,10)
E2a2 = np.linspace(0, 9, 100)
print('1.\n E2a1: {}\n'.format(E2a1),
      '\n2.\n E2a2: {}\n'.format(E2a2))

print('\nEJERCICIO 3\n')

E3a1 = np.arange(10,101)
print('1.\n E3a1: \n {} \n\n Los elementos divisibles por 3 son: \n {} \n'.format(E3a1, E3a1[E3a1 % 3 == 0]))

print('2.\n {}'.format(np.full_like(E3a1[][], )))