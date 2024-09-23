import subprocess
from io import StringIO
import sys
from subprocess import PIPE
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import parse_qs, urlparse
import os

address = ('', 8768)

class RetriverHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        query = parse_qs(urlparse(self.path).query)
        if query.get('open_audio_file', ['false'])[0] == 'true':
            self.open_audio_file(query.get('path')[0], query.get('file_name')[0])
            return
            
        word, dictionary = query.get('word'), query.get('dictionary')
        if not word or not dictionary:
            self.send_response(400)
            self.wfile.write(b'Params "word" and "dictionary" are needed')
            return

        proc = subprocess.run(f'./program.o "{dictionary[0]}" "{word[0]}"', shell=True, stdout=PIPE, stderr=PIPE, text=True)
        res = proc.stdout

        self.send_response(200)
        self.send_header('Content-Type', 'text/html; charset=utf-8')
        self.end_headers()
        self.wfile.write(res.encode())
        
    def open_audio_file(self, path, file_name):
        print(f'open_audio_file: {path}/{file_name}')
        os.system(f'open -a /Applications/Audacity.app {path}/{file_name}')

with HTTPServer(address, RetriverHandler) as server:
    server.serve_forever()
