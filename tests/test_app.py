import pytest
import my_app

@pytest.fixture
def client():
    my_app.app.config['TESTING'] = True
    client = my_app.app.test_client()

    yield client


def test_hello_world_success(client):
	rv = client.get('/')
	assert rv.data
	assert b'Hello, World' == rv.data

def test_hello_world_fail(client):
	pass
