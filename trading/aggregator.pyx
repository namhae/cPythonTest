# cython: language_level=3
# 여러 분석 모듈에서 반환된 결과를 한 곳에 모으는 집계기
# This Cython module collects results from analysis modules for fast aggregation.
from .analysis_base cimport AnalysisModule

cdef class Aggregator:
    """여러 분석 모듈의 결과를 합산하는 클래스"""

    cdef list modules

    def __init__(self, modules):
        # 모듈 리스트를 보관한다
        self.modules = modules

    cpdef dict run(self, object data):
        """모든 분석 모듈을 실행하여 결과를 합친다"""
        cdef dict result = {}
        # 각 모듈의 analyze 메서드를 호출하고 결과를 병합한다
        for module in self.modules:
            result.update(module.analyze(data))
        return result
