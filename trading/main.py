import random
from typing import List

# 간단한 예제용 메인 스크립트

from .data_fetcher import RestAPIFetcher
from .preprocessor import Preprocessor
from .trade_executor import TradeExecutor

# Cython modules
# Cython extensions are organized under the cy package
from .cy.analysis_module1 import SMAAnalysis
from .cy.analysis_module2 import ROCAnalysis
from .cy.analysis_module3 import MomentumAnalysis
from .cy.aggregator import Aggregator
from .cy.decision_maker import DecisionMaker


def get_mock_prices(n=20):
    """데모를 위한 가짜 가격 데이터 생성"""
    prices = [random.uniform(100, 200) for _ in range(n)]
    return {'prices': prices}


def main(url: str):
    """전체 흐름을 실행한다"""
    fetcher = RestAPIFetcher(url)
    preprocessor = Preprocessor()
    executor = TradeExecutor()

    # 실제 사용 시 네트워크에서 데이터를 가져옴
    try:
        raw = fetcher.fetch()
        data = preprocessor.process(raw)
    except Exception:
        # 실패 시 임시 데이터 사용
        data = get_mock_prices()

    # 분석 모듈 목록 (필요 시 확장 가능)
    modules: List = [
        SMAAnalysis(5),
        ROCAnalysis(5),
        MomentumAnalysis(10),
    ]

    aggregator = Aggregator(modules)
    decision_maker = DecisionMaker()

    results = aggregator.run(data)
    decision = decision_maker.decide(results)

    if decision == 'BUY':
        executor.buy('TEST', 1)
    elif decision == 'SELL':
        executor.sell('TEST', 1)
    else:
        print('Holding position')


if __name__ == '__main__':
    # Replace the URL with real endpoint
    main('https://example.com/api/price')
