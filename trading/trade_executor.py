class TradeExecutor:
    """실제 브로커리지와 연동될 매매 실행기"""

    def buy(self, symbol: str, amount: int):
        """매수 주문 실행 (예시)"""
        print(f"Buying {amount} of {symbol}")

    def sell(self, symbol: str, amount: int):
        """매도 주문 실행 (예시)"""
        print(f"Selling {amount} of {symbol}")
