'''
主业务逻辑中的视图和路由定义
'''
import datetime
import os

from flask import render_template, request, redirect, session

from . import main
from ..models import *


# 主页的访问路经
@main.route('/')
@main.route('/index')
def index_views():
    categories = Category.query.all()
    print(categories)
    topics = Topic.query.filter(Topic.images.isnot(None)).order_by('read_num desc').limit(5).all()
    print(topics)
    topicList = Topic.query.order_by('pub_date desc').all()
    return render_template('index.html', params=locals())


@main.route('/test')
def test_1():
    print('这是测试数据')

# 登录的路径
@main.route('/login', methods=["GET", 'POST'])
def login_views():
    if request.method == "GET":
        if 'Referer' in request.headers:
            url = request.headers['Referer']
        else:
            url = '/'
        session['url'] = url
        return render_template('login.html')
    else:
        username = request.form.get('username')
        upwd = request.form .get('password')
        user = User.query.filter_by(user_name=username, upwd=upwd).first()
        if user:
            session['uid'] = user.id
            session['uname'] = user.nickname
            url = session['url']
            return redirect(url)
        else:
            errMsg = '用户名或密码不正确'
            return render_template('login.html', errMsg=errMsg)


# 清除session
@main.route('/logout')
def logout_views():
    if 'uid' in session and 'uname' in session:
        del session['uid']
        del session['uname']
    return redirect('/')

# 注册路径
@main.route('/register', methods=["GET", 'POST'])
def register_views():
    if request.method == "GET":
        if 'Referer' in request.headers:
            url = request.headers['Referer']
        else:
            url = request.headers['Host']
        session['url'] = url
        return render_template('register.html')
    else:
        user_name = request.form['username']
        users = User.query.filter_by(user_name=user_name).all()
        if users:
            errMsg = '用户名已存在'
            return render_template('register.html', errMsg=errMsg)
        user = User()
        user.user_name = user_name
        user.nickname = request.form['nickname']
        user.email = request.form['email']
        user.upwd = request.form['password']
        db.session.add(user)
        db.session.commit()
        session['uid'] = user.id
        session['uname'] = user.user_name
        url = session['url']
        return redirect(url)


# 发表博客路径
@main.route('/release', methods=["GET", 'POST'])
def release_views():
    categories = Category.query.all()
    topics = Topic.query.filter(Topic.images.isnot(None)).order_by('read_num desc').limit(5).all()
    if request.method == "GET":
        if 'uid' in session and 'uname' in session:
            user = User.query.filter_by(id=session['uid']).first()
            if user.is_author != 1:
                return redirect('/')
            categories = Category.query.all()
            blogTypes = BlogType.query.all()
            return render_template('release.html', params=locals())
        return redirect('/login')
    else:
        topic = Topic()
        topic.title = request.form.get('author')
        topic.blogtype_id = request.form.get('list')
        topic.category_id = request.form.get('category')
        topic.user_id = session.get('uid')
        topic.content = request.form.get('content')
        topic.pub_date = datetime.datetime.now()

        if request.files:
            # 存储图片
            f = request.files['picture']
            ftime = datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
            ext = f.filename.split('.')[1]
            filename = ftime + "." + ext
            topic.images = 'upload/' + filename
            basedir = os.path.dirname(os.path.dirname(__file__))
            upload_path = os.path.join(basedir, 'static/upload', filename)
            f.save(upload_path)

        db.session.add(topic)
        return redirect('/')


# 文章列表路径
@main.route('/list')
def list_views():
    categories = Category.query.all()
    topics = Topic.query.filter(Topic.images.isnot(None)).order_by('read_num desc').limit(5).all()
    if not request.args:
        topicList = Topic.query.order_by('pub_date desc').all()
    else:
        id = request.args.get('category_id')
        topicList = Topic.query.filter_by(category_id=id).order_by('pub_date desc').all()
    return render_template('list.html',params=locals())


# 文章路径
@main.route('/info', methods=["GET", 'POST'])
def info_views():
    categories = Category.query.all()
    topics = Topic.query.filter(Topic.images.isnot(None)).order_by('read_num desc').limit(5).all()
    if request.method == "GET":
        topic_id = request.args['topic_id']
        topic = Topic.query.filter_by(id=topic_id).first()
        topic.read_num = int(topic.read_num) + 1
        db.session.add(topic)
        db.session.commit()
        prevTopic = Topic.query.filter(Topic.id<topic_id).order_by('id desc').first()
        nextTopic = Topic.query.filter(Topic.id > topic_id).first()
        replies = Reply.query.filter_by(topic_id=topic_id).order_by('reply_time desc').all()
        number = len(replies)
        return render_template('info.html', params=locals())
    else:
        reply = Reply()
        reply.content = request.form['content']
        reply.user_id = request.form.get('user_id')
        reply.topic_id = request.form.get('topic_id')
        reply.reply_time = datetime.datetime.now()
        db.session.add(reply)
        db.session.commit()
        url = '/info?topic_id=' + str(reply.topic_id)
        return redirect(url)


# 相册路径
@main.route('/photo')
def photo_views():
    categories = Category.query.all()
    topics = Topic.query.all()
    return render_template('photo.html', params=locals())


# 时间轴路径
@main.route('/time')
def time_views():
    categories = Category.query.all()
    topics = Topic.query.order_by('pub_date desc').all()
    return render_template('time.html', params=locals())


# 关于我的路径
@main.route('/about')
def about_views():
    categories = Category.query.all()
    return render_template('about.html', params=locals())

# 留言路径
@main.route('/gbook', methods=['GET', 'POST'])
def gbook_views():
    replies = Reply.query.all()
    number = len(replies)
    categories = Category.query.all()
    topics = Topic.query.filter(Topic.images.isnot(None)).order_by('read_num desc').limit(5).all()
    if request.method == 'GET':
        return render_template('gbook.html', params=locals())
    else:
        reply = Reply()
        reply.content = request.form['content']
        reply.user_id = request.form['user_id']
        reply.topic_id = request.form['topic_id']
        reply.reply_time = datetime.datetime.now()
        db.session.add(reply)
        return redirect('/gbook')