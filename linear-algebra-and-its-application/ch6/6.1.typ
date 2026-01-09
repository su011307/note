= 6.1 内积、长度和正交性
== 思考
1. “向量夹角”的概念在三维以上的空间还存在吗？从几何的角度解释一下为什么
2. 假设 $W$ 为 $RR ^ n$ 的子空间，我们知道 $W^perp$ 也是 $RR^n$ 的子空间。解释一下为什么 $dim W + dim W ^ perp = n$

== 习题
=== 6.1.21
利用内积的转置定义，验证定理1中的 (b) 和 (c)，注意第二章的一些内容

设 $bold(v), bold(u), bold(w)$ 是 $RR^n$ 中的向量， $c$ 是一个数，那么：

(b) $(bold(u) + bold(v)) dot bold(w) = bold(u) dot bold(w) + bold(v) dot bold(w)$

(c) $(c bold(u)) dot bold(v) = c(bold(u) dot bold(v)) = bold(u) dot (c bold(v))$

==== 证明
我们知道内积的定义是

#math.equation(block: true, numbering: "(1)", $bold(u) dot bold(v) = bold(u)^T bold(v)$) <form>

(b) 式可以转换为 $ (bold(u) + bold(v)) dot bold(w) = (bold(u) + bold(v))^T bold(w) = bold(u)^T bold(w) + bold(v)^T bold(w) = bold(u) dot bold(w) + bold(v) dot bold(w) $

(c) 也是同理。这两个性质不需要特殊的证明，只需要我们利用 @form 进行适当变换，便可以利用转置的性质证明 (b) 和 (c)

=== 6.1.22
若 $bold(u) = (u_1, u_2, u_3)$，解释为什么 $u dot u >= 0$。什么条件下 $u dot u = 0$？

==== 答案
这个性质也是显然的，根据内积的定义，我们可以知道

#math.equation(block: true, numbering: "(1)", $bold(u) dot bold(u) = u_1^2 + u_2^2 + u_3^2$) <form2>

我们假定研究的 $bold(u)$ 在实数域上。观察 @form2，它由若干实数平方组成。无论如何，实数的平方不可能小于零，所以 $u dot u >= 0$ 是显然成立的。当且仅当 $bold(u) = bold(0)$ 的时候等号成立

=== 6.1.31
证明：如果 $bold(x)$ 是属于空间 $W$ 和 $W ^ perp$ 的向量，那么 $bold(x) = bold(0)$

==== 证明
根据正交补的性质，我们知道 $ forall bold(x) in W ^ perp, bold(y) in W => bold(x) dot bold(y) = 0 $

现在 $bold(x)$ 同属于 $W, W^perp$，这意味着下面的等式成立 $ bold(x) dot bold(x) = 0 => bold(x) = bold(0) $