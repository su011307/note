= 2.11

= 2.27

$A_v = integral_(-oo)^(+oo) v(t) dif t$，若 $y(t) = x(t) convolve h(t)$，证明有 $A_y = A_x A_h$

== Solution

根据 Qwen 的补充，*卷积本身就将讨论局限于 LTI 系统了*，所以下面很多鲁莽的操作在当前语境下是合理的

问题等价于证明

$
  integral_(-oo)^(+oo) y(t) dif t = integral_(-oo)^(+oo) integral_(-oo)^(+oo) x(tau) h(t-tau) dif tau dif t = integral_(-oo)^(+oo) x(t) dif t integral_(-oo)^(+oo) h(t) dif t
$

我们假定积分性质良好（不用假定，确实良好），直接交换次序

$
  integral_(-oo)^(+oo) integral_(-oo)^(+oo) x(tau) h(t-tau) dif t dif tau = integral_(-oo)^(+oo) x(tau) integral_(-oo)^(+oo) h(t-tau) dif t dif tau
$

既然是时不变的，这意味着：

$
  integral_(-oo)^(+oo) h(t-k) dif t = integral_(-oo)^(+oo) h(t) dif t
$

代回原式，变为：

$
  integral_(-oo)^(+oo) x(tau) integral_(-oo)^(+oo) h(t) dif t dif tau
$

则需要证明的性质显而易见了，即 $A_y = A_x A_h$

= 2.28
== Solution

$h[n] = (1/5)^n u[n]$：因果且稳定

$h[n] = (0.8)^n u[n+2]$：稳定但非因果

$h[n] = (1/2)^n u[-n]$：稳定但非因果，当 $n=-1$ 时需要知道未来的 orcale

$h[n] = 5^n u[3-n]$：非因果且不稳定，因为 $lim_(n->+oo) 5^n = +oo$，且当 $n in {0, 1}$ 的时候需要未来 oracle

$h[n] = (-1/2)^n u[n] + 1.01^n u[n-1]$：不稳定但因果

$h[n] = (-1/2)^n u[n] + 1.01^n u[1-n]$：稳定且非因果，因为当 $n=0$ 时需要知道未来的 oracle

$h[n] = n(1/3)^n u[n-1]$：稳定但非因果，因为 $lim_(n->+oo) n (1/3)^n = 0$，而且 $n=-1$ 时依赖于 $n=0$ 的 oracle

= 2.29
== Solution

$h(t) = e^(-4t)u(t-2)$

$h(t) = e^(-6t)u(3-t)$

$h(t) = e^(-2t)u(t+50)$

$h(t) = e^(2t)u(-1-t)$

$h(t) = e^(-6abs(t))$

$h(t) = t e^(-t)u(t)$

= 2.33
== Solution

什么叫解微分方程？和我的 Mathematica 说去吧。具体解决代码参阅 `ch2.nb`

=== (a)(i)-(iii)

$ y_1(t) = e^(2t)(-1+e^t)u(t) $

$ y_2(t) = e^(2t)t u(t) $

$ y_3(t) = e^(2t)(alpha(-1+e^t)+beta t)u(t) $

=== (a)(iv)

我错了，我承认刚刚说话有点大声了，Mathematica 也不是万能的。不对 Mathematica 能算啊，我错哪了？

$
  y_3(t) = e^(2t) integral_1^t e^(-2tau)(alpha x_1(tau) + beta x_2(tau) dif tau
$

=== (b)(i)-(ii)

$ y(t) = e^(2t)K t u(t) $

$ y(t) = e^(2t-T)K (t-T) u(t-T) $

= 2.34

我们要证明，如果初始附加条件是非零的，或者总是在某一固定时刻给出，那么这个系统就不可能是 LTI 的。沿袭 2.33 的方程：

(a) 给定附加条件 $y(1) = 1$，用一个反例证明：系统不是线性的

(b) 给定附加条件 $y(1) = 1$，用一个反例证明：系统不是时不变的

(c) 给定附加条件 $y(1) = 1$，证明：系统是增量线性的

(d) 给定附加条件 $y(1) = 0$，证明：系统是线性的，但不是时不变的

(e) 给定附加条件 $y(0) + y(4) = 0$，证明：系统是线性的，但不是时不变的

== Solution
=== (a)

$y(1)=1$ 约束下微分方程的解为

$
  y(t) = e^(2(t-1))(1+e^2 integral_1^t e^(-2tau)x(tau) dif tau)
$

前有 $e^(2(t-1))$，这本身就是非线性项，毋须多言

=== (b)

回顾时不变的定义，$y(t) = x(t) convolve h(t) ==> y(t-t_0) = x(t-t_0) convolve h(t)$。$e^t$ 肯定是满足时不变的定义的，这意味着我们需要从别的地方着手。用 $t = s + k$ 替换掉 $t$，看看原式：

$
  y(s + k) = y(t_0)e^(2(s+k-t_0)) + integral_(t_0)^(s+k) x(tau) e^(2(s+k-tau)) dif tau
$

注意到 offset 发生在 $y(t_0)$ 项和积分项，前者是常数，那么唯一的想法是改变积分项。$integral_(t_0)^(s+k) x(tau) e^(2(s+k-tau)) dif tau$，让 $x(tau)$ 为非常数即可。令输入 $x(tau) = tau$，系统即不满足时不变

=== (c)

先搞明白什么是增量线性，意思是满足 $Delta y(<=> y_1 - y_2) = T Delta x(<=> x_1 - x_2)$。$y(1)=1$ 时：

$
  y(t) = e^(2(t-1))(1+e^2 integral_1^t e^(-2tau)x(tau) dif tau)
$

$
  cases(
    y_1 = e^(2(t-1))(1+e^2 integral_1^t e^(-2tau)x_1(tau) dif tau),
    y_2 = e^(2(t-1))(1+e^2 integral_1^t e^(-2tau)x_2(tau) dif tau)
  ) \
  y_1 - y_2 = e^(2t) integral_1^t e^(-2tau)(x_1(tau)-x_2(tau)) dif tau
$

符合定义

=== (d)

$y(1) = 0$下

$
  y(t) = e^(2t) integral_1^t e^(-2tau)x(tau) dif tau
$

根据线性性的定义

$
  y_1(t) = x_1(t) convolve h(t), y_2(t) = x_2(t) convolve h(t) ==> (alpha x_1(t) + beta x_2(t)) convolve h(t) = alpha y_1(t) + beta y_2(t)
$

将 $x(tau) = alpha x_1(tau) + beta x_2(tau)$ 带入原式，线性的结果显然。至于时不变性，若将 $x(t)$ 改为 $x(t-t_0)$ 重新求解微分方程，得到

$
  y(t) = e^(2t) integral_1^t e^(-2tau) x(tau-t_0) dif tau
$

显然不同于 $y(t-t_0)$，即该系统不满足时不变性

=== (e)

这下真得靠 Mathematica 救命了

$
  y(t) = -1/(1+e^8)e^(2t)(-e^8integral_1^t e^(-2tau) x(tau) dif tau - integral_1^t e^(-2tau) x(tau) dif tau + integral_1^0 e^(-2tau) x(tau) dif tau + e^8 integral_1^4 e^(-2tau) x(tau) dif tau)
$

同样的，线性的结果显然，但是并不满足时不变

= 2.35
== Solution

参阅 `ch2.nb`，没什么好说的

= 2.55
== Solution
=== (a)

