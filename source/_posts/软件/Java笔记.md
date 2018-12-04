---
title: Java笔记
date: 2018-12-04 02:55:34
categories: 软件
tags:
- java
---

主要参考：

* [java教程](http://www.runoob.com/java/java-tutorial.html)

# 注意

### 数据类型和变量：

* 浮点数到整数的转换是通过舍弃小数得到，而不是四舍五入，例如：

```Java
(int)23.7 == 23;        
(int)-45.89f == -45
```

* java中默认声明的小数是double类型的，如：

```java
double d = 4.0 		# 正确
float f = 4.0 		# 报错
float f = 4.0f 		# 正确        
```

* 变量默认值
  * 局部变量没有默认值，所以局部变量被声明后，必须经过初始化，才可以使用。
  * 实例变量具有默认值。数值型变量的默认值是0，布尔型变量的默认值是false，引用类型变量的默认值是null。变量的值可以在声明时指定，也可以在构造方法中指定；

### 修饰符：

#### 访问控制修饰符：

* 修饰符

|             | 当前类 | 同一包内 | 子孙类 | 其他包 |                         其他包子孙类                         |
| ----------- | :----: | :------: | :----: | :----: | :----------------------------------------------------------: |
| `public`    |   Y    |    Y     |   Y    |   Y    |                              Y                               |
| `protected` |   Y    |    Y     |   Y    |   N    | Y/N（[说明](http://www.runoob.com/java/java-modifier-types.html#protected-desc)） |
| `default`   |   Y    |    Y     |   N    |   N    |                              N                               |
| `private`   |   Y    |    N     |   N    |   N    |                              N                               |

* 接口里的变量都隐式声明为 **public static final**，而接口里的方法默认情况下访问权限为 **public**。

* 类和接口不能声明为 **private**。

* **protected**:

  * 基类的 protected 成员是包内可见的，并且对子类可见；
  * 若子类与基类不在同一包中，那么在子类中，子类实例可以访问其从基类继承而来的protected方法，而不能访问基类实例的protected方法。
  * 父类中声明为 protected 的方法在子类中要么声明为 protected，要么声明为 public，不能声明为 private。

#### 非访问控制修饰符

* **static** 修饰符，用来修饰类方法和类变量。
* **final** 修饰符，用来修饰类、方法和变量，final 修饰的类不能够被继承，修饰的方法不能被继承类重新定义，修饰的变量为常量，是不可修改的。
* **abstract** 修饰符，用来创建抽象类和抽象方法。
  * 如果一个类包含抽象方法，那么该类一定要声明为抽象类，否则将出现编译错误。
  * 抽象方法不能被声明成 final 和 static。
  * 任何继承抽象类的子类必须实现父类的所有抽象方法，除非该子类也是抽象类。
  * 抽象方法的声明以分号结尾，例如：**public abstract sample();**。
* **synchronized**、**transient** 和 **volatile** 修饰符，主要用于线程的编程。
  * **synchronized** 关键字声明的方法同一时间只能被一个线程访问。
  * **Volatilevolatile** 修饰的成员变量在每次被线程访问时，都强制从共享内存中重新读取该成员变量的值。而且，当成员变量发生变化时，会强制线程将变化值回写到共享内存。这样在任何时刻，两个不同的线程总是看到某个成员变量的同一个值。
    * 使用建议：在两个或者更多的线程访问的成员变量上使用volatile。当要访问的变量已在synchronized代码块中，或者为常量时，不必使用。
  * Java的serialization提供了一种持久化对象实例的机制。当持久化对象时，可能有一个特殊的对象数据成员，我们不想用serialization机制来保存它。为了在一个特定对象的一个域上关闭serialization，可以在这个域前加上关键字transient。**transient**是Java语言的关键字，用来表示一个域不是该对象串行化的一部分。当一个对象被串行化的时候，transient型变量的值不包括在串行化的表示中，然而非transient型的变量是被包括进去的。 

### 运算符

* **instanceof**：该运算符用于操作对象实例，检查该对象是否是一个特定类型（类类型或接口类型）。

```java
String name = "James";
boolean result = name instanceof String; // 由于 name 是 String 类型，所以返回真
```

* 条件运算符（? : ）顺序：从右到左

```java
int a = 1 ? 2 : 3 ? 4 : 5; 
// 如果从左到右结合，即a = (1 ? 2 : 3) ? 4 : 5 = 2 ? 4 : 5 = 4; 
// 如果从右到左结合，即a = 1 ? 2 : (3 ? 4 : 5) = 1 ? 2 : 4 = 2; 
// 实际运行int a = 1 ? 2 : 3 ? 4 : 5;得到a=2;即条件运算符是从右到左结合的。
```

* Java 增强 for 循环

```java
int [] numbers = {10, 20, 30, 40, 50};
for(int x : numbers ){
	System.out.print( x );
	System.out.print(",");
}
```

* switch 语句有如下规则：
  - switch 语句中的变量类型可以是： byte、short、int 或者 char。从 Java SE 7 开始，switch 支持字符串类型了，同时 case 标签必须为字符串常量或字面量。

### Number & Math 类方法

[http://www.runoob.com/java/java-number.html](http://www.runoob.com/java/java-number.html)

| [xxxValue()](http://www.runoob.com/java/number-xxxvalue.html) | 将 Number 对象转换为xxx数据类型的值并返回。 |
| ------------------------------------------------------------ | ------------------------------------------- |
| [compareTo()](http://www.runoob.com/java/number-compareto.html) | 将number对象与参数比较。                    |
| [equals()](http://www.runoob.com/java/number-equals.html)    | 判断number对象是否与参数相等。              |
| [valueOf()](http://www.runoob.com/java/number-valueof.html)  | 返回一个 Number 对象指定的内置数据类型      |
| [toString()](http://www.runoob.com/java/number-tostring.html) | 以字符串形式返回值。                        |
| [parseInt()](http://www.runoob.com/java/number-parseInt.html) | 将字符串解析为int类型。                     |

### String 类

* String 类是不可改变的，所以你一旦创建了 String 对象，那它的值就无法改变了。如果需要对字符串做很多修改，那么应该选择使用 [StringBuffer & StringBuilder 类](http://www.runoob.com/java/java-stringbuffer.html)。
* 格式化数字可以使用 printf() 和 format() 方法。
* [String 类方法](http://www.runoob.com/java/java-string.html)


### Java StringBuffer 和 StringBuilder 类

* StringBuilder 类在 Java 5 中被提出，它和 StringBuffer 之间的最大不同在于 StringBuilder 的方法不是线程安全的（不能同步访问）。
* 由于 StringBuilder 相较于 StringBuffer 有速度优势，所以多数情况下建议使用 StringBuilder 类。然而在应用程序要求线程安全的情况下，则必须使用 StringBuffer 类。

### Java 数组

* 声明数组变量

```java
dataType[] arrayRefVar;  // 首选的方法
dataType arrayRefVar[];  // 效果相同，但不是首选方法
```


### foreach 循环

```java
// 打印所有数组元素
for (double element: myList) {
	System.out.println(element);
}
```

### Java 正则表达式

* 捕获组是通过从左至右计算其开括号来编号。例如，在表达式（（A）（B（C））），有四个这样的组：

  - ((A)(B(C)))
  - (A)
  - (B(C))
  - (C)

* [**正则表达式语法**](http://www.runoob.com/java/java-regular-expressions.html)

  >  在其他语言中，\\ 表示：**我想要在正则表达式中插入一个普通的（字面上的）反斜杠，请不要给它任何特殊的意义。**
  >
  >  在 Java 中，\\ 表示：**我要插入一个正则表达式的反斜线，所以其后的字符具有特殊的意义**
  >
  >  所以，在其他的语言中（如Perl），一个反斜杠 \ 就足以具有转义的作用，而在 Java 中正则表达式中则需要有两个反斜杠才能被解析为其他语言中的转义作用。也可以简单的理解在 Java 的正则表达式中，两个 \\ 代表其他语言中的一个 \，这也就是为什么表示一位数字的正则表达式是 \\d，而表示一个普通的反斜杠是 \\\\