证明：如果 $beta$ 不能被向量组 $alpha_1, alpha_2, dots, alpha_n$ 线性表示，那么 $beta$ 也不能被它们的任何部分线性表示

== 证
首先先从直觉上验证一下正确性。 $beta$ 不能被这些向量线性表示，意味着 $beta$ 不落在 $"span" {alpha_1, dots, alpha_n}$ 中，存在某个更高维度的分量，所以这个性质是显然的

现在尝试证明。不妨假设

#math.equation(block: true, numbering: "(1)")[
  $bold(beta) = c_1 bold(alpha_1) + dots + c_k bold(alpha_k)$，其中 $bold(alpha_1) dots bold(alpha_k) in S = {bold(alpha_1), dots bold(alpha_n)}$
]<form>

因为 $bold(alpha_1) dots bold(alpha_k) in S = {bold(alpha_1), dots bold(alpha_n)}$，我们可以让剩余向量之系数全部为 $0$

那么我们可以进行变换

$
bold(alpha_1) + dots bold(alpha_n) = bold(alpha_1) + dots + bold(alpha_k) + bold(alpha_(k+1)) + dots + bold(alpha_n) = bold(beta) + bold(0) = bold(beta)
$

这与原命题相违背，即 @form 不成立