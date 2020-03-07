from flask import Blueprint, render_template, session, redirect, request, flash, url_for, make_response, jsonify, \
    current_app
from flask_login import login_user
from sqlalchemy import distinct, or_, func
import hashlib
from App.models import *
from App.forms import RegisterForm
# from App.blog import *
from App import models

from random import randint
from flask_mail import Message
from App.SMS import sms
from App.extends import mail
from App.verifycode import  vc


bp = Blueprint('bp',__name__)


def check_login(func):
    def inner(*args, **kwargs):
        if session.get("username"):
            return func(*args, **kwargs)
        else:
            return redirect("/login/")
    return inner()


@bp.route("/")
def home():
    #查询文章数据
    username = session.get('username')
    categorys = Category.query.all()
    tags = Tag.query.all()
    users = User.query.all()
    articles = Article.query.all()
    return render_template("index.html",**locals())

# 博文分类展示
@bp.route("/list/")
@bp.route("/list/<int:cid>/")
@bp.route("/list/<int:cid>/<int:page>/")
def list_article(cid=-1,page=1):
    if cid < 0: # 如果cid不带参数，值-1，就查询默认分类
        # 获取默认分类中所有的文章数据
        category = Category.query.first()
        cid = category.cid  # 获取第一个cid

    # articles = db.session.query(Article, Category).filter(Article.cid == Category.cid, Category.cid == cid)
    obj = db.session.query(Article, Category).filter(Article.cid == Category.cid, Category.cid == cid)
    pagination = obj.paginate(page,2)

    categories = Category.query.all()
    print(categories)
    three_articles = Article.query.order_by(-Article.create_time).all()[:3]
    return render_template("blog.html",**locals())

@bp.route('/post/')
@bp.route('/post/<int:aid>/')
def post(aid=-1):
    if aid < 0:
        article = Article.query.first()
        aid = article.aid
    articles = db.session.query(Article, Category).filter(Article.cid == Category.cid, Article.aid == aid).all()
    print(articles)
    article_num = len(articles)
    print(article_num)
    categories = Category.query.all()
    print(categories)
    tree_articles = Article.query.order_by(-Article.create_time).all()[:3]
    tags = Tag.query.all()
    print(tags)
    marks = db.session.query(Mark, Article).filter(Mark.aid == Article.aid, Mark.aid == aid).all()
    print(marks)
    mark_num = len(marks)
    users = User.query.all()
    return render_template("post.html", **locals())





@bp.route("/login/",methods=['GET','POST'])
def login():
    form = RegisterForm()
    if request.method == 'POST':
        username = request.values.get('username')
        password = request.values.get('password')
        user = User.query.filter(User.username==username,User.password==password).first()
        if user:
            # login_user(user)
            session["name"]="23232"
            return redirect(url_for('bp.home'))
        else:
            flash("用户名或密码错误")
        #     return redirect(url_for("bp.login"))
    return render_template("login.htm",**locals())

# @bp.route("/reply/")
# @check_login
# def user_reply():
#     return "回复"



@bp.route('/register/', methods=['GET', 'POST'])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST':
        if form.validate_on_submit():
            # 获取数据
            phone = form.phone.data
            username = form.username.data
            password = form.password.data
            # 创建用户
            user = User()
            user.username = username
            user.password = password
            user.phone = phone
            user.portrait = "/static/img/avatar-1.jpg"
            # user.regtime = datetime.datetime.now()
            user.email = "123@qq.com"
            # 将用户存到数据库
            db.session.add(user)
            db.session.commit()
            return redirect(url_for('bp.login'))
    return render_template('register.htm', **locals())

@bp.route("/verify/")
def verify_code():
    result = vc.generate()
    session['code'] = vc.code
    response = make_response(result)
    response.headers["Content-Type"] = "image/png"
    return response

@bp.route("/send/", methods=['GET', 'POST'])
def send_sms():
    if request.method == 'POST':
        # 产生验证码
        phone = request.values.get("phone")
        print(phone)
        num = randint(1000, 9999)
        # 添加到session
        session['sms'] = str(num)
        print(num)
        para = "{'code':'%d'}" % num
        res = sms.send(phone,para)
        print(res)
        return "已经发送"
    return "发送失败"
#
# 短信验证


# @bp.route("/send/",methods=["GET","POST"])
# def send_sms():
#     if request.method == "POST":
#         phone = request.values.get('phone')
#         print(phone)
#         if phone:
#             # 产生验证码
#             num = randint(1000,9999)
#             print(num)
#             # 添加到session
#             para = "{'number':'%d'}" % num
#             session['sms'] = str(num)
#
#             # res = sms.send(phone,para)
#             # print(res,type(res))
#             return "成功"
#     return "失败"
#
# # 用户注册
# @bp.route("/register/",methods=['GET','POST'])
# def register_user():
#     form = RegisterForm()
#     if request.method == 'POST':
#         if form.validate_on_submit():
#             print(form)
#             return redirect('/')
#     return render_template("register.htm",**locals())
#
# # 邮件发送
# @bp.route("/mail/")
# def send_mail():
#     # 创建消息对象
#     message = Message(subject="武汉加油",
#                       recipients=['1811353001@qq.com','1811353001@qq.com'],
#                       sender=current_app.config.get("MAIL_USERNAME"))
#     message.body = "中国加油"  # 文本邮件
#     mail.send(message)
#     return "发送成功"
# @bp.route("/list1/")
# @bp.route("/list1/<int:page>/")
# def list_user(page=1):
#     # 搞清楚页码和记录关系：limit (page-1)*10,10
#     # 获取分页对象
#     pagination = User.query.paginate(page,2)
#     print(pagination.__dict__)
#     return render_template("list1.html",**locals())