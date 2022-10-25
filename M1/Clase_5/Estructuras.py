class Stack(object):
    def __init__(self):
        self.__list = []

    def push(self, el):
        self.__list.append(el)

    def pop(self):
        return self.__list.pop()

    def size(self):

        if self.__list == []:
            return 'empty'
        else:
            return len(self.__list)

    def show(self):
        return self.__list

class Queue(object):
    def __init__(self):
        self.__list = []

    def enqueue(self, el):
        self.__list.insert(0, el)

    def dequeue(self, el):
        return self.__list.pop()

    def size(self):

        if self.__list == []:
            return 'empty'
        else:
            return len(self.__list)
