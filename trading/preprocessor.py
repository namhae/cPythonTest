import json
from xml.etree import ElementTree

class Preprocessor:
    """JSON 또는 XML 데이터를 파싱하여 파이썬 객체로 변환"""

    def process(self, text: str):
        """문자열 형태의 데이터를 파싱"""
        text = text.strip()
        # JSON 형식
        if text.startswith('{') or text.startswith('['):
            return json.loads(text)
        # XML 형식
        if text.startswith('<'):
            return ElementTree.fromstring(text)
        raise ValueError('Unsupported data format')
