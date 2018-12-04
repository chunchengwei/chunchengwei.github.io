---
title: SQL语法手册
date: 2018-12-04 02:52:30
categories: 软件
tags:
- SQL
---

主要参考：

* [http://www.runoob.com/w3cnote/sql-syntax-manual.html](http://www.runoob.com/w3cnote/sql-syntax-manual.html)
* [http://www.w3school.com.cn/sql/sql_intro.asp](http://www.w3school.com.cn/sql/sql_intro.asp)
* [https://blog.csdn.net/whyshr/article/details/50978953](https://blog.csdn.net/whyshr/article/details/50978953)

## 主要结构：

```sql
SELECT select_list 
[ INTO new_table ] 
FROM table_source 
[ WHERE search_condition ] 
[ GROUP BY group_by_expression ] 
[ HAVING search_condition ] 
[ ORDER BY order_expression [ ASC | DESC ] ] 
LIMIT number
```

## 查询：

#### SELECT

**用途：**

从指定表中取出指定的列的数据。

**语法：**

```sql
SELECT column_name(s) FROM table_name
SELECT * FROM table_name
```

#### Top

**用途：**

选取前n行。

**语法：**

```sql
-- 选取前50%行
SELECT TOP 50 PERCENT * FROM table_name
-- 选取前5行
SELECT TOP 5 * FROM table_name
```



#### Distinct

**用途：**

DISTINCT 关键字被用作返回唯一的值（去重）。

**语法：**

```Sql
SELECT DISTINCT column-name(s) FROM table-name
```

#### Where

可以在WHERE中使用的运算符

```sql
=, <>, >, <, >=, <=
-- 在某些 SQL 的版本中不等号 < > 能被写作为 !=

BETWEEN value1 AND value2
AND, OR, NOT

LIKE '%g'  --以g结尾，‘%’为通配符
```

##### 通配符

| 通配符                       | 描述                     |
| ---------------------------- | ------------------------ |
| %                            | 一个或多个字符           |
| -                            | 一个字符                 |
| [charlist]                   | 字符列表中的任何一个字符 |
| [^charlist] 或者 [!charlist] | 任何一个非列表中字符     |

#### Alias

**用途：**

可用在表、结果集或者列上，为它们取一个逻辑名称。

**语法：**

```sql
-- 给列取别名
SELECT column AS column_alias FROM table
-- 给表取别名
SELECT column FROM table AS table_alias
```

## 排序：

#### Order by

**例子：**

```sql
SELECT Company, OrderNumber FROM Orders
ORDER BY Company DESC
```

## 分组：

#### Group by

**用途：**

对结果集进行分组，常与汇总函数一起使用。

**语法：**

```sql
SELECT column,SUM(column) FROM table GROUP BY column
```

#### Having

**用途：**

指定群组或汇总的搜寻条件。

**语法：**

```sql
SELECT column,SUM(column) FROM table
GROUP BY column
HAVING SUM(column) condition value
```

> HAVING 通常与 GROUP BY 子句同时使用。不使用 GROUP BY 时，HAVING 则与 WHERE 子句功能相似.

## 拼接：

#### Join

**用途：**

多个表按行拼接。

**语法：**

```sql
SELECT field1, field2, field3
FROM first_table
[ INNER | LEFT | RIGHT ] JOIN second_table
ON first_table.keyfield = second_table.foreign_keyfield
```

> * INNER JOIN: 返回的结果集是两个表中所有相匹配的数据。
>
> - LEFT JOIN: 即使右表中没有匹配，也从左表返回所有的行
> - RIGHT JOIN: 即使左表中没有匹配，也从右表返回所有的行
> - FULL JOIN: 关键字会从左表和右表那里返回所有的行。

#### UNION 和 UNION ALL

**用途：** 

用于合并两个或多个 SELECT 语句的结果集.

**语法：**

```sql
SELECT column_name(s) FROM table_name1
UNION
SELECT column_name(s) FROM table_name2
```

---

## 修改

| Insert Into                                     | 插入             |
| :---------------------------------------------- | ---------------- |
| Update                                          | 更新表中原有数据 |
| Delete                                          | 删除表中数据     |
| Create TABLE                                    | 创建表           |
| ALTER TABLE table_name ADD column_name datatype | 添加列           |
| ALTER TABLE table_name DROP COLUMN column_name  | 删除列           |
| Drop TABLE                                      | 删除biao         |

## 函数

| count                                                   | 统计行的数量       |
| ------------------------------------------------------- | ------------------ |
| sum                                                     | 求和，已忽略NULL值 |
| avg                                                     | 平均值             |
| max, min, abs, ceil, floor, sign                        | 数学函数           |
| sin, sinh, cos, cosh, tan, tanh, exp, log, power, sort, |                    |

## 窗口函数

参考链接：

1. [https://prestodb.io/docs/current/functions/window.html](https://prestodb.io/docs/current/functions/window.html)
2. [http://yugouai.iteye.com/blog/1908121](http://yugouai.iteye.com/blog/1908121) 
3. [http://dwgeek.com/hadoop-hive-analytic-functions-examples.html/](http://dwgeek.com/hadoop-hive-analytic-functions-examples.html/)
4. [https://blog.csdn.net/elimago/article/details/2656387](https://blog.csdn.net/elimago/article/details/2656387) 
5. [http://www.aboutyun.com/thread-12848-1-1.html](http://www.aboutyun.com/thread-12848-1-1.html) 



**LAST_VALUE**: 取分组内排序后，截止到当前行，最后一个值。若要让窗口是整个组，需要指定窗口子句，以下代码指定了整个分组作为分析窗口。

```sql
select
last_value(xxx) over(partition by xx order by x rows between unbounded preceding and unbounded following) as name
from T
```



## 时间函数（presto）

string to bigint timestamp:

```Sql
cast(to_unixtime(date_parse(str, '%Y-%m-%d %T')) as bigint)
```