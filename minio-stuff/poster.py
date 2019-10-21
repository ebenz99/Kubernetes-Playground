from minio import Minio
from minio.error import (ResponseError, BucketAlreadyOwnedByYou,BucketAlreadyExists)

minioClient = Minio('127.0.0.1:9000',access_key='AKIAIOSFODNN7EXAMPLE',secret_key='wJalrXUtnFEMIK7MDENGbPxRfiCYEXAMPLEKEY',secure=False)

# Make a bucket with the make_bucket API call.
try:
       minioClient.make_bucket("maylogs", location="us-east-1")
except BucketAlreadyOwnedByYou as err:
       pass
except BucketAlreadyExists as err:
       pass
except ResponseError as err:
       raise
else:
        # Put an object 'pumaserver_debug.log' with contents from 'pumaserver_debug.log'.
        try:
               minioClient.fput_object('maylogs', 'myfile.sh', '/Users/ebensman/code/workspaces/minik/get.sh')
        except ResponseError as err:
               print(err)