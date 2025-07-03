# cython: language_level=3
# 집계된 분석 결과를 기반으로 매매 여부를 판단하는 모듈

cdef class DecisionMaker:
    """분석 결과 합산 점수로 매수/매도/보유를 결정"""

    cdef double buy_threshold
    cdef double sell_threshold

    def __init__(self, double buy_threshold=0.5, double sell_threshold=-0.5):
        # 매수/매도 판정을 위한 임계값
        self.buy_threshold = buy_threshold
        self.sell_threshold = sell_threshold

    cpdef str decide(self, dict aggregated):
        """집계된 값을 이용해 매매 결정을 내린다"""
        cdef double score = 0
        # None 이 아닌 모든 값들을 합산하여 점수를 계산
        for value in aggregated.values():
            if value is not None:
                score += value
        if score > self.buy_threshold:
            return 'BUY'
        if score < self.sell_threshold:
            return 'SELL'
        return 'HOLD'
