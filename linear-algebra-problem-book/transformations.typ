= 59. Transformations as vectors

#quote(block: true)[
  *Problem 59.*
  1. What can be said about the dimension of $LL(VV)$ in terms of the dimension of $VV$?
  2. If $A$ is a linear transformation on a finite-dimensional vector space, does there always exists a non-zero polynomial $p$ such that $p(A) = 0$?
  3. If $x_0$ is a vector in a vector space $VV$, and $y_0$ is a linear functional on $VV$, and if $A x$ is defined for every $x$ in $VV$ by $ A x = y_0(x)x_0 $ then $A$ is a linear transformation on $VV$; what is the smallest possible degree of a polynomial $p$ such that $p(A) = 0$?
]

== Solution
=== 1.

$LL(VV)$ 代表着 $VV$ 中所有 $VV -> VV$ 线性变换构成的集合，我们假设 $VV$ 是 $n$ 维的，那么

$
  forall bold(e) in VV, bold(e) = sum_(i=1)^(n)alpha_i bold(e_i)
$

考虑一个线性变换 $T$，那么 $T(bold(e))$ 就有：

$
  T(bold(e)) = T(sum_(i=1)^(n)alpha_i bold(e_i)) = sum_(i=1)^(n)alpha_i T(bold(e_i))
$

$T(bold(e_i)$ 本身又落在 $VV$ 中，只考虑一般情况：

$
  T(bold(e_i)) = sum_(i=1)^(n)beta_i bold(e_i)
$

所以 $ T(bold(e)) = sum_(i=1)^(n)alpha_i sum_(i=1)^(n)beta_i bold(e_i) = sum_(i=1)^(n)sum_(i=1)^(n) alpha_i beta_i bold(e_i) $

想要描述一个 $T(bold(e))$，需要两组维度为 $n$ 的标量组 $alpha, beta$，因而 *$LL(VV)$ 的维度为 $n times n = n^2$*

=== 2.

问题在问，是否存在一个多项式 $p(A) = alpha_0 + alpha_1 A + dots + alpha_n A^n = 0$，我们可以注意到这里的 $p$ 维度是 $n + 1$ 而不是恰好为 $n$

等一下，把 $n$ 替换为 $n^2$，$p(A) = alpha_0 + alpha_1 A + dots + alpha_(n^2) A^(n^2) = 0$，它有 $n^2 + 1$ 项，而 $LL(VV)$ 只有 $n^2$ 项。这意味着 $p(A)$ 的各个项间线性相关，存在一组不全为0的 $alpha$，使得 $p(A) = 0$

=== 3. 

#line(length: 100%)

= 64. Zero-one matrices

#quote(block: true)[
  *Problem 64.* What is the largest number of 1's that an invertible 01-matrix of size $n times n$ can have?
]

== Solution

$
  mat(
    1,1,1;
    0,1,1;
    0,0,1;
  )
$

= 65. Invertible matrix bases

#quote(block: true)[
  *Problem 65.* Does $LL(VV)$ have a basis consisting of invertible linear-transformations?
]

= 66. Finite-dimensional invertibility

#quote(block: true)[
  *Problem 66.* Can a linear-transformations on a finite-dimensional vector space be injective but not surjective? How about the other way around?
]

= 70. Invariance

#quote(block: true)[
  *Problem 70.* Is there a vector space $VV$ and a linear transformation $A$ on $VV$, such that $A$ has *exactly* three invariant subspaces?
]

= 71. Invariant complement

#quote(block: true)[
  *Problem 71.* If $A$ is a linear-transformation on a finite-dimensional vector space, does every invariant subspace of $A$ have an invariant complement?
]

= 72. Projection
=== 投影 Projection

投影不一定非要是你理解的那种垂直的投影

假设有两个向量空间 $MM$ 和 $NN$，以及两个分属其中的向量 $bold(x), bold(y)$，如果向量 $bold(z) = bold(x) + bold(y)$，那么 $bold(x)(in MM)$ 就是 $bold(z)$ 沿 $NN$ 在 $MM$ 上的投影，反之亦然

一个更加抽象的说法，*投影只是具有幂等性的线性变换*而已，这将在 #link(<idmp>)[*幂等性*] 处证明

=== 幂等性 Idempotence <idmp>

一个运算是幂等的，意味着 $E^2 = E$

如果某个运算是幂等的，那么它就是个投影，反之亦然。依旧以上文 $bold(z) = bold(x) + bold(y)$ 举例子。我们把投影运算写作 $E$，那么 $E(bold(z)) = bold(x)$，这是很显然的。那么 $E E(=E^2)(bold(z))$ 呢？$E E(bold(z)) = E(bold(x)) = E(bold(x) + bold(0)) = bold(x)$，所以投影 $E$ 具有幂等性

那么反过来呢？怎么证明有幂等性的线性变换就是一个投影？考虑一个线性变换 $E$ 作用于有限维向量空间 $VV$，它的像空间是 $II$、核是 $KK$，那么这个 $E$ 就是 $VV$ 中向量 $bold(v)$ 沿 $KK$ 在 $II$ 上的投影。不难证明 $II + KK = VV$ 并且 $II inter KK = OO$

#line(length: 100%)

= 73. Sums of projections

#quote(block: true)[
  *Problem 73.* When is the sum of two projections a projection?
]

== Solution

其实很简单。根据 #link(<idmp>)[*幂等性*] 这一部分，我们已经知道投影具有幂等性。如果投影 $I, E$ 满足 $I + E = (I + E)^2$，那么 $I + E$ 就是个投影

对这个式子稍加展开，我们可以化简一些：

$
  I + E = (I + E)^2\
  ==> I + E = I^2 + E^2 + I E + E I \
  ==> 0 = I E + E I
$

所以只要 $I E + E I = 0$，那么它们相加之后就是个投影。我们还可以继续操作，对式子同时左右乘 $E$：

$
  I E + E I E = 0 space E I E + E I = 0\
  ==> I E - E I = 0
$

不难证明，*充要条件是 $E I = I E = 0$*

#line(length: 100%)

= 74. Not quite idempotence

#quote(block: true)[
  *Problem 74.* If $E$ is a linear transformation such that $ E^2(1-E) = 0 $ does it follow that $E$ is idempotent? Is that conditions equivalant to $ E(1-E)^2 = 0? $
]