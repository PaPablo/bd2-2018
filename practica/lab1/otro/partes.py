import pandas as pd
import numpy as np

parts = pd.read_csv('partes.csv',sep=';')


for pos, values in enumerate([p for p in parts['part'].values if len(p) < 50]):
    print('insert into falla values ({},\'{}\');'.format(pos+10,values))
