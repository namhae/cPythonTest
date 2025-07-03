# cython: language_level=3
# 분석 모듈들이 상속받을 기본 Cython 클래스

cdef class AnalysisModule:
    """Cython 기반 분석 모듈의 추상 클래스"""

    cpdef dict analyze(self, object data):
        """데이터를 받아 분석 결과를 dict 로 반환"""
        raise NotImplementedError()
