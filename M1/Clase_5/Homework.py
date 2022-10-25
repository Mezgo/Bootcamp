import Estructuras as dt
import random as rn


def punto1():
    pila = dt.Stack()

    win = False
    POINTS = 10
    #suma = 0

    for e in range(1, 21):
        pila.push(rn.randint(1, 20))

    print(pila.show())

    print('¿Cuantos elementos, de derecha a izquierda, al sumarse dan menos de 50?:')
    inp = int(input())

    # print(input)

    def jugar(inp):
        suma = 0
        i = 0
        sel = []
        while i < inp:
            el = pila.pop()
            suma += el
            sel.append(el)
            i += 1

        print('Estas son tus elecciones: {}'.format(sel))
        print('Suma=', suma)

        w, p = validarVictoria(suma)
        if w == win:
            print('------GAME OVER------')
            print('Puntos: {}'.format(p))
        else:
            print('------VICTORIA------')
            print('Puntaje: {}'.format(p))

    def validarVictoria(val: int):

        print('VALIDANDO...')
        if val > 50:
            return False, 0

        elif val == 50:
            return True, POINTS

        elif val < 50:
            return descuento(val)

    def descuento(val):
        i = 0
        points = 10
        missEls = []
        while val < 50:

            fal = pila.pop()
            val += fal
            print('Siguiente elemento:', fal)
            print('Suma=', val)

            if val > 50:
                break
            else:
                missEls.append(fal)
                i += 1

        print('Estos son los números que faltaron: {}'.format(missEls))
        print('Descuento:', i*5)

        points -= i*5

        if points <= 0:
            return False, 0

        else:
            return True, points

    jugar(inp)
#punto1()

def punto2():
    ll