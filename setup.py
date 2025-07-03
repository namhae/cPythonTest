from setuptools import setup
from Cython.Build import cythonize

extensions = [
    'trading/cy/analysis_base.pyx',
    'trading/cy/analysis_module1.pyx',
    'trading/cy/analysis_module2.pyx',
    'trading/cy/analysis_module3.pyx',
    'trading/cy/aggregator.pyx',
    'trading/cy/decision_maker.pyx',
]

setup(
    name='trading',
    ext_modules=cythonize(extensions, language_level=3),
    zip_safe=False,
)
