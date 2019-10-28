import requests

while True:
	mname = input("name:  ")
	URL = "https://ptsv2.com/t/ethan-place/post"
	#files = {'upload_file': open('dummy.log','rb')}
	PARAMS = {'name':mname}
	r = requests.post(url = URL, params = PARAMS)
	print(r)
	break
