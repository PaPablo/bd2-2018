# DataFrame desde postgres
# Base de datos SQLAlchemy para sacar el DataFrame
import pandas as pd
import numpy as np

models = pd.read_csv('descripcionModeloAvion.csv')

models.to_csv('otro.csv',quotechar='\'')

f = lambda x: "insert into \"{}\" values ('{}')".format('descripcionModeloAviones',x)

print(';\n'.join(list(map(f, models['model'].values))))

