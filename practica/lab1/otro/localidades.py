import pandas as pd
import numpy as np

localidades = pd.read_csv('localidades.csv')

for p,v in enumerate(localidades['localidad'].values):
    print('insert into localidad values ({},\'{}\');'.format(p+1,v))
