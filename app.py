from flask import Flask
from flask_script import Manager
from App.views import bp
from App.ext import db
from flask_migrate import Migrate,MigrateCommand
from flask_moment import Moment
from App.extends import init_third
from App import models

app = Flask(__name__)
app.config.from_pyfile("settings.py")
db.init_app(app)
moment = Moment(app)
migrate = Migrate(db=db, app=app)
manager = Manager(app)
manager.add_command('db', MigrateCommand)
init_third(app)

app.register_blueprint(bp)



if __name__ == '__main__':
    manager.run()
