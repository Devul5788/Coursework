#!/usr/bin/env python3
# -*- coding: latin-1 -*-
blob = """     ��uU�d�i� <sp�bMX��TK�y����u��zf�[�!���E:�o�\�>�
i+]I��F�N������ƄOP�c ������!y"{9��g��gpЏ��]��ӊ�
�_������T�
"""
from hashlib import sha256
shaval = sha256(blob.encode()).hexdigest()
print(shaval)
if (shaval == "ae31450618cee68d8de80fdbdc5a70d417319a3743e6622523f10c0a5a75f5b8"):
    print("I come in peace.")
else:
    print("Prepare to be destroyed!")
