= 75. Linear functionals

#quote(block: true)[
  *Problem 75.* If $xi$ and $eta$ are linear functionals (on the same vector space) such that $eta(x) = 0$ whenever $xi(x)= 0$, must there always exists a scalar $alpha$ such that $eta(x) = alpha xi(x)$ for all $x$?
]

#line(length: 100%)

= 76. Dual space
=== 线性泛函 Linear functional

别被泛函名字吓到。线性泛函只是一个*从向量空间 $VV$ 到标量 $RR\/CC$ 的映射*

=== 对偶空间 Dual space

对于一个向量空间 $VV$，在 $VV$ 上定义的*所有线性泛函所构成的集合*就是 $VV$ 的对偶空间 $VV'$，$VV'$ 中有加法群，有标量域乘法且闭合，所以 $VV'$ 也是一个向量空间

=== Kronecker delta

Kronecker delta $delta_(i j)$ 的定义非常简单，*如果 $i = j$，$delta_(i j) = 1$，除此之外 $delta_(i j) = 0$*

嗯对，没了

#quote(block: true)[
  *Problem 76.* Is the dual of a finite-dimensional vector space finite-dimensional?
]

== Solution

这个问题并不难。想象一个 $n$ 维向量空间 $VV$，$forall bold(v) in VV, bold(v) = display(sum_(i=1)^(n) c_i bold(v_i))$，这很简单，对吧？

那么 $VV'$ 呢？$VV'$ 由所有将 $VV$ 中的向量 $ bold(v) = (alpha_1, dots, alpha_n) $ 映射到标量的线性泛函构成。很快我们就可以注意到，如果我们定义一组线性泛函 $xi$，使得 $xi_i (bold(v)_j) = delta_(i j)$，即 $xi_i (bold(v)) = c_i$，很显然这一组 $xi$ 可以将 $VV$ 中任何向量 $VV$ 映射到标量 $RR$，所以它们是 $VV'$ 的一组生成集

现在我们来证明它们是线性无关的。这很简单，考虑一个线性泛函 $eta$，如果 $xi$ 们线性相关，那么：

$
  eta(bold(x)) = beta_1 xi_1 (bold(x)) + beta_2 xi_2 (bold(x)) + dots + beta_n xi_n (bold(x)) = 0
$

对于任意 $bold(x)$，都存在一个 $beta$ 不为 0。但是这可能吗？让 $bold(x) = (c_1, 0, dots, 0)$，想让上述式子为 0，就要求 $beta_1$ 必须为 0；$bold(x) = (0, c_2, 0, dots, 0)$ 也是同理，不断推导下去，我们就可以知道，所有的 $beta_k$ 都必须为 0，否则只有 $bold(x) = (0, 0, dots, 0)$ 时才能保证 $eta(bold(x)) = 0$。这意味着小 $xi$ 们彼此线性无关，它们是 $VV'$ 的一组基

结论：*$dim(VV) = dim(VV')$*

=== Coordinate functional <cf>

像我们构造的 $xi_i (x_1, dots, x_n) = x_i$ 这个映射，我们就称之为 Coordinate functional

#line(length: 100%)

= 78. Reflexivity
=== 同构 Isomorphism

高中我们就已经接触过同构了。顾名思义，意味着两个数学实体在结构上是相似的，比如 $PP_2 = alpha_0 + alpha_1 x + alpha_2 x^2$ 与 $RR^3 = (alpha_0, alpha_1, alpha_2)$。怎么用更形式化的语言定义呢？

对于两个向量空间 $VV$ 和 $MM$，如果存在一个 $VV$ 到 $MM$ 的*一对一的双射 $T$*，那么它们就是同构的，反之亦然

同构有*传递性*，如果 $UU$ 与 $VV$ 同构，$VV$ 与 $MM$ 同构，那么 $UU$ 与 $MM$ 也同构

=== 双重对偶空间 Second dual space

对偶空间的对偶空间，仅此而已，记作 $VV''$

=== 自然映射 Natural mapping

在一个向量空间 $VV$ 上，对于每一个 $bold(x) in VV$，我们定义 $x''(= T bold(x)) in VV''$：

$
  x''(eta) = eta(bold(x))
$

其中 $eta$ 为 $VV'$ 中的线性泛函，那么 $T$ 就被称之为自然映射。或许是因为它有种环环相扣的感觉，比较容易想到，比较“自然”，因此得名吧

#quote(block: true)[
  *Problem 78.* If $VV$ is a vector space, and if for each vector $x$ in $VV$ an element $x''(=T x)$ of $VV''$ is defined by $ x''(eta) = eta(x) $ then $T$ is always a linear transformation from $VV$ to $VV''$; is it always an isomorphism?
]

== Solution



=== 自反性 Reflexivity

#line(length: 100%)

= 79. Annihilator
=== 零化子 Annihilator

零化子的定义很简单，它有点像是在对偶空间上的“核”。集合 $MM$ 的零化子记为 $MM^0$，定义如下：

$
  MM^0 = {u in VV' | forall bold(x) in MM, u(bold(x)) = 0}
$

#quote(block: true)[
  *Problem 79.* If $MM$ is an $m$-dimensional subspace of an $n$-dimensional vector space $VV$, what is the dimension of $MM^0$ in $V'$?
]

== Solution

假设 $MM$ 的基是 $(bold(e_1), dots, bold(e_m))$，$VV$ 的基是 $(bold(e_1), dots, bold(e_n))$，对于 $bold(e_(m+1)), dots, bold(e_n)$，作用于它们上的 #link(<cf>)[*Coordinate functional*] 会把它们都映射为 0。所以 $MM^0$ 的基是 $xi_(m+1), dots, xi_n$，$dim(MM^0) = n - m$

#line(length: 100%)

= 80. Double annihilator

#quote(block: true)[
  *Problem 80.* If $MM$ is a subspace of a finite-dimensional vector space $VV$, what is the relation between $MM$ and $MM^(00)$?
]

== Solution

$dim(MM^0) = n - m, dim(MM^(00)) = n - (n - m) = m = dim(MM)$

=== 性质
对于有限维空间 $VV$，同构意义上的 $MM = MM^(00)$。若扩展为无限维，$MM subset.eq MM^(00)$

#line(length: 100%)

= 81. Adjoint
=== 伴随 Adjoint

#quote(block: true)[
  *Problem 81.* If $A$ is a linear transformation on a finite-dimensional vector space $VV$ and if $A'$ is its adjoint on $V'$, what is the relation between the ranges and the kernels of $A$ and $A'$?
]

== Solution
=== *$(im(A))^0 = ker(A')$*

$
  cases(
    im(A) = {A bold(v) | bold(v) in VV},
    (im(A))^0 = {u in VV' | forall bold(v) in VV, u(A bold(v)) = 0},
    ker(A') = {u in VV' | A'u = 0} <=> {u in VV' | forall bold(v) in VV, A'u(bold(v)) = 0}
  )
$

先让我们证明 $(im(A))^0 subset.eq ker(A')$。首先根据定义，可以看出

= 82. Adjoints of projection

#quote(block: true)[
  *Problem 82.* If $MM$ and $NN$ are subspaces of a finite-dimensional vector space $VV$, what is the adjoint of the projection from $VV$ to $MM$ along $NN$?
]

= 83. Adjoint of matrices

#quote(block: true)[
  *Problem 83.* What is the relation between the matrix, with respect to some basis, of a linear transformation on a finite-dimensional vector space and the matrix, with respect to the dual basis, of its adjoint on the dual space?
]