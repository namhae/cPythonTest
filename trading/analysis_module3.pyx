# cython: language_level=3
# 모멘텀 값을 계산하는 분석 모듈
from .analysis_base cimport AnalysisModule

cdef class MomentumAnalysis(AnalysisModule):
    """모멘텀 지표 계산"""

    cdef int period

    def __init__(self, int period=10):
        # 모멘텀을 계산하기 위한 기간
        self.period = period

    cpdef dict analyze(self, object data):
        """주어진 가격 데이터로 모멘텀을 계산"""
        cdef list prices = data['prices']
        cdef int n = len(prices)
        if n <= self.period:
            # 계산에 필요한 데이터가 부족한 경우
            return {'momentum': None}
        cdef double momentum = prices[-1] - prices[n - self.period - 1]
        return {'momentum': momentum}
