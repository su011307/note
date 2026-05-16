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

== 含复数的微分方程 (Complex sinusoid 形式)
有了上面的铺垫，现在再考虑 $e^(i omega t)$ 就容易多了。其实这里的标题改为“含复数三角函数的微分方程”也是可以的。别忘了欧拉公式 $e^(i t) = cos(t) + i sin(t)$，所以考虑 $e^(i omega t)$ 和考虑两个三角函数组合并无本质区别

$
  (d y)/(d t) = a y + R e^(i omega t) \
  ==> y(t) = Y e^(i omega t), space display(Y = R/(i omega - a))
$

== Gain & Phase 形式

这个形式更加有用，因为它告诉了我们有关输出的振幅变化以及相位差的信息

#line(length: 100%)

= 问题
1. 回顾含有实数三角函数的微分方程的解是怎么推导出来的？
2. 

#line(length: 100%)

= 习题
== 29

欧姆定律：$V = I R$。我们把“电阻”的含义拉宽一点，一个广义复“电阻”（阻抗）$Z = R + i omega L$，此时电流 $I$ 满足 $I(t) = I e^(i omega t)$

$
  L (d I)/(d t) + R I(t) = (i omega L + R)I e^(i omega t) = V e^(i omega t) ==> Z I = V
$

其实就是欧姆定律的延拓啦，看不懂没关系。我们现在开始这个复阻抗

首先把 $Z$ 写成 gain & phase（或者 complex sinusoid，无所谓）的形式：

$
  Z = i omega L + R = sqrt(R^2 + (omega L)^2) e^(i theta)
$

现在我们已经把 $Z$ 转换为极坐标的形式，在复平面上坐标为 $(R, omega L)$，那么辐角就有：

$
  theta = arctan((omega L) / R)
$

$
  Z = |Z|e^(i theta) = sqrt(R^2 + (omega L)^2) e^(i arctan((omega L) / R))
$

显然它的 magnitude 为 $|Z| = sqrt(R^2 + (omega L)^2)$

现在我们根据 $Z I = V$ 把电流的表达式写出来：

$
  I = V/Z = V/sqrt(R^2 + (omega L)^2) e^(-i arctan((omega L)/R))
$

既然 $omega in RR$，那么显然 $V/sqrt(R^2 + (omega L)^2) <= V/R$，当且仅当 $omega = 0$（即直流电）的时候等号成立。不难发现，电流表达式中还有一个 phase offset $theta = arctan((omega L)/R)$

恭喜你，你成功从数学上推导出来了两个结论！

1. 电路中的电感 $L$ 会阻碍交流电
2. 对于交流电，电感还会让整个电路“慢半拍”

== 30

刚刚是 RL 电路，现在让我们看一下 RC 震荡电路。Firstly, solve formula

$
  R (d q)/(d t) + 1/C q(t) = V cos(omega t)
$

for the charge $q(t) = q_n + q_p$ in the RC loop. 注意不要跟我们前面的 $q(t)$ (source) 弄混了，这里的 $q(t)$ 是前面的 $y(t)$

先让我们求解 null solution:

$
  R (d q)/(d t) + 1/C q(t) = 0 \
  ==> (d q)/(d t) + 1/(R C) q(t) = 0 \
  ==> q_(n)(t) = q(0)e^(-1/(R C) t)
$

再求解 particular solution:

$
  "suppose" q(0) = 0, (d q)/(d t) + 1/(R C) q(t) = V/R cos(omega t) \
  ==> (d q)/(d t) + 1/(R C) q(t) = V/R Re(e^(i omega t)) \
$

解同构的复方程：

$
  (d z)/(d t) + 1/(R C) z = V/R e^(i omega t) \
  ==> z = V/(R (i omega + 1/(R C))) e^(i omega t)
$

经过艰难的计算，取回实部得到：

$
  q_(p)(t) = (V C)/(1 + (omega R C)^2) (cos(omega t) + omega R C sin(omega t))
$

那么解就是：

$
  q(t) = q_(n)(t) + q_(p)(t) \
  = q(0)e^(-1/(R C) t) + (V C)/(1 + (omega R C)^2) (cos(omega t) + omega R C sin(omega t))
$

== 31

书接上回。我们已经知道了 $q(t)$ 的表达式，让电荷量 $q(t)$ 对时间求导，我们就能知道电流的表达式了

$
  (d z)/(d t) = I(t) = (i omega V)/(R(i omega + 1/(R C))) e^(i omega t)
$

根据 $Z I = V ==> Z = V/I$：

$
  Z = V (R(i omega + 1/(R C)))/(i omega V) \
  ==> Z = (R(i omega + 1/(R C)))/(i omega) = R + 1/(i omega C)
$

$Z$ 的 magnitude $|Z| = sqrt(R^2 + (C/omega)^2)$，应该不是很难了吧

同样的，我们观察这个阻抗的式子，就可以很容易理解电容为什么“同交流阻直流了”，当 $lim_(omega -> 0^+) sqrt(R^2 + (C/omega)^2) = infinity$，而当 $lim_(omega -> infinity) sqrt(R^2 + (C/omega)^2) = R$

=== 附注

请注意区分 $I(t)$ 和 $I$，$I(t) = I e^(i omega t)$。真正的关系是 $Z I = V$，和 $I(t)$ 没关系