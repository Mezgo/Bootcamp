from re import A
from unicodedata import decimal
import pandas as pd

df = pd.read_csv('Emisiones_CO2.csv', sep='|', decimal=',', encoding='latin-1')
dfCopy = df.copy()

codPais = df.iloc[:,0]
hashCP = codPais.apply(lambda key: sum(index * ord(character) for index, character in enumerate(repr(key), start=1)))

#print(hashCP)

dfCopy['Clave_Hash'] = hashCP
df['Clave_Hash'] = hashCP

'''print(dfCopy.iloc[710])
print(df.iloc[710])'''

#print(dfCopy['Clave_Hash'])

hashNoRep = dfCopy['Clave_Hash'].unique()
s = pd.Series(hashNoRep)
print(type(s))
