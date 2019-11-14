import redis
#r = redis.Redis(host='localhost', port=6379, db=0)
#r = redis.StrictRedis(host="192.168.99.103", port=31334, db=0, password=')
r = redis.StrictRedis(host="192.168.99.103", port=31334, db=0)
r.set("key", "value")
print(r.get('key'))