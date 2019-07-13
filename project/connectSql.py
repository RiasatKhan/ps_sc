from flask import Flask, jsonify
from flaskext.mysql import MySQL

app = Flask(__name__)
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'PSYCHIATRIC_SCREENING'
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'
mysql.init_app(app)