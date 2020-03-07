
# HOST = "127.0.0.1"
# USER = "root"
# PASSWORD = "123456"
# PORT = '3306'
# DATABASE = "day05"
# SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://'{USER}':'{PASSWORD}'@{HOST}:{PORT}/'{DATABASE}'"
from datetime import timedelta

DEBUG = True
SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:root@127.0.0.1:3306/bloge"
SQLALCHEMY_TRACK_MODIFICATIONS = False
SECRET_KEY = "fsao;n kdf644#!@$%@#s321gd2sgsd0$#!@$"

PERMANENT_SESSION_LIFETIME = timedelta(days=3)
PERMANENT = True


MAIL_SERVER = "smtp.126.com"
MAIL_USERNAME = "landmark_csl@126.com"
MAIL_PASSWORD = "land123"
