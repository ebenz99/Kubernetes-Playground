from flask import Flask
from flask import request
app = Flask(__name__)

l = []


@app.route('/data', methods = ['GET','POST'])
def hello():
	return "Hello World!"

if __name__ == "__main__":
	app.run()