# Shamelessly copied from http://flask.pocoo.org/docs/quickstart/

from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/hello2')
def hello_again():
    return 'Hiiiii!!!5!!'


if __name__ == '__main__':
    app.run()
