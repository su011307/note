#let fs = stack("FS", math.arrow.l.r.long)

= 3.15
== Solution

既然滤波器的响应都是在频域上的，那么我们把 $x(t)$ 也转到频域上

$
  x(t) fs a_k, x(t) = sum_(k=-oo)^(+oo) a_k e^(j k omega_0 t), a_k = 1/T integral_T x(t) e^(-j k omega_0 t) dif t
$

我们还知道

$
  H(j omega) = cases(
    1\, abs(omega) <= 100,
    0\, abs(omega) > 100
  )\
  omega_0 = (2pi)/(pi/6) = 12
$

所以 $a_k = 0$，当 $abs(k omega_0) > 100$ 时。不难算出 $k in [-8, 8] inter ZZ$

= 3.19
== Solution



= 3.24
== Solution
=== (a)

$
  a_0 = 1/T integral_T x(t) e^(j 0 omega_0 t) dif t = 1/2
$

=== (b)

Mathematica，始動！当然，最好还是手算一下

$
  b_k = cases(
    display(0)\, k=0,
    display((i(-1)^k (-1+(-1)^k))/(k pi))\, k in ZZ^*
  )
$

=== (c)

= 3.35
== Solution

