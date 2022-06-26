# Shamelessly copied from http://flask.pocoo.org/docs/quickstart/

from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/hello2')
def hello_again():
    return 'Hiiiii!!!5!!'


def test_hello():
    response = app.test_client().get('/')

    assert response.status_code == 200
    assert response.data == b'Hello World!'


def test_hello2():
    response = app.test_client().get('/hello2')

    assert response.status_code == 200
    assert response.data == b'Hiiiii!!!5!!'


if __name__ == '__main__':
    app.run()

