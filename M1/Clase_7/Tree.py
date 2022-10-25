
from Node import *


class Tree():
    def __init__(self, data):
        self.root = Node(data)

    def __nodeIn(self, data, nod):

        if nod is None:
            print('ERROR: debe ingresar la raiz en la instancia')
        else:
            if data < nod.data:
                if nod.left is None:
                    nod.left = Node(data)
                else:
                    print(f'Este es el nod que ya esta a la izq: {nod.left.data}')
                    self.__nodeIn(data, nod.left)

            else:
                if nod.right is None:
                    nod.right = Node(data)
                else:
                    print(
                        f'Este es el nod que ya esta a la der: {nod.right.data}')
                    self.__nodeIn(data, nod.right)

    def __lookData(self, data, nod):
        if nod is None:
            print('Am I a joke to You?')
        else:
            if nod.data is data:
                return print(f'La busqueda se encuentra en:\n {nod}')
            elif data < nod.data:
                return self.__lookData(data, nod.left)
            else:
                return self.__lookData(data, nod.right)

    def __showTree(self, nod):
        if nod is not None:
            print(nod.data, end=',')
            self.__showTree(nod.left)
            self.__showTree(nod.right)
            
        pass
    
    ''' ------- FUNCIONES PÚBLICAS ------- '''
    def nodeIn(self, data):
        self.__nodeIn(data, self.root)

    def lookData(self, data):
        self.__lookData(data, self.root)

    def showTree(self):
        print(f'Imprimiendo arbol...\n')
        self.__showTree(self.root)
        