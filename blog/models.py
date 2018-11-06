'''
项目相关的模型文件
'''

from . import db


# 文章类型
class Category(db.Model):
    __tablename__ = 'category'
    id = db.Column(db.Integer, primary_key=True)
    cate_name = db.Column(db.String(50), nullable=False)
    topics = db.relationship('Topic', backref='category', lazy="dynamic")


# 博客类型
class BlogType(db.Model):
    __tablename__ = 'blogtype'
    id = db.Column(db.Integer, primary_key=True)
    type_name = db.Column(db.String(20), nullable=False)
    topics = db.relationship('Topic', backref='blogType', lazy="dynamic")

# 所有文章
class Topic(db.Model):
    __tablename__ = 'topic'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(
        db.String(200), nullable=False)
    pub_date = db.Column(
        db.DateTime, nullable=False)
    read_num = db.Column(db.Integer, default=0)
    content = db.Column(db.Text, nullable=False)
    images = db.Column(db.Text)
    category_id = db.Column(db.Integer, db.ForeignKey('category.id'))
    blogtype_id = db.Column(db.Integer, db.ForeignKey('blogtype.id'))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    replies = db.relationship('Reply', backref='topic', lazy="dynamic")

# 用户
class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    user_name = db.Column(db.String(30), nullable=False)
    nickname = db.Column(db.String(30), nullable=False)
    email = db.Column(
        db.String(200), nullable=False)
    upwd = db.Column(db.String(30), nullable=False)
    is_author = db.Column(db.SmallInteger, default=0)
    topics = db.relationship('Topic', backref='user', lazy='dynamic')
    replies = db.relationship('Reply', backref='user', lazy="dynamic")
    voke_topics = db.relationship(
        'Topic',
        secondary='voke',
        backref=db.backref('voke_users', lazy='dynamic'),
        lazy='dynamic'
    )


# 留言
class Reply(db.Model):
    __tablename__ = 'reply'
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.Text, nullable=False)
    reply_time = db.Column(db.DateTime)
    topic_id = db.Column(db.Integer, db.ForeignKey('topic.id'))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))


# 用户 - 文章 ,关联表
Voke = db.Table(
    'voke',
    db.Column('id', db.Integer, primary_key=True),
    db.Column('user_id', db.Integer, db.ForeignKey('user.id')),
    db.Column('topic_id', db.Integer, db.ForeignKey('topic.id')),
)