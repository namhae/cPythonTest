# Cython 확장 모듈에서 상속받을 분석 모듈 인터페이스 정의
cdef class AnalysisModule:
    # 데이터를 분석하여 dict 형태로 결과를 반환해야 한다
    cpdef dict analyze(self, object data)
