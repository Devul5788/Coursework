from pymd5 import md5, padding
from urllib.parse import quote
import sys

with open(sys.argv[1]) as file1:
    url = file1.read().strip()
    token = url.split('&user')[0][6:]
    old_url = "user" + url.split('&user')[1]

with open(sys.argv[2]) as file2:
    message = file2.read().strip()

old_url_len = len(old_url)
total_len = 8 + old_url_len
padding_len = len(padding(total_len * 8))

c_cnt = (total_len + padding_len) * 8
  
hash_obj = md5(state=token, count=c_cnt)
hash_obj.update(message)
old_padding = quote((padding((len(old_url) + 8) * 8)))

result = f"token={hash_obj.hexdigest()}{old_url}{old_padding}{message}"

with open(sys.argv[3], 'w') as f:
    f.write(result)
    f.close()