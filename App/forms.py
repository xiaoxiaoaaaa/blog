import re

from flask import session
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.fields.html5 import EmailField
from wtforms.validators import DataRequired, Length, EqualTo, Email, ValidationError

# from models import *

from App.models import *


class RegisterForm(FlaskForm):
    username = StringField("用户名", validators=[DataRequired("请输入昵称")])
    password = PasswordField("密码", validators=[DataRequired("请输入密码"), Length(min=3, max=12, message="密码长度必须3位")])
    confirm = PasswordField("确认密码", validators=[EqualTo("password", message="两次密码不一致")])
    phone = StringField("手机号", validators=[DataRequired("请输入手机号")])
    vcode = StringField()
    phonecode = StringField()
    # 验证用户是否重名
    # 自定义的验证方法： validate_字段名
    def validate_username(self, field):
        # field是一个对象，获取用户输入的值应该是field.data
        user = User.query.filter(User.username == field.data).first()
        if user:
            raise ValidationError("用户名已存在")
        return field

    def validate_phone(self, field):
        if not re.match(r'(13\d|14[5|7]|15\d|166|17[3|6|7]|18\d)\d{8}$', field.data):
            raise ValidationError("电话号码不符合规则")
        return field

    def validate_vcode(self, field):
        if field.data != session.get('code'):
            raise ValidationError("验证码输入错误")
        return field

    def validate_phonecode(self, field):
        if field.data != session.get('sms'):
            raise ValidationError("短信验证码错误")
        return field