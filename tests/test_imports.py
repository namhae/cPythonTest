import importlib


def test_cython_modules_importable():
    modules = [
        'trading.cy.analysis_base',
        'trading.cy.analysis_module1',
        'trading.cy.analysis_module2',
        'trading.cy.analysis_module3',
        'trading.cy.aggregator',
        'trading.cy.decision_maker',
    ]
    for mod in modules:
        assert importlib.import_module(mod) is not None

