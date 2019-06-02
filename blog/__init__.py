'''
对整个应用做初始化
1. 构建flask应用以及各种配置
2. 构建SQLAlchemy的应用
'''

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql
pymysql.install_as_MySQLdb()

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    # app.config['DEBUG'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:123456@127.0.0.1:3306/blog_db'
    app.config['SQLALCHEMY_COMMIT_ON_TEARDOWN'] = True
    app.config['SECRET_KEY'] = 'you guess'
    db.init_app(app)

    from .main import main
    app.register_blueprint(main)

    return app