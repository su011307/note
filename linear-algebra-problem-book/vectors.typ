= 20. Vector spaces
如同阿贝尔群一样，一个向量空间也是一个抽象的定义。如果一个集合 $VV$ 和域 $FF$，满足：

- $VV$ 的加法构成群
- 定义了数乘 $FF times VV -> VV$

并拥有下列性质：

- 标量分配：$alpha (bold(x) + bold(y)) = alpha bold(x) + alpha bold(y)$
- 向量分配：$(alpha + beta) bold(x) = alpha bold(x) + beta bold(x)$
- 结合律：$(alpha beta) bold(x) = alpha (beta bold(x))$
- 单位元：$1 bold(x) = bold(x)$

那么 $VV$ 就是一个在域 $FF$ 上的向量空间

#quote(block: true)[
  *Problem 20.* Do the scalar zero law, $ 0x = 0, $ and the vector zero law $ alpha bold(0) = bold(0), $ follow from the conditions in the definition of vector spaces, or could they be false?
]

== Solution
这个题目定义有点不好，我们讨论的向量空间并不在乎两个标量之间的乘法。姑且按照 $x in FF$ 来理解吧，

#line(length: 100%)

= 24. Union of subspaces
对于一个向量空间 $VV$，如果其一个子集 $MM$ 满足：

1. $forall bold(x), bold(y) in MM, bold(x) + bold(y) in MM$

2. $forall bold(x) in MM, forall c in FF, c bold(x) in MM$

3. $bold(0) in MM$

那么 $MM$ 就是一个子空间

#quote(block: true)[
  *Problem 24.*

  (a) Under what conditions is the set-theoretic intersection of two subspaces a subspace? What about the intersection of more than two subspaces (perhaps even infinitely many)—when is that a subspace?

  (b) Under what conditions is the set-theoretic union of two subspaces a subspace? What about the union of more than two subspaces?
]

== Solution
=== (a)
假设两个子空间分别为 $AA$ 和 $BB$。若 $bold(x), bold(y) in AA inter BB$，则 $bold(x) in AA, bold(x) in BB$（对于 $bold(y)$ 也是同理）

根据子空间的定义：

$
  forall bold(x), bold(y) in AA, bold(x) + bold(y) in AA \
  forall bold(x), bold(y) in BB, bold(x) + bold(y) in BB
$

可以知道 $bold(x) + bold(y) in AA inter BB$，也就是 $AA inter BB$ 保持封闭

我们还知道，$AA, BB$ 本身构成子空间，即 $bold(0) in AA, BB$，因此 $bold(0) in AA inter BB$

所以 $AA inter BB$ 也是一个子空间。如果我们把 $AA inter BB$ 视为一个新的子空间 $CC$，那么我们就可以把这个结论拓展到任意 $n$ 个子空间的交集

*结论：任意多个子空间的交集一定是一个子空间，这是无条件的*

=== (b)
对于两个子空间 $AA$ 和 $BB$，按照两个情况讨论：

1. $AA subset BB$：一定构成子空间

2. $AA subset.not BB$

第二种情况需要仔细考量，让我们假设 $bold(a) in AA \\ BB, bold(b) in BB \\ AA$，如果要 $AA union BB$ 构成子空间，则一个必要条件是 $bold(a) + bold(b) in AA union BB$（封闭）

但是这是不可能的。因为如果 $bold(a) + bold(b) in AA union BB$，那么 $bold(b) = (bold(a) + bold(b)) - bold(a)$。根据 $AA$ 是子空间的性质，它封闭。$bold(a)$ 已经在 $AA$ 中，如果 $bold(a) + bold(b) in AA union BB$（即 $bold(a) + bold(b) in AA$），那么 $bold(b)$ 也必须在 $AA$ 中，与假设不符，$BB$ 也是同理。所以 $AA union BB$ 不可能构成子空间

*结论：在两个子空间，如果一方不是另一方的子集，那么它们的并集不可能构成子空间*

推广到任意 $n$ 个子空间的并集也是同理。利用分而治之的思想，把 $n$ 个元素逐步拆分到只剩下两个元素为止。结论如下：

任意 $n$ 个子空间 $MM = {MM_1, MM_2, dots, MM_n}$，需要有一个“最大”子空间 $MM_k$，使得 $forall MM_i in MM, MM_i subset MM_k$

（经 ChatGPT 提示，这个拓展结论的条件是 $n$ 有穷。如果 $n$ 趋近于无穷，那么这些子空间可以“单调递增”，也就不存在所谓的“最大”）

#line(length: 100%)

= 25. Spans

#quote(block: true)[
  *Problem 25.* 

  (a) Can two disjoint subsets of $RR^2$, each containing two vectors, have the same span?

  (b) What is the span in $RR^3$ of $ {(1,1,1), (0,1,1), (0,0,1)}? $
]

== Solution 
${(1,0), (0,1)}$ 和 ${(2,0), (0,2)}$，$RR^3$

#line(length: 100%)

= 26. Equalities of spans

#quote(block: true)[
  *Problem 26.* If $x$ and $y$ are vectors and $MM$ is a subspace such that $x in.not MM$ but $x in or.big {MM, y}$, does it follow that $ or.big {MM, x} = or.big {MM, y}? $
]

== Solution
$bold(x) in.not MM$，但是 $bold(x) in or.big {MM, bold(y)}$，说明 $bold(x) = sum_i c_i bold(m_i) + k bold(y), bold(m_i) in MM, k != 0, exists c_i != 0$，那么 $or.big {MM, bold(x)} <=> or.big {MM, k bold(y)} <=> or.big {MM, bold(y)}$ 

#line(length: 100%)

= 28. Sums of subspaces

#quote(block: true)[
  *Problem 28.* Is it true that if $LL, MM$ and $NN$ are subspaces of a vector space, then $ LL union (MM + (LL union NN)) = (LL union MM) + (LL union NN)? $
]