# cython: language_level=3
# 단순 이동 평균(SMA)을 계산하는 예제 분석 모듈
from .analysis_base cimport AnalysisModule

cdef class SMAAnalysis(AnalysisModule):
    """단순 이동 평균을 계산"""

    cdef int window

    def __init__(self, int window=5):
        # 평균을 계산할 기간(윈도우) 설정
        self.window = window

    cpdef dict analyze(self, object data):
        """가격 리스트를 받아 SMA 값을 계산"""
        cdef list prices = data['prices']
        if len(prices) < self.window:
            # 데이터가 부족하면 None 반환
            return {'sma': None}
        cdef double avg = 0
        # 최근 window 개의 가격을 더한 후 평균을 구한다
        for price in prices[-self.window:]:
            avg += price
        avg /= self.window
        return {'sma': avg}
