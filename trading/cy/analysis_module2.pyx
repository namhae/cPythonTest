# cython: language_level=3
# 가격 변동 비율(ROC)을 계산하는 모듈
from .analysis_base cimport AnalysisModule

cdef class ROCAnalysis(AnalysisModule):
    """일정 기간 동안의 가격 변화율 계산"""

    cdef int period

    def __init__(self, int period=5):
        # 변화율을 계산할 기준 기간
        self.period = period

    cpdef dict analyze(self, object data):
        """가격 리스트로부터 ROC 값을 계산"""
        cdef list prices = data['prices']
        cdef int n = len(prices)
        if n <= self.period:
            # 과거 데이터가 충분하지 않을 경우 None 반환
            return {'roc': None}
        cdef double old_price = prices[n - self.period - 1]
        cdef double new_price = prices[-1]
        cdef double roc = ((new_price - old_price) / old_price) * 100
        return {'roc': roc}
