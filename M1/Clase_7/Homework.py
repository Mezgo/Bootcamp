from Tree import *

a = Tree(8)

#a.nodeIn(8)
print(f'El root: \n {a.root.data}')

a.nodeIn(9)
print(f'Hoja der: \n {a.root.right.data}')

a.nodeIn(7)
print(f'Hoja izq: \n {a.root.left.data}')

a.nodeIn(6)
print(f'Encontrando a 6: {a.root.left.left.data}')

a.lookData(5)

a.showTree()