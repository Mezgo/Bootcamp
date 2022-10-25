import math as mt


def NumeroBinarioEntero(num):
    if num >= 0 and type(num) == int:
        list = []
        while num != 0:
            list.append(str(num % 2))
            num = num // 2

        list.reverse()
        return print((''.join(list)))
    else:
        return None


NumeroBinarioEntero(12)


list = ['0', '.']


def NumeroBinarioDecimal(num):
    if type(num) == float:
        #isZero = False

        (deci, inte) = mt.modf(num*2)
        list.append(str(int(inte)))

        if deci == 0:
            #isZero = True
            return print(''.join(list))
        else:
            return NumeroBinarioDecimal(deci)

    else:
        return None


NumeroBinarioDecimal(0.2)


def NumeroBinarioDecimal_v2(num):

    bin = 0
    itr = 0
    

    while num != 0:
        num *= 2
        bin = bin + (num // 2) * (1/(10**itr))
        itr += 1
        num %= 2
        
        if itr == 10: break
    return print(bin)
NumeroBinarioDecimal_v2(0.2)