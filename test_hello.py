from hello import app


def test_hello():
    response = app.test_client().get('/')

    assert response.status_code == 200
    assert response.data == b'Hello World!'


def test_hello2():
    response = app.test_client().get('/hello2')

    assert response.status_code == 200
    assert response.data == b'Hiiiii!!!5!!'
