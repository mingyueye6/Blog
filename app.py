'''
启动和管理项目
'''
from blog import create_app

app = create_app()


if __name__ == '__main__':
    app.run()
