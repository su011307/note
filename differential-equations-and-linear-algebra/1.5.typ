= Real and Complex Sinusoids
== 含实数三角函数的微分方程
$
  (d y)/(d t) = a y + A cos(omega t) + B sin(omega t) \
  ==> y(t) = M cos(omega t) + N sin(omega t), space
  cases(
    display(M = -(a A + omega B)/(omega^2 + a^2)), 
    display(N = (omega A - a B)/(omega^2 + a^2))
  )
$

== 复数
相比于高中，你需要额外掌握复数的极坐标表示。如果一个复数 $c = a + b i$，那么极坐标表示下的 $c$ 为：

$
  c = R e^(i theta), space
  cases(
    display(R = sqrt(a^2 + b^2)), 
    display(theta = arctan(b/a))
  )
$

== 常见运算
极坐标表示对于一些常见的运算是有好处的。如果有两个复数 $c_1 = R_1 e^(i theta_1)$ 和 $c_2 = R_2 e^(i theta_2)$，那么：

- 乘法：$display(c_1 c_2 = R_1 R_2 e^(i (theta_1 + theta_2)))$。极坐标非常方便地把乘法变成了拉伸和旋转（即倍乘和加法）

- 倒数：$display(1/c_1 = 1/(R_1 e^(i theta_1)) = 1/R_1 e^(-i theta))$。在笛卡尔坐标系下难以理解的倒数变成了拉伸和对称（沿水平线）

- 共轭：$display(overline(c_1) = R_1 e^(-i theta_1))$。共轭更简单，甚至连模长都没变。共轭变成了简单的对称（沿水平线）

== 含复数的微分方程
有了上面的铺垫，现在再考虑 $e^(i omega t)$ 就容易多了。其实这里的标题改为“含复数三角函数的微分方程”也是可以的。别忘了欧拉公式 $e^(i t) = cos(t) + i sin(t)$，所以考虑 $e^(i omega t)$ 和考虑两个三角函数组合并无本质区别

$
  (d y)/(d t) = a y + R e^(i omega t) \
  ==> y(t) = Y e^(i omega t), space display(Y = R/(i omega - a))
$

#line(length: 100%)

= 问题
1. 回顾含有实数三角函数的微分方程的解是怎么推导出来的？
