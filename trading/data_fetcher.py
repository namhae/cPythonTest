from abc import ABC, abstractmethod
import requests

class DataFetcher(ABC):
    """시장 데이터를 가져오는 추상 베이스 클래스"""

    @abstractmethod
    def fetch(self):
        """원격 소스에서 원시 데이터를 가져온다"""
        pass

class RestAPIFetcher(DataFetcher):
    """REST API에서 데이터를 가져오는 구현체"""

    def __init__(self, url: str):
        # 호출할 API 주소
        self.url = url

    def fetch(self):
        """실제 HTTP GET 요청을 보내어 데이터 획득"""
        response = requests.get(self.url)
        response.raise_for_status()
        return response.text
