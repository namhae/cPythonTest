from setuptools import setup
from Cython.Build import cythonize

extensions = [
    'trading/analysis_base.pyx',
    'trading/analysis_module1.pyx',
    'trading/analysis_module2.pyx',
    'trading/analysis_module3.pyx',
    'trading/aggregator.pyx',
    'trading/decision_maker.pyx',
]

setup(
    name='trading',
    ext_modules=cythonize(extensions, language_level=3),
    zip_safe=False,
)
