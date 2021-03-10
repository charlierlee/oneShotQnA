import os
from flask import Flask, request, jsonify, send_from_directory
from translate import Translator
from config import *

app = Flask(__name__, static_url_path='', 
            static_folder='wwwroot')
translator = Translator(MODEL_PATH)

app.config["DEBUG"] = True # turn off in prod

@app.route('/', methods=['GET'])
def default_page():
    return app.send_static_file('index.html')

@app.route('/<path:path>', methods=['GET'])
def static_content(path):
    return send_from_directory('js', path)

#get embedding and return top N matches
@app.route('/summary', methods=['GET'])
def get_summary():
    try:
        input_string = request.args.get('text')
        
    except Exception as e:
        raise e

    if(not input_string):
        return(bad_request())
    else:
        translation = translator.translate('source', 'target', input_string)
        return jsonify({"output":translation})

#only runs with docker deployments
if __name__ == '__main__':
    app.run(host="0.0.0.0")
