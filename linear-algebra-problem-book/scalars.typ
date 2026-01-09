#let boxeddot = box(stroke: 0.5pt, inset: 2pt)[$dot$]

== 4. Complex Numbers
If an operation for ordered pairs of real numbers, denoted by the temporary symbol $boxeddot$ , is defined by $ (alpha, beta) boxeddot (gamma, delta) = (alpha gamma - beta delta, alpha delta + beta gamma) $

=== Solution
瞪眼法，这就是复数乘法，所以符合交换律和结合律（bushi）

这个确实没啥好办法，就是死算，想要验证交换律就把下面这个式子展开：

$ (gamma, delta) boxeddot (alpha, beta) $

想要验证结合律就分别展开左右两边的式子看看一不一样：

$ ((alpha, beta) boxeddot (gamma, delta)) boxeddot (epsilon, zeta) = (alpha, beta) boxeddot ((gamma, delta) boxeddot (epsilon, zeta)) $

#line(length: 100%)

== 5. Affine Transformation
If an operation for ordered pairs of real numbers, denoted by $boxeddot$ again, is defined by $ (alpha, beta) boxeddot (gamma, delta) = (alpha gamma, alpha delta + beta) $

is it commutative? Is it associative?

=== Solution

没有自己做出来，甚至看了提示也没做出来，只能说有待提高啊

首先让我们先回顾一下这题的 Hint：
#quote(block: true)[
  The affine Transformation of the line associative with the real numbers $alpha$ and $beta$ is the one that maps each real number $xi$ onto $alpha xi + beta$
]

这其实已经非常明显了，没做出来只能说映射确实没学明白。让我们看看映射 $S: RR -> RR, S(xi) = alpha xi + beta$，如果嵌套起来会怎样？让另一个 $T: RR -> RR, T(xi) = gamma xi + delta$，然后把它们组合起来（复合映射）：$ (S compose T)(xi) = S(T(xi)) = S(gamma xi + delta) = alpha(gamma xi + delta) + beta = (alpha gamma) xi + (delta + beta) $

这下看起来明显多了，对吧？我们知道（好吧，其实你并不知道，因为你已经忘掉了！），*复合映射总是是满足结合律的*，所以其结合性（associativity）就可以被证明了

#line(length: 100%)

== 6. Matrix multiplication
If an operation for ordered quadruples of real numbers, denoted by $boxeddot$ , if defined by $ chevron.l alpha, beta, gamma, delta chevron.r boxeddot chevron.l alpha', beta', gamma', delta' chevron.r = chevron.l alpha alpha' + beta gamma', alpha beta' + beta delta', gamma alpha' + delta gamma', gamma beta' + delta delta' chevron.r $

Is it commutative? Is it associative?

=== Wrong Solution
一开始被题干下面的这段话误导了
#quote(block: true)[
  ... restrict attention to only those quadruples $chevron.l alpha, beta, gamma, delta chevron.r$ for which $gamma = 0$ and $delta = 1$.
]

上一题我们用了一个线性函数 $S(xi) = alpha xi + beta$，所以这里很自然地想要把它推广到更一般的场景，结合 $gamma = 0, delta = 1$，所以很自然地，$S(xi) = delta(alpha(xi + gamma) + beta)$……对吗？

当然不对！继续往下面多读一些，Halmos 说，复数乘法也是这个运算的特例之一。请问这样一个线性函数，怎么支撑起复数乘法的旋转呢？

=== Correct Solution
题干的名字很明显了，这是以矩阵乘法为原型的。但是我们不能根据矩阵乘法反推，这样会陷入循环论证。我们需要把它视为一个映射：$ S_(alpha, beta, gamma, delta): RR^2 -> RR^2, S(x, y) = (alpha x + beta y, gamma x + delta y) $

（如果有点难想，这里放一个矩阵乘法）$ mat(alpha, beta; gamma, delta) mat(x; y) = mat(alpha x + beta y; gamma x + delta y) $

很明显了，对吧？然后就是熟悉的配方

$ 
(S compose T)(x, y) &= S(alpha' x + beta' y, gamma' x + delta' y) \
&= (alpha(alpha' x + beta' y) + beta(gamma' x + delta' y), gamma(alpha' x + beta' y) + delta(gamma' x + delta' y)) \
&= ((alpha alpha' + beta gamma')x + (alpha beta' + beta delta')y, (gamma alpha' + delta gamma')x + (gamma beta' + delta delta')y)  
$

把系数提取出来，和题干相匹配。说明它是一个 $S compose T$ 的复合映射，这样就可以证明结合性了

#line(length: 100%)

== 7. Modular multiplication
Is multiplication modulo 6 commutative? Is it associative? What if 6 is replaced by 7: do the conclusions for 6 remain true or do they change?

