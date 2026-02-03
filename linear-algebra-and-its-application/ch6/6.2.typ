= 6.2 正交集
== 思考
1. 我们知道 $m times n$ 的矩阵具有单位列向量的充要条件是什么？
2. 从几何直觉的角度上，解释一下为什么正交集必定线性无关

== life saver
1. 正交投影怎么计算？

== 习题
=== 6.2.25
证明定理 7（提示：对 (a)，计算 $norm(U bold(x))^2$ 或首先证明 (b)）

#quote(block: true)[
  *定理 7*

  假设 $U$ 是一个具有单位正交列的 $m times n$ 矩阵，且 $bold(x), bold(y)$ 是 $RR^n$ 中的向量，那么

  (a). $norm(U bold(x)) = norm(bold(x))$

  (b). $(U bold(x)) dot (U bold(y)) = bold(x) dot bold(y)$
]

==== 证明
既然说先证明 (b) 会好做一点，那么我们就按照提示来。观察 (b) 式子，根据内积的定义，我们可以变换成：

$ (U bold(x)) dot (U bold(y)) = (U bold(x))^T (U bold(y)) = bold(x)^T (U^T U) bold(y) $

根据定理 6，$U^T U = I$，化简为：

#math.equation(block: true, numbering: "(1)")[$(U bold(x)) dot (U bold(y)) = dots = bold(x)^T bold(y) = bold(x) dot bold(y)$]<form>

(b) 得证，再来看 (a)。观察式子，额，好像没什么思路。看一下，题目暗示 (b) 是 (a) 的先决条件，那么我们看看怎么用 (b) 解决 (a)。范数是非负的，我们可以直接平方看看：

$ norm(U bold(x)) = norm(bold(x)) => norm(U bold(x))^2 = (U bold(x)) dot (U bold(x)) = norm(bold(x))^2 = bold(x) dot bold(x) $

根据 @form，$(U bold(x)) dot (U bold(y)) = bold(x) dot bold(y)$ 是成立的。只需要令 @form 中 $bold(y) = bold(x)$，它就与上式等价，因此上式自然也是成立的。自此我们证明了全部 (a) 和 (b)

#line(length: 100%)

=== 6.2.27
若 $U$ 是具有单位正交列的方阵，说明 $U$ 为什么可逆（注意证明中的定理）

==== 解答
这个题目好奇怪。一个矩阵拥有单位正交列向量的充要条件是：

$
U^T U = I
$

我们知道矩阵可逆的定义是 $U^(-1) U = I$，显然 $U^(-1) = U^T$，结束了

=== 6.2.34