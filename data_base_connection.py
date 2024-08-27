import pandas as pd
import os
from dotenv import find_dotenv, load_dotenv
from sqlalchemy import create_engine

#loading environment variables
dotenv_path = find_dotenv()
load_dotenv(dotenv_path)
username = os.getenv('username')
password = os.getenv('password')
host = os.getenv('host')
port = os.getenv('port')
database = os.getenv('database')
df = pd.read_csv('data/cleaned_data.csv')

engine = create_engine('mysql+pymysql://'+username+':'+password+'@'+host+':'+str(port)+'/'+database)

connection = engine.connect()

df.to_sql('retail_orders', connection, index = False, if_exists='append')