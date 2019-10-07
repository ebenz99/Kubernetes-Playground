from flask import Flask
from flask import request
app = Flask(__name__)

l = []


@app.route('/data', methods = ['GET','POST'])
def hello():
	if request.method == "POST":
		#print(request.args)
		name = request.args.get("name")
		print("HEY THERE %s" % name)
		l.append(name)
	print(l)
	return "Hello World!"

if __name__ == "__main__":
	app.run()