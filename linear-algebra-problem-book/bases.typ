= 33. Exchanging bases
=== Steinitz 交换定理
如果 $TT$ 是向量空间 $VV$ 的一个生成集，$EE$ 是 $VV$ 中的一个有限线性无关子集，那么 $exists FF subset.eq TT, (TT - FF) union EE$ 依旧是 $VV$ 的一个生成集

这个定理有一些有用的推论

1. 一个有限维的向量空间 $VV$ 中的一个生成集 $TT$ 和一个线性无关子集，存在这样的关系：$EE$ 中的元素数量一定不多于 $TT$ 中的元素数量

2. 一个有限维向量空间的任意两个基的元素数量相同

3. 一个 $n$ 维向量空间中，取任何一个元素多于 $n$ 的子集，这个子集一定线性相关。一个基一定线性无关

#quote(block: true)[
  *Problem 33.* Under what conditions on a total set $TT$ of a vector space $VV$ and a finite subset $EE$ of $VV$ does there exists a subset $FF$ of $TT$ such that $(TT - FF) union EE$ is total for $VV$?
]

== Solution
首先这道题用瞪眼法是可以解决的。显然如果 $FF = emptyset$，这永远成立

#line(length: 100%)

= 39. Bases in $CC^3$

#line(length: 100%)

= 42. Subspaces of full dimension

#quote(block: true)[
  *Problem 42.* Can a proper subspace of a finite-dimensional vector space have the same dimension as the whole space?
]

#line(length: 100%)

= 45. Minimal total sets

#quote(block: true)[
  *Problem 45.* Is every minimal total set independent? Is every independent total set minimal?
]

#line(length: 100%)

= 46. Existence of minial total sets
=== 偏序集 <a>
一个并非任意两个元素都能被比较的运算集合。比如集合的 $subset.eq$ 就是偏序的，因为两个集合可能互不包含；但是自然数的 $<$ 就不是偏序的（即全序），因为任意两个自然数都可以被比较

=== 极大元 <b>
集合 $SS$ 中的元素 $x$，如果满足 $exists.not y in SS, x <= y$，那么 $x$ 就是 $SS$ 中的极大元

=== Zorn 引理
对于一个非空 #link(<a>)[*偏序集*]，如果它的任何全序子集都有上界，那么这个集合存在至少一个 #link(<b>)[*极大元*]

Zorn 引理是 ZFC 公理的一种等价形式

#quote(block: true)[
  *Problem 46.* Does every total set have a minimal total subset?
]

== Partial Solution
假设一个生成集 $EE$。分类讨论，如果它本身已经是最小生成集，那么答案显然，$EE$ 自身就是它的最小生成子集；如果不是，这表明 $exists FF in EE, EE - FF$ 为生成集

因为 $FF in EE$，所以 $forall bold(v) in FF, bold(v) = sum_(i=1)^(n)c_i bold(v_i)$。我们假定 $EE = {bold(v_1), dots, bold(v_n)}$，并且 $FF = {bold(v_(j+1)), dots, bold(v_n)}$

$
  forall bold(v) in EE, bold(v) = sum_(i=1)^(j) c_i bold(v_i) (exists c_i != 0) + sum_(i=j+1)^(n)(sum_(i=1)^(j) c_i bold(v_i)) = sum_(i=1)^(j) k_i bold(v_i) (exists k_i != 0)
$

因此，$EE - FF$ 是一个更小的生成集。我们可以一直归约下去，直到 $EE$ 变成一个最小生成集。推论：*所有有限维的生成集都存在最小生成集*

不过这个证明是有缺陷的。因为如果到了无穷维，我们没有办法保证一定可以不断地“缩小”这个集合直到变成最小生成集。不过不用担心，我们可以解决它

== Solution
答案是“是”，*任何生成集（无论是否是无穷维），都存在最小生成集*，关键在于*使用 Zorn 引理*

集合的 $subset.eq$ 是*偏序*的，根据 Zorn 引理，如果这个集合的所有全序子集都有上界，那么存在极大元

让我们规定候选族集合 $SS$ 满足下面两个条件

1. $SS$ 为生成集 $TT$ 的子集

2. $SS$ 线性无关

#line(length: 100%)

= 50. Direct sum
=== 闵可夫斯基和 & 直和
不同于之前对集合定义的和 $MM + NN$ 为 $forall bold(m) in MM, forall bold(n) in NN, bold(m) + bold(n)$ 所构成的集合（即*闵可夫斯基和*），*直和*是另一种运算

$MM plus.o NN$ 表示所有有序对 $(x, y), space x in MM, space y in NN$ 所构成的集合。这个运算就是*直和*
  
直和中的加法和数乘也被定义：

$
  cases(
    (x_1, y_1) + (x_2, y_2) = (x_1 + x_2, y_1 + y_2),
    alpha times (x_1, y_1) = (alpha x_1, alpha y_1)
  )
$

#quote(block: true)[
  *Problem 50.* If $UU$ and $VV$ are finite-dimensional vector space, of dimensions $n$ and $m$ respectively, what is the dimension of $UU plus.o VV$?
]

== Solution
讨论维度可能会有点绕，不如讨论 $UU plus.o VV$ 的基的元素数量。我们知道 $UU plus.o VV$ 是形如 $(bold(x), bold(y))$ 的集合。显然我们可以把它按照来源拆成 $(bold(x), bold(0)) + (bold(0), bold(y))$ 两个部分。我们知道 $UU$ 的维度是 $n$，这意味着 $(bold(x), bold(0)) = display(sum_(i=1)^(n) (c_i bold(x_i), bold(0)))$，其中 $bold(x_i)$ 为 $UU$ 的一组基；同理 $(bold(0), bold(y)) = display(sum_(i=1)^(m) (bold(0), c_i bold(y_i)))$

这表明：

$
  (bold(x), bold(y)) = display(sum)_(i=1)^(n) (c_i bold(x_i), bold(0)) + display(sum)_(i=1)^(m) (bold(0), c_i bold(y_i))
$

显然 ${(bold(x_1), bold(0)), dots, (bold(x_n), bold(0)), (bold(0), bold(y_1)), dots, (bold(0), bold(y_m))}$ 是一个基。即 $(bold(x), bold(y))$ 由 $n + m$ 个元素组合而成，说明 $UU plus.o VV$ 的维度是 $n + m$

#line(length: 100%)

= 51. Quotient space
=== 陪集 Coset
如果 $MM$ 是向量空间 $VV$ 的一个子空间，那么 $bold(x) + MM space (bold(x) in VV)$ 显然包含了所有 $bold(x) + bold(y), forall bold(y) in MM$ 的向量。这里 $bold(x) + MM$ 就是 $MM$ 的*陪集*

陪集有很多性质

1. 如果观察仔细，你会发现 *$MM$ 是陪集加法的零元*。很简单，因为 $MM + bold(0) = MM$ 是 $MM$ 的一个陪集，并且任何一个不同于 $MM$ 的陪集（比如 $KK$），都有 $MM + KK$ = $KK$

2. *陪集加法是结合且交换的*。两个不同于 $MM$ 的陪集 $HH, KK$，假设 $HH = bold(x) + MM, bold(x) in VV \\ MM$，$KK = bold(y) + MM, bold(y) in VV \\ MM$，那么 $HH + KK = KK + HH = (bold(x) + bold(y)) + MM$

3. *陪集的逆元存在*。假设 $KK = {bold(k_1), bold(k_2), dots}$，那么 $KK$ 的逆元 $-KK = {-bold(k) : bold(k) in KK}$，并且 $KK + (-KK) = MM$

4. 实际上，陪集的加法构成 Abelian group

=== 商空间 Quotient space
如果对于一个陪集 $KK$ 定义标量乘法 $alpha KK = {alpha bold(k) : bold(k) in KK}$，并且定义 $0 KK = MM$，那么 $MM$ 的陪集所构成的集合就是一个向量空间。这个向量空间就是*商空间*，写作 $VV \/ MM$

这里我们还可以新定义一种同余，如果两个向量 $bold(a), bold(b)$ 满足 $bold(a) - bold(b) = bold(v), bold(v) in MM$，那么他们就在 $MM$ 下同余，写作 $bold(a) equiv bold(b) (mod MM)$

#quote(block: true)[
  *Problem 51.* 

  (a) Is there an example of a vector space $VV$ and a subspace $MM$ such taht neither $MM$ nor $VV \/ MM$ is finite-dimensional?

  (b) Is there an example of a vector space $VV$ and a subspace $MM, NN$ such that $VV \/ MM$ is finite-dimensional but $VV \/ NN$ is not?
]

== Solution
还好它们不是全称命题，所以我们可以尝试构造实例

=== (a)
$MM$ 要求是无穷维，那么 $VV$ 也得是无穷维，$VV \/ MM$ 还要是无穷维。什么集合有无穷多个，从中挖掉无穷多个，还剩下无穷多个？一个答案呼之欲出了：*自然数*，挖掉所有的奇数/偶数，剩下的偶数/奇数还是无穷多个。但是 $NN^*$ 本身是一维的，那么我们不妨迁移到 $PP$ 上

令 $VV = PP, MM = PP_("odd") = {alpha, alpha^3, dots}, VV \/ MM = PP_("even") = {1, alpha^2, dots}$

答案显然

=== (b)
这个构造更是毫无难度，$VV = RR^(infinity), MM = RR^(infinity), NN = OO$

#line(length: 100%)

= 52. Dimension of quotient space

#quote(block: true)[
  *Problem 52.* If $VV$ is an $n$-dimensional vector space and $MM$ is an $m$-dimensional subspace, what is the dimension of $VV \/ MM$?
]

#line(length: 100%)

= 53. Addtivity of dimension

#quote(block: true)[
  *Problem 53.* If $MM$ and $NN$ are finite-dimensional subspaces of a vector space, what relation, if any, is always true among the numbers $dim(MM), dim(NN), dim(MM + NN), dim(MM inter NN)$?
]