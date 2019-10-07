import requests

while True:
	mname = input("name:  ")
	URL = "http://127.0.0.1:5000/data"
	PARAMS = {'name':mname}
	r = requests.post(url = URL, params = PARAMS)
	print(r)