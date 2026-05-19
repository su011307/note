#let se = math.op("SE")

= Hypothesis test
正文中对于假设检验省略了一些内容。我们在这里列出进行 Student's t 检验的详细步骤。首先我们要建立一个 null hypothesis $H_0$，不妨设为：

#quote(block: true)[
  $H_0$：在线性模型 $hat(Y_i) = hat(alpha) + hat(beta) X_i$ 中，$beta = 0$

  $H_1$：$beta != 0$
]

根据 t 统计量的计算公式：

$
  hat(t) = (hat(beta) - beta_(H_0))/se(hat(beta)) = (-3.70-0)/0.77 approx -4.81
$

同理，应用于 $alpha$ 也可以计算出：

$
  hat(t) = (hat(alpha) - alpha_(H_0))/se(hat(alpha)) approx 0.48
$

我们将会在接下来中学习 _one-tailed test_ 和 _two_tailed test_，这里先暂时不用在乎它们的区别