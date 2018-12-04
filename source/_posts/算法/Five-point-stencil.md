---
title: Five-point stencil
date: 2018-12-04 02:39:27
categories: 算法
tags:
- 差分
mathjax: true
---

Five-point stencil 在一维和二维中的形式：

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Five_point_stencil_illustration.png/440px-Five_point_stencil_illustration.png" style="zoom:50%" />



在数值分析中，给定一个一维或二维的网格，某一点的 [Five-point stencil](https://en.wikipedia.org/wiki/Five-point_stencil)（FPS）即为该点加上它邻近的四个点。FPS主要用于求解导数在格点上的有限差分近似。

## One dimension

在一维情况下，如果格点宽度为 $h$ ，对于点 $x$ 的FPS为：
$$
\{x-2h,x-h,x,x+h,x+2h\}
$$

### 一阶导数

$$
f'(x)\approx\frac{-f(x+2h)+8f(x+h)-8f(x-h)+f(x-2h)}{12h}
$$

### 推导过程

将$f(x)$在点$x\pm h,x\pm 2h$处进行Taylor展开：

$$
f(x\pm h)=f(x)\pm hf'(x)+\frac{h^2}{2!}f''(x)\pm\frac{h^3}{3!}f^{(3)}(x)+O_{1\pm}(h^4)
$$

$$
f(x\pm2h)=f(x)\pm2hf'(x)+\frac{4h^2}{2!}f''(x)\pm\frac{8h^3}{3!}f^{(3)}(x)+O_{2\pm}(h^4)
$$

分别相消有：

$$
f(x+h)-f(x-h)=2hf'(x)+\frac{h^3}{3}f^{(3)}(x)+O_1(h^4)
$$

$$
f(x+2h)-f(x-2h)=4hf'(x)+\frac{8h^3}{3}f^{(3)}(x)+O_2(h^4)
$$

消去3阶项有：

$$
8f(x+h)-8f(x-h)-f(x+2h)+f(x-2h)=12hf'(x)+O(h^4)
$$

### 误差

$$
\frac{-f(x+2h)+8f(x+h)-8f(x-h)+f(x-2h)}{12h}=f'(x)-\frac{1}{30}f^{(5)}(x)h^4+O(h^5)
$$

所以误差为$h^4$量级。

## 高阶导数

同样的方法可以推导出更高阶的导数：

$$
f''(x)\approx\frac{-f(x+2h)+16f(x+h)-30f(x)+16f(x-h)-f(x-2h)}{12h^2}
$$

$$
f^{(3)}(x)\approx\frac{f(x+2h)-2f(x+h)+2f(x-h)-f(x-2h)}{2h^3}
$$

$$
f^{(4)}(x)\approx\frac{f(x+2h)-4f(x+h)+6f(x)-4f(x-h)+f(x-2h)}{h^4}
$$

误差分别为$O(h^4),O(h2),O(h^2)$量级。

***

##### 更多内容参照维基百科：

- [Five-point stencil](https://en.wikipedia.org/wiki/Five-point_stencil)
- [Numerical differentiation](https://en.wikipedia.org/wiki/Numerical_differentiation)
- [Finite difference coefficient](https://en.wikipedia.org/wiki/Finite_difference_coefficient)
- [Finite Difference Coefficients Calculator](http://web.media.mit.edu/~crtaylor/calculator.html)