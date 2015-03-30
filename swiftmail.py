#!/usr/bin/python
from flask import Flask, abort, request
from subprocess import call
import os,datetime

UPLOAD_FOLDER = '/tmp'
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/', methods= ['POST'])
def upload_file():
  if request.method == 'POST':
    f = request.files['file']
    filename = str(datetime.datetime.now().isoformat('T')).replace(':', '-')
    path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    f.save(path)
    ret = call(["swift", "upload", "mail", path, "--object-name", os.path.basename(path)])
    os.remove(path)
    if ret == 0:
      return 'success'
    else:
      abort(500)
  else:
    return ''

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0')