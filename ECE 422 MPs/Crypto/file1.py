#!/usr/bin/python
# -*- coding: utf-8 -*-
blob = """            Pm�B�NY^!}'�hqޭ8+�]�3"�����1�f˴�)�{%�IN�����l/%L>=��غV�鼯l�u\��Xk�������u˝��ض�4�0Ʈ2����?�xPW�Գ���^�ۖ�"""
from hashlib import sha256
print(sha256(blob).hexdigest())