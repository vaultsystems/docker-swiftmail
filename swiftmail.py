#!/usr/bin/python
from flask import Flask,abort,request
from waitress import serve
from subprocess import call
import os,datetime,email

UPLOAD_FOLDER = '/tmp'
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/', methods= ['POST'])
def upload_file():
  print request.headers
  if request.method == 'POST':
    f = request.files['file']
    filename = str(datetime.datetime.now().isoformat('T')).replace(':', '-')
    path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    f.save(path)
    f = open(path, 'r')
    msg = email.message_from_string(f.read())
    container = 'mail'
    if msg['To'] is not None:
      if 'training-scan@' in msg['To']: container='mail_training'
    ret = call(["swift", "upload", container, path, "--object-name", os.path.basename(path),"--retries=10"])
    os.remove(path)
    if ret == 0:
      print "success uploading to swift"
      return 'success'
    else:
      print "error uploading to swift"
      abort(500)
  else:
    return ''

if __name__ == '__main__':
    #app.debug = True
    #app.run(host='0.0.0.0')
    serve(app, host='0.0.0.0', port=5000)
