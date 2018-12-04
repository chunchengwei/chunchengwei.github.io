---
title: DataFrame小技巧
date: 2018-12-04 02:59:34
categories: 软件
tags:
- pandas
---

## 1. 筛选数据

[DataFrame.query](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.query.html)(expr, inplace=False, **kwargs)：通过字符串表达式选取列。[参考问题](https://stackoverflow.com/questions/15315452/selecting-with-complex-criteria-from-pandas-dataframe)

```python
df.query('B > 50 and C != 900') 	# 等效于
df[(df['B'] > 50) & (df['C'] != 900)]
```

[pandas.Series.isin](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.isin.html)(values): or [pandas.DataFrame.isin](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.isin.html#pandas-dataframe-isin)(values):

```python
>>> s = pd.Series(['lama', 'cow', 'lama', 'beetle', 'lama', 'hippo'], name='animal')
>>> s.isin(['cow', 'lama'])
0     True
1     True
2     True
3    False
4     True
5    False
Name: animal, dtype: bool
```

## 2. 修改index

[DataFrame.set_index](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.set_index.html)(keys, drop=True, append=False, inplace=False, verify_integrity=False)：其中key为列名或者列名列表 。

```python
df.set_index(['year', 'month'])
```

## 3. 画图

1. 画barh时，纵坐标逆序：

   ```python
   df.plot(kind='barh').invert_yaxis()
   ```