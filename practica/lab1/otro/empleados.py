import pandas as pd
import numpy as np

empleados = pd.read_json('empleados.json',orient='columns')

for index, row in empleados.iterrows():
    print(
            'insert into trabajador values ({},\'{}\',\'{}\',{},\'{}\',{});'.format(
                    index + 15000000,
                    row['nombre'],
                    row['direccion'],
                    row['idLocalidad'],
                    row['telefono'],
                    row['valorHora'],
                )
            )

