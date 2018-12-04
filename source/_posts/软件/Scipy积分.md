---
title: Scipy积分
date: 2018-12-04 02:13:08
categories: 软件
tags:
- SciPy
- Python
---

## 数值积分

### 一重积分（*SciPy.integrate.quad*）：

例子为求解单位半圆的面积：

```python
from scipy import integrate

def half_circle(x):
    return (1-x**2)**0.5

pi_half, err = integrate.quad(half_circle, -1, 1)
```

结果为：

```python
In [4]: pi_half*2
Out[4]: 3.1415926535897967
In [5]: err
Out[5]: 1.0002354500215915e-09
```

https://docs.scipy.org/doc/scipy/reference/tutorial/integrate.html