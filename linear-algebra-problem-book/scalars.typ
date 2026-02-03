#let boxeddot = box(stroke: 0.5pt, inset: 2pt)[$dot$]

= 4. Complex Numbers

#quote(block: true)[
  *Problem 4.* If an operation for ordered pairs of real numbers, denoted by the temporary symbol $boxeddot$ , is defined by $ (alpha, beta) boxeddot (gamma, delta) = (alpha gamma - beta delta, alpha delta + beta gamma) $
]

== Solution
瞪眼法，这就是复数乘法，所以符合交换律和结合律（bushi）

这个确实没啥好办法，就是死算，想要验证交换律就把下面这个式子展开：

$ (gamma, delta) boxeddot (alpha, beta) $

想要验证结合律就分别展开左右两边的式子看看一不一样：

$ ((alpha, beta) boxeddot (gamma, delta)) boxeddot (epsilon, zeta) = (alpha, beta) boxeddot ((gamma, delta) boxeddot (epsilon, zeta)) $

#line(length: 100%)

= 5. Affine Transformation

#quote(block: true)[  
  *Problem 5.* If an operation for ordered pairs of real numbers, denoted by $boxeddot$ again, is defined by $ (alpha, beta) boxeddot (gamma, delta) = (alpha gamma, alpha delta + beta) $

  is it commutative? Is it associative?
]

== Solution

没有自己做出来，甚至看了提示也没做出来，只能说有待提高啊

首先让我们先回顾一下这题的 Hint：
#quote(block: true)[
  The affine Transformation of the line associative with the real numbers $alpha$ and $beta$ is the one that maps each real number $xi$ onto $alpha xi + beta$
]

这其实已经非常明显了，没做出来只能说映射确实没学明白。让我们看看映射 $S: RR -> RR, S(xi) = alpha xi + beta$，如果嵌套起来会怎样？让另一个 $T: RR -> RR, T(xi) = gamma xi + delta$，然后把它们组合起来（复合映射）：$ (S compose T)(xi) = S(T(xi)) = S(gamma xi + delta) = alpha(gamma xi + delta) + beta = (alpha gamma) xi + (delta + beta) $

这下看起来明显多了，对吧？我们知道（好吧，其实你并不知道，因为你已经忘掉了！），*复合映射总是是满足结合律的*，所以其结合性（associativity）就可以被证明了

#line(length: 100%)

= 6. Matrix multiplication

#quote(block: true)[
  *Problem 6.* If an operation for ordered quadruples of real numbers, denoted by $boxeddot$ , if defined by $ chevron.l alpha, beta, gamma, delta chevron.r boxeddot chevron.l alpha', beta', gamma', delta' chevron.r = chevron.l alpha alpha' + beta gamma', alpha beta' + beta delta', gamma alpha' + delta gamma', gamma beta' + delta delta' chevron.r $

  Is it commutative? Is it associative?
]

== Wrong Solution
一开始被题干下面的这段话误导了
#quote(block: true)[
  ... restrict attention to only those quadruples $chevron.l alpha, beta, gamma, delta chevron.r$ for which $gamma = 0$ and $delta = 1$.
]

上一题我们用了一个线性函数 $S(xi) = alpha xi + beta$，所以这里很自然地想要把它推广到更一般的场景，结合 $gamma = 0, delta = 1$，所以很自然地，$S(xi) = delta(alpha(xi + gamma) + beta)$……对吗？

当然不对！继续往下面多读一些，Halmos 说，复数乘法也是这个运算的特例之一。请问这样一个线性函数，怎么支撑起复数乘法的旋转呢？

== Correct Solution
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

= 7. Modular Multiplication

#quote(block: true)[
  *Problem 7.* For the numbers $0, 1, 2, 3, 4, 5$, is multiplication modulo 6 commutative? Is it associative? What if 6 is replaced by 7: do the conclusions for 6 remain true or do they change?
]

== (Partially) Wrong Solution
这题的映射看起来不再是 $RR -> RR$ 了。$f: S^2 -> S, S = {0, 1, 2, 3, 4, 5}$

尝试拆解成两步映射

$
f_1: S^2 -> W, W = "所有可能的乘积"\
f_2: W -> S
$

$f_1$ 算子是可交换的（乘法的一个子集）；$f_2$ 算子只针对一个变量，没有“可交换”的概念，显然它们组合起来可交换。至于结合律，这对复合映射永远成立，不言自明

#quote(block: true)[
  这里关于交换律的判断没有问题，但是结合律则是错的。永远可结合的是“复合映射”，而在这里，我们要证明的是“同余乘法”这个算子。*不能直接从映射的可结合推导出同余乘法的可结合*。必须要从 $a boxeddot (b boxeddot c) = (a boxeddot b) boxeddot c)$ 来证明
]

对于 $7$ 的同余，它只是改变了 $W, S$，并不会影响算子之间的交换律和结合律，所以我们的结论依旧

#line(length: 100%)

= 8. Small Operations
Is there an operation in a set of three elements that is commutative but not associative?

== Solution
提示说这题有些难想，不过如果看了 Problem 1，那么这其实是很简单的。$a boxeddot b = 2a + 2b$，其中对代数运算执行“loop-back”即可。它不满足结合律是可以简单展开验证的

#line(length: 100%)

= 9. Identity elements
- right identity (p. 191)
- left identity (p. 191)

#quote(block: true)[
  *Problem 9.* Which of the operations:

  1. _double addition_
  2. _half double addition_
  3. _exponentiation_
  4. _complex multiplication_
  5. _multiplication of affine transformations_
  6. _matrix multiplication_
  7. _modular addition and multiplication_

  have an identity element?
]

== Solution
感谢 Halmos 在下面证明了 identity element 只能有一个，这样就可以很简单地观察出来了

1. DNE
2. right: DNE, left: Yes
3. right: 1, left: DNE
4. $chevron.l 1, 0 chevron.r$
5. $chevron.l 1, 0 chevron.r$
6. $chevron.l 1, 0, 0, 1 chevron.r$
7. 1 for multiplication, 0 for addition

#line(length: 100%)

= 10. Complex inverses

#quote(block: true)[
  *Problem 10.* For complex multiplication (defined in Problem 4), which ordered pairs $chevron.l alpha, beta chevron.r$ are invertible? Is there an explicit formula for the inverses of the ones that are?
]

== Solution
For the second one, the answer is certainly yes. Let's solve it first.

让我们假设对于可逆的 ordered pairs $chevron.l alpha, beta, chevron.r$，它们的逆是 $chevron.l epsilon_1, epsilon_2 chevron.r$。根据我们之前在 Problem 4 得到的式子展开：

$
  chevron.l alpha, beta chevron.r boxeddot chevron.l epsilon_1, epsilon_2 chevron.r = chevron.l alpha epsilon_1 - beta epsilon_2, alpha epsilon_2 + beta epsilon_1 chevron.r
$

我们根据 Problem 9 的 (4) 知道，complex multiplication 的 identity element 是 $chevron.l 1, 0 chevron.r$，也就是：

$
  cases(
    alpha epsilon_1 - beta epsilon_2 = 1,
    alpha epsilon_2 + beta epsilon_1 = 0
  ) => (alpha^2 + beta^2) epsilon_1 = alpha => epsilon_1 = alpha / (alpha^2 + beta^2)
$

同理可以知道 $epsilon_2$，最终解出对于复数乘法，其逆用 ordered pairs 可以表示为：

$
  chevron.l alpha / (alpha^2 + beta^2), - beta / (alpha^2 + beta^2) chevron.r
$

观察式子，显然可以看出，只要 $alpha^2 + beta^2 != 0 (alpha, beta in RR)$，原 ordered pairs 的 inverse 就存在

#line(length: 100%)

= 11. Affine inverses

#quote(block: true)[
  *Problem 11.* For the multiplication of affine transformation (defined in Problem 5), which ordered pairs $chevron.l alpha, beta chevron.r$ are invertible? Is there an explicit formula for the inverses of the ones who are?
]

== Solution
这里有一点小问题。Affine transformation 显然是 associative but not commutative 的。所以我们需要显式对 right identity and left identity 进行区分

先按照 right identity 计算：

$ 
  chevron.l alpha, beta chevron.r boxeddot chevron.l epsilon_1, epsilon_2 chevron.r = 
  chevron.l alpha epsilon_1, alpha epsilon_2 + beta chevron.r
$

根据 Problem 9 的结论，有：

$
  cases(
    alpha epsilon_1 = 1,
    alpha epsilon_2 + beta = 0
  ) => 
  cases(
    epsilon_1 = 1/alpha,
    epsilon_2 = - beta/alpha
  )
$

带入到 left identity，发现也是一样的。所以尽管 affine transformation 不可交换，但它的 inverse 是不区分 left 和 right的

= 12. Matrix inverse

#quote(block: true)[
  *Problem 12.* Which of the $2 times 2$ matricies $ mat(alpha, beta; gamma, delta) $ (for which multiplication was defined in Problem 6) are invertible? Is there an explicit formula for the inverses of the ones that are?
]

== Solution

#line(length: 100%)

= 13. Abelian Group
阿贝尔群是一种数学结构。如果一个集合 $GG$ 和一个在 $GG$ 内定义的算子 $dot.o$，满足：

1. $a dot.o b = b dot.o a$（可交换）
2. $a dot.o (b dot.o c) = (a dot.o b) dot.o c$（可结合）
3. $exists epsilon in GG, a dot.o epsilon = a$（存在单位元）
4. $forall a in GG, exists a^(-1) in GG, a dot.o a^(-1) = epsilon$（存在逆元）
5. $forall x, y in GG, x dot.o y in GG$（封闭）

那么 $GG$ 就是阿贝尔群

#quote(block: true)[
  *Problem 13.* 
  
  (a) If a new opertator \* is defined in the set $RR_+$ of positive real numbers by $ x * y = min(x, y), $ does $RR_+$ become an abelian group?

  (b) If an opertator \* is defined in the set ${1,2,3,4,5}$ of positive integers by $ x * y = max(x, y), $ does that set become an abelian group?

  (c) If $x$ and $y$ are elements of an abelian group such that $x+y=y$, does it follow that $x=0$?
]

== Solution
(a) 满足交换律和结合律，但是它不存在单位元和逆元。试想一下，在 $RR$ 上，有什么元素可以确保 $forall x in RR, min(x, epsilon) = x$？不要忘了，$infinity\/-infinity$ 不是数字。所以 (a) 不构成阿贝尔群

(b) 尽管它存在单位元 $1$，但不存在逆元。你找不到一个元素 $epsilon in {1,2,3,4,5}$ 使 $max(2\/3\/4\/5, epsilon) = 1$

(c) 既然已经告诉我们 $x, y$ 在阿贝尔群中，那么这很好判断。这里的 $+$ 是朴素的加法，$x + y = y$，$x$ 符合阿贝尔群中对单位元的定义。朴素加法的单位元是 $0$，所以 $x = 0$

#line(length: 100%)

= 14. Groups
群和阿贝尔群唯一的区别在于，群不要求可交换

#quote(block: true)[
  *Problem 14.* Is the set of all affine transformations $xi |-> alpha xi + beta$ (with the operation of functional composition) a group? What about the set of all $2 times 2$ matrices $ mat(alpha, beta; gamma, delta) $ (with matrix multiplication)? Is the set of non-zerointegers modulo 6 a group with respect to multiplication modulo 6? What if 6 is replaced by 7: does the conclusion remain true or does it change?
]

== Solution
- 对于仿射变换，逆元不总是存在（$alpha = 0$），不构成群
- 对于矩阵，逆元不总是存在（$det(M) = 0$），不构成群
- 对于 6 的模，一切看起来都很美好。但是你好像忘了，这里定义的是正数，$2 times 3 = 0, 0 in.not M$，不满足封闭性，不是群
- 7 的模是群

#line(length: 100%)

= 15. Independent group axioms
Can there exists a non-assosiative operation with an identity element, such that every element has an inverse?

== Solution


#line(length: 100%)

= 16. Fields
域也是一种代数结构。如果一个集合 $FF$ 满足下面这些性质：

1. 定义了 $+$ 与 $times$ 两种运算符
2. 加法和乘法分别在 $FF$ 和 $FF^*$ 上构成阿贝尔群
3. 满足分配律

那么 $FF$ 就是一个域

#quote(block: true)[
  *Problem 16.* Must multiplication in a field be commutative?

  *Problem attached.* If $FF$ is an abelian group with $+$, and if $F^*$ is an abelian group with $times$, and if the distributive law $ alpha(x+y) = alpha x + alpha y $ is true for all $alpha$ and $x, y$, does it follow that multiplication in $FF$ is commutative?
]

== Solution
第一问没啥好说的，域的乘法群必须是阿贝尔群，而阿贝尔群必须可交换。第二个问题才有意思。

#line(length: 100%)

= 17. Addition and multiplication in fields

#quote(block: true)[
  *Problem 17.* Suppose that $FF$ is a field and $alpha$ and $beta$ are in $FF$. Which of the following plausible relations are necessarily true?

  (a) $0 times alpha = 0$

  (b) $(-1)alpha = -alpha$

  (c) $(-alpha)(-beta) = alpha beta$

  (d) $1 + 1 != 0$

  (e) If $alpha != 0$ and $beta != 0$, then $alpha beta != 0$
]

== Solution
首先明确一下我们手上有什么数学工具可用：

- 分配律
- 交换群（阿贝尔群）的附带性质

(a) $1alpha = (0+1)alpha = 0alpha + 1alpha$。把 $1alpha$ 挪到等式最左边，得到 $0 = 0alpha$

(b) 根据 (a)，$0alpha = 0$，即 $(-1 + 1)alpha = 0$，拆开得到 $(-1)alpha + alpha = 0$，等式左右同时减去 $alpha$，得到 $(-1)alpha = 0 - alpha = -alpha$

(c) 根据 (b)，$(-alpha)(-beta) = (-1alpha)(-1beta) = (-1)(-1)alpha beta = alpha beta$

(d) 不成立。构造 $FF_2$ 为对 2 取模构成的域，其加法满足 $1 + 1 = 0$

(e) 乘法群 $(FF-{0}, times)$ 有封闭性，$alpha in FF-{0}, beta in FF-{0}$，故 $alpha beta in FF-{0}$，即 $alpha beta != 0$

#line(length: 100%)

= 18. Distributive failure

#quote(block: true)[
  *Problem 18.* Is there a set $FF$ with three commutative operations $+, times_1, times_2$ such that $(FF, +)$ is a group, both $(FF-{0}, times_1)$ and $(FF-{0}, times_2)$ are groups, but only one of $(FF, +, times_1)$ and $(FF, +, times_2)$ is a field?
]

== Solution
这题要求 $+, times_1, times_2$ 分别单独构成群，但是组合起来时，$(FF, +, times_1), (FF, +, times_2)$ 中只有一个能构成域

一个域有三个条件：

- 加法交换群
- 乘法交换群
- 分配律

因此，我们要么让加法或者乘法群不可交换，要么让分配律不成立。题干已经说这三个算子是可交换的了，所以只能尝试一下后者。简单起见，我们选择 $FF_2$，这会好考虑很多

直觉上讲，乘法是一个 $RR times RR -> RR$ 的映射。如果我们构造的乘法把输入的两个数字的“差异”抹除掉，那么它几乎很难满足分配律。所以我们极端一点：

#align(
  center, 
  table(
    columns: 3,
    [$times_2$], [*0*], [*1*],
    [*0*],       [1],   [1],
    [*1*],       [1],   [1],
  )
)

这个乘法彻底抹煞了一切输入的差异，只输出1。毫无疑问，这个乘法构成阿贝尔群。简单检验一下 $0 times_2 (0 + 1)$，不符合分配律。我们成功构造出了反例✌️

#line(length: 100%)

= 19. Finite fields
这个构造简直惊为天人

#quote(block: true)[
  *Problem 19.* Is there a field with four elements?
]

== Solution
不用想，这个构造肯定不是我独立完成的，我可没这能力

提示告诉我们，这里要用多项式来构造。回顾一下，域有几个要求：

- 封闭的加法交换群
- 封闭的乘法交换群
- 加法和乘法间的分配律

=== 加法群
先考虑简单的加法群吧。按照惯性思维，我们把“取模”的思路搬到多项式上。怎么取模？显然是对系数取模，对吧？

$alpha x^2 + beta x^2 = (alpha + beta) mod "(Some constant)" x^2$，这应该不难理解。下面我们需要满足“四元”的约束。决定这个域中元素个数的因素有哪两个？

这其实可以类比成 k 进制的整数，一个32位二进制位的u32，它所含有的元素个数是 $2^32$ 个；一个三进制的16位整数，所含有的元素是 $3^16$ 个。显然，决定性因素在于底数（即*取模的数*）和指数（即*多项式最高次数-1*）。我们要让这个加法群恰好有4个元素，可以取 $(2, 2)$，也可以取 $(4, 1)$（此时会退化为一般的整数而非“多项式”，我们很快将会发现它不行）

=== 乘法群
如果只是简单地对系数取模，那么乘法群就有麻烦了。$2 times 2 = 0$，请问 $2$ 还有逆元吗？别想了，没有，这样的乘法甚至不构成群，因为有元素找不到逆元。$(4, 1)$ 的方案就被我们解决掉了

那么我们就只能考虑 $(2, 2)$ 的方案了。也就是系数对 $2$ 取模，多项式次数最高项为 $2 - 1 = 1$。这样的四个元素可以写出来，是 ${0, 1, x + 0, x + 1}$

沿袭取余的思路。我们现在尝试找一个多项式，然后让这个乘法群封闭且有逆元

显然这个多项式应该是二次的。在模2的情况下，二次多项式有4个：$ {x^2 + 0, x^2 + 1, x^2 + x + 0, x^2 + x + 1} $ Halmos 告诉我们，这个二次多项式必须是“质数”，换言之它不可被因式分解。直觉上讲，这没什么问题，虽然我也没有办法严谨地证明（可能是因为这里隐藏了一些更加基本的数学结构，但是我们不打算深入探索吧）

$
  x times x = x^2 \
  (x + 1) times (x + 1) = x^2 + (1 + 1)x + 1 = x^2 + 0x + 1 = x^2 + 1 \
  x times (x + 1) = x^2 + x
$

只有 $x^2 + x + 1$ 是不可分解的，我们选择它来当那个“模数”，构造出下面这样一个封闭的乘法群

#align(
  center,
  table(
    columns: 5,
    [$times$], [0], [1],     [$x$],   [$x+1$],
    [0],       [0], [0],     [0],     [0],
    [1],       [0], [1],     [$x$],   [$x+1$], 
    [$x$],     [0], [$x$],   [$x+1$], [1],
    [$x+1$],   [0], [$x+1$], [1],     [$x$]
  )
)

剩下的验证内容就不必重复了。$(2, 2)$ 确实构成一个 $\G\F(4)$