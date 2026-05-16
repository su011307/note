#let cov = math.op("Cov")
#let var = math.op("Var")
#let rss = math.op("RSS")
#let se = math.op("SE")

= Addtional Concepts
== Data Generating Process(DGP)
如果我们有一个黑盒，能不断往外吐数据，那么黑盒内部发生的那个计算“我该往外吐什么数据”的过程就是 DGP。通常而言 DGP 都是我们尝试用理论去建模和反推的

== Sample Regression Function(SRF)

== Covariance
$
  cov(X, Y) = sum_i (X_i - macron(X))(Y_i - macron(Y))
$

== 标准误 Standard Error(SE)
如果说标准差衡量一组已知数据的离散程度，那么标准误衡量的是一个估计值的离散程度。我们可以把它套用在下文 OLS 估计的 slope parameter 上，衡量 $hat(beta_i)$ 的离散程度。标准误越小，说明 $hat(beta_i)$ 越稳定，我们对它的估计也就越有信心

= 回归
设想我们想要观察大学生游戏时长 $X$ 和平均 GPA $Y$ 之间的联系，我们可能会用下面这个公式建模

$
  Y_i = alpha_i + beta_i X_i + epsilon_i
$

- $Y_i$: dependent variable
- $X_i$: explanatory variable
- $beta_i$: slope parameter
- $epsilon_i$: residual

我们知道了 $X_i$，怎么根据上面的公式来预测 $hat(Y_i)$ 呢？我们需要找到“最好”的 $hat(alpha_i)$ 和 $hat(beta_i)$ 的值，确保 $hat(Y_i)$ 和 $Y_i$ 之间的 residual 平方和（RSS）最小：

$
  rss = sum_i (Y_i - hat(Y_i))^2
$

经过某些并不需要我们知道的复杂推导，我们可以得到 $hat(alpha_i)$ 和 $hat(beta_i)$ 的值：

$
  cases(
    hat(beta_i) = cov(X, Y) / var(X),
    hat(alpha_i) = macron(Y) - hat(beta_i) macron(X),
    sigma^2 = rss/(n-k-1),
    se(hat(beta_i)) = sqrt((sigma^2)/var(hat(X))),
    se(hat(alpha_i)) = sqrt(sigma^2 * (sum_i macron(X)^2)/(n sum_i (X_i - macron(X))^2))
  )
$

其中 $sigma^2$ 是 residual variance，$k$ 是 explanatory variable 的数量

这里稍微多嘴一句，如果你对数学敏感，应该很快会意识到 RSS *对一个离群的异常值是非常敏感的*，因为它是平方项，所以有一个叫稳健 OLS 的东西来解决这个问题，不过这不是我们目前需要讨论的

= 相关性
== Covariance
想要衡量两个变量有多“相关”，一个好的思路是协方差：

$
  cov(X, Y) = sum_i (X_i - macron(X))(Y_i - macron(Y))
$

根据这个式子，很容易就可以看出，如果 $X_i$ 和 $Y_i$ 同时偏离均值的幅度越大，$cov(X, Y)$ 越大。但是这样做也有缺点，我们很难在不同的变量中进行比较，一个自然的思路是将它们归一化。$cov(X, Y)$ 只衡量两个变量间的绝对关系，那么除以它们自身的方差（$cov(X, Y)/(var(X)var(Y))$）就可以做到归一化。但是这样做，上面是二次项，下面是两个二次项，不太“平衡”，我们取几何平均（$sqrt(var(X)var(Y))$），就得到了我们熟悉的相关系数：

$
  r = cov(X, Y) / sqrt(var(X)var(Y)) = (sum_i (X_i - macron(X))(Y_i - macron(Y))) / sqrt(var(X)var(Y))
$

相关系数衡量了两个变量之间的线性关系，它并不区分因果和主次，只是告诉我们它们“有多相关”

= 决定系数
我们肯定并不满足于知道 $X$ 和 $Y$ 之间的相关性，我们还想知道这个拟合的质量如何，换言之它有多能解释 $Y$ 的变异性。我们用决定系数 $R^2$ 来衡量。既然要衡量 explanatory variable $X$ 对 dependent variable $Y$ 的“贡献程度”，我们或许可以考虑一下 $var(X)/var(Y)$？但是这么做并不合适，$X$ 和 $Y$ 难以直接比较，但是在模型中 $hat(Y)$ 和 $Y$ 是可以比较的，不妨用 $hat(Y)$ 来代理 $X$，我们就得到了 $R^2$：

$
  R^2 = var(hat(Y)) / var(Y)
$

在一元情况下，$R^2$ 和 $r^2$ 是相等的

= Guass-Markov Theorem
OLS 在 Guass-Markov 假设下是 Best Linear Unbiased Estimator，这是一切的前提。虽然不是 BLUE 在大样本下也无妨，因为只要 asymptotically unbiased 和 consistent，CLT（中心极限定理）会拯救我们。但是在小样本下，BLUE 是非常重要的

Guass-Markov 假设包括：

- 残差均值为0：$E(epsilon_i) = 0$
- 残差间自相关性：$cov(epsilon_i, epsilon_j) = 0 (i != j)$
- 残差与解释变量无关：$cov(X_i, epsilon_i) = 0$
- Homoscedasticity：即 $var(epsilon_i) = C$，不发生改变

当然，OLS 也额外要求 slope parameter 是线性的

我们将会在后面学习 diagnostic test 来检验这些假设是否成立，如果不成立，我们就需要用一些 robust 的方法来修正我们的估计