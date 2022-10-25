
archive = open('Emisiones_CO2.csv', 'r', encoding='latin-1')

emisiones = {'cod_pais': [],
             'nom_pais': [],
             'region': [],
             'anio': [],
             'co2': [],
             'co2_percapita': []}

missVal = False



# print(archive.readline()[0:3])
next(archive)
line = archive.readline()
while line:
    line = line.strip()
    el = line.split('|')

    emisiones['cod_pais'].append(el[0])
    emisiones['nom_pais'].append(el[1])
    emisiones['region'].append(el[2])
    emisiones['anio'].append(el[3])
    emisiones['co2'].append(el[4])
    emisiones['co2_percapita'].append(el[5])
    line = archive.readline()

print('este es el diccionario', emisiones.keys())
cod = len(emisiones['cod_pais'])
nom = len(emisiones['nom_pais'])
reg = len(emisiones['region'])
anio = len(emisiones['anio'])
co2 = len(emisiones['co2'])
co2_percapita = len(emisiones['co2_percapita'])
print('Cantidad de datos por variable: \n cod: {}\n nom: {}\n reg: {}\n anio: {}\n co2: {}\n co2_percapita: {} \n Total: {}'.format(
    cod, nom, reg, anio, co2, co2_percapita, (cod+nom+reg+anio+co2+co2_percapita)))
numVar = len(emisiones)
print('La cantidad de variables que hay es:', numVar)

# print(emisiones['region'])
co2total = []
co2PerCaptotal = []
for i, e in enumerate(emisiones['region']):
    if 'América Latina y Caribe' in e:
        #print(i, 'Aqui estoy',(e))
        if emisiones['anio'][i] == '2010':

            '''print(emisiones['cod_pais'][i],
                  emisiones['nom_pais'][i],
                  emisiones['region'][i],
                  emisiones['anio'][i],
                  emisiones['co2'][i],
                  emisiones['co2_percapita'][i])'''

            #print('ANTES DE IF', emisiones['co2_percapita'][i])

            if emisiones['co2_percapita'][i] == '':
                #print('ENTRA', emisiones['co2_percapita'][i])
                emisiones['co2_percapita'][i] = None
                valCO2Cap = 0
                co2PerCaptotal.append(valCO2Cap)
                
            else:
                #print('ANTES ERROR', emisiones['co2_percapita'][i])
                valCO2Cap = emisiones['co2_percapita'][i].replace(',', '.')
                #print('ERROR', valCO2Cap)
                co2PerCaptotal.append(float(valCO2Cap))

            if emisiones['co2'][i] == '':
                emisiones['co2'][i] = None
                valCO2 = 0
                co2total.append(valCO2)

            else:
                valCO2 = (emisiones['co2'][i].replace('.', ''))
                valCO2 = valCO2.replace(',', '.')
                co2total.append(float(valCO2))


#for i, e in enumerate(emisiones):
    
print('La cantidad de CO2 en América latina es de: {}kt'.format(
    round(sum(co2total), 3)))

#print(emisiones['nom_pais'][0])
print('La cantidad de CO2 per Capita en América latina es de: {}kt'.format(round(sum(co2PerCaptotal), 3)))


archive.close()
