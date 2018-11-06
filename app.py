'''
启动和管理项目
'''
from blog import create_app

app = create_app()

@app.route('/')
def index():
    return 'hellow'

if __name__ == '__main__':
    app.run()
