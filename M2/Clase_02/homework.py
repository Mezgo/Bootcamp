import math as mt
import pandas as pd


def punto1(n):
    return print(2**n)


def punto2(N, n):
    # N! / n!(N-n)!
    return print(mt.factorial(N) / (mt.factorial(n) * mt.factorial(N-n)))


def punto3(total, casos):

    frecuencia = casos/total
    a = 'modelo frecuentista'

    Regiones = ['Norte', 'Noreste', 'Sur', 'Centro']
    Si = [148, 162, 296, 252]
    No = [52, 54, 74, 48]

    Datos = {'Si': Si,
             'No': No}

    df = pd.DataFrame(Datos, index=Regiones)
    #print(df)


def punto4(case):
    MASO  = 52
    COLOR = 26
    TIPO  = 13
    
    if case.low() == 'rojo' or case.low() == 'negro':
        return COLOR / MASO
    elif case.tolow() == 'picas' or case.low() == 'trebol' or case.low() == 'diamante' or case.low() == 'corazon':
        return TIPO  / MASO
print(punto4('Rojo'))

def test():
    return 'Hola mundo'
test()