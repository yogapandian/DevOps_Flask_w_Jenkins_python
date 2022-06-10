''' Simple Flask Application 
'''

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
	return 'Hello, World'

@app.route('/greet/<username>')
def greet_user(username):
	return 'Hello, {}!'.format(username)


if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0')
