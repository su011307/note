#let fs = stack("FS", math.arrow.l.r.long)

= 傅里叶级数
不同于接下来要讲的 Fourier Transformation，Fourier Series 是针对本身已经是周期函数的函数而言的。其核心思想很简单，一切性质良好的周期函数都可以分解成若干个 sinusoids 的线性加和

== 计算傅里叶系数

$
  cases(
    x(t) = sum_(k=-oo)^(+oo)a_k e^(j k omega_0 t),
    a_k = 1/T integral_T x(t) e^(-j k omega_0 t) dif t
  )
$

其中 $a_k$ 所构成的无穷级数叫 Fourier Coefficients。抛开各种掉 san 的专业术语不谈，我们可以尝试从抽象代数的角度去直观理解（听起来有点精神分裂）它在做什么。回顾一下 inner product，在 Euclid 和 Hilbert 空间上：

$
  (x(t), y(t)) = integral_T x(t) overline(y(t)) dif t
$

放在一起，不用拉马努金再世也不难注意到，$a_k$ 在事实上就是一个 inner product。下文我们会说到，$e^(j k omega_0 t)$ 是 orthogonal basis 中的一个向量，既然 orthogonal，那么就可以理解为 projection。换言之，这里的 $a_k$ 就相当于把原本的信号看成一个向量，然后在一个由频率构成的正交基上做投影，intuition 这不就来了吗，抽代反而让它具象了:P

== 含义
Fourier Transfomation/Series 经常和“频域”、“时域”两个概念连接起来。这两个“域”，我暂时未能看出和 Galois Field 有何关联🥲，不妨暂时理解为“时间上的向量空间”和“频率上的向量空间”吧。根据 Fourier Series 的表达式，我们不难发现，等式左侧 $x(t)$ 是一个关于时间的函数，而右侧，这个时间的函数被拆分为了若干个周期函数（$e^(j k omega_0 t)$）的求和。我们不妨把这个求和看成一个函数，那么这个函数中唯一变化的是 $k omega_0$。换言之，原本时间上的函数（$t$ 为自变量）被转换为若干个频率函数（以 $omega$ 为自变量，$t$ 只作为参数，我们把整体的 $e^(j t)$ 看成一个抽象的算子整体#footnote[事实上，这里的函数算子 $e^(j k omega_0 t)$ 依旧以 $t$ 作为自变量，但是在上层的求和中，在变化的是 $k omega_0$，亦即频率。如果有点抽象，可以把 $e^(j t)$ 类比成编程语言中的 `fn`（回顾一下`fn`和`fn()`的区别！） ]）的和，它们实现了“时域”和“频域”的转换

== 好的性质

Fourier Series 性质太好了（至少比抽代中各种人为构造的猎奇数学结构好得多）。一个信号 $x(t)$ 的傅里叶系数可以这么表示：$x(t) fs a_k$

=== 线性

$
  x(t) fs a_k, y(t) fs b_k\
  ==> z(t) = A x(t) + B y(t) fs c_k = A a_k + B b_k
$

=== 时移

不妨再仔细观察一下 Fourier Coefficients 的结构

$
  a_k = 1/T integral_T x(t) e^(-j k omega_0 t) dif t
$

看到了 $e^(j omega t)$，理应条件反射地想到极坐标，对吧？那么时移，就是相当于一个相位 offset，那么不就很自然地

$
  b_k = 1/T integral_T x(t-t_0) e^(-j k omega (t-t_0)) dif t
$

别忘了 $x(t)$ 本身是周期信号，所以上面的式子可以化简为

$
  b_k = e^(-j k omega t_0) 1/T integral_T x(t) e^(-j k omega (t-t_0)) dif t\
  ==> b_k = e^(-j k omega t_0) a_k\
  <==> x(t-t_0) fs e^(-j k omega t_0) a_k
$

=== 其它性质

这些性质都很符合直觉，或者需要在 `problems.typ` 中证明，这里不再花太多笔墨

- 反方向的钟：如果将时间反转（即$t |-> -t$），那么$x(-t) fs a_(-k)$

- 时域变换：$x(alpha t) fs sum_(k=-oo)^(+oo) a_k e^(j k (alpha omega_0) t)$

- 相乘：$x(t)y(t) fs h_k = sum_(l=-oo)^(+oo) a_l b_(l-k)$

= 概念
== 频谱

“频谱”分为两个部分，“频”和“谱”。首先挑最简单的“谱”来解释。谱（spectrum）和我们熟悉的 spectrum 是一个东西，亦即 eigenvalues 所构成的集合，那么现在的关键就在于这个 eigenvalue 是什么

回顾一下之前的谐波的概念，找到一个基波 $e^(j omega_0 t)$，然后构造 $S = {e^(j k omega_0 t) | k in ZZ}$，我们稍微用一下惊人的注意力就可以发现，$S$ 构成一个 orthogonal basis

惊喜还不止于此，如果我们把一个 LTI 视为一个线性变换的话，那么 $forall e^(j k omega_0 t), k in ZZ$，它的频率都不会发生任何改变，唯一改变的是频率前面的增益 gain，这完美契合了 eigenvalue 的概念。因此，我们把 $e^(j k omega_0 t)$ 视为 “eigenvector”（其实是叫 eigenfunction，反正你都见过在李群中对微分算子 $D$ 进行泰勒展开了，这点抽象应该还是能接受的），那么一切都水到渠成了——频谱就是一组 $S = {e^(j k omega_0 t) | k in ZZ}$ 这组 *频* 率 orthogonal basis 前面的 gain 构成的 *谱 spectrum*

- 特征函数：见上

= 收敛判定

并非所有的周期函数都可以使用 Fourier Series 来分解，但是大部分（哪怕性质很差）的函数，都是可以的，只需要满足这几个条件：

1. 绝对可积：对于任意一个周期，$integral_T abs(x(t)) dif t < +oo$
2. 任意有限区间内，$x(t)$ 只有有限个起伏变化
3. 任意有限区间内，$x(t)$ 只有有限个不连续点

但是需要注意，这里的“收敛”并不意味着函数值处处相等，只是总的误差加和收敛于 0，在特定的点上，依旧可能会存在误差，但是因为一个点是零测集，对总体的误差积分没有贡献，因此我们可以说它“几乎处处相等”。用更加形式化的语言来表述，即：

$
  integral_T abs(x(t) - hat(x)(t))^2 dif t = 0
$

其中

$
  hat(x)(t) = lim_(N -> oo)sum_(k=-N)^(+N) a_k e^(j k omega_0 t)
$

= Gibbs 现象
正如上一部分所述，总会有一些地方的函数值并不处处相等，这往往出现在跳变点上。Fourier Series 在处理跳变点的时候会遇到 *过冲 overshoot* 和后文将会讲到的 *振铃 ringing*。随着 Fourier Series 的项数趋于无穷，最大 overshoot 幅度收敛于约 9%，这个 overshoot 就是所谓的 Gibbs 现象

= 帕？？定理
不想写，VS Code 的 Typst 自动补全坏了

= 滤波