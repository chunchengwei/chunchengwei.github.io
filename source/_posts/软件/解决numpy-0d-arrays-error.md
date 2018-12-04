---
title: 解决numpy 0d arrays error
date: 2018-12-04 02:17:43
categories: 软件
tags:
- Python
- numpy
---

使用numpy array时，可能会遇到 ***"iteration over a 0-d array"*** 的错误。

###### 例1：

```python
import numpy as np

a = 1
a = np.asarray(a)
for i in a:
  print(i)
```

```python
TypeError: iteration over a 0-d array
```

###### 例2:

```python
import numpy as np

a, b = 1, 2
a, b = np.asarray(a), np.asarray(b)
for i, j in zip(a, b):
  print(i+j)
```

```python
TypeError: zip argument #1 must support iteration
```

## 解决方法:

使用 ***numpy.atleast_1d()*** 即可：

```python
import numpy as np

a, b = 1, 2
a, b = np.atleast_1d(a), np.atleast_1d(b)
for i, j in zip(a, b):
  print(i+j)
```

参考资料：[Python, numpy; How to best deal with possible 0d arrays](https://stackoverflow.com/questions/35617073/python-numpy-how-to-best-deal-with-possible-0d-arrays).