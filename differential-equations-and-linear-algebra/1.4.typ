= Four Particular Solutions
在这一节，我们考察了几种常见的一阶微分方程：

- 常数 $q$
- Heaviside 阶跃函数 $H(t-T)$
- Dirac delta 广义函数 $delta(t-T)$
- 指数函数 $e^(c t)$

首先我们知道的事情是，这些方程存在形式上的通解

$
  y'(t) -a y(t) = q(t) \
  ==> y(t) = y(0) e^(a t) + e^(a t) integral_0^t e^(-a s) q(s) d s
$

我们也需要知道，对于线性方程，可以按照*通解 (null solution)* 和*特解(particular solution)*。通解解决 $y'(t) = a y(t)$（考虑 $y(0)$），特解解决 $y'(t) = q(t)$（不考虑 $y(0)$，假定其为0），最后把它们线性组合起来，就有

$
  "所有解" space y(t) = y_(N)(t) + y_(P)(t)
$

== 常数 $q$
$
  (d y)/(d t) = a y + q \
  ==> y(t) = y(0) e^(a t) + q / a (e^(a t) - 1)
$

== Heaviside 阶跃函数 $H(t-T)$
Heaviside 阶跃函数性质很差，不过好在它除了 $t=T$，其它部分性质都还算好。观察一下就可以发现，如果把 Heaviside 按照 $T$ 左右拆成两部分，就可以变成两个常数了

$
  (d y)/(d t) = a y + q H(t-T)\
  ==> y(t) = y(0) e^(a t) + q/a (e^(a(t-T)) - 1)
$

== Dirac delta 广义函数 $delta(t-T)$
这个函数性质更差，差到黎曼积分无法解决。如果要严谨地分析，我们需要勒贝格积分和测度，显然这（暂时）不在我能力范围内，只能以不严谨的角度来理解了。Dirac delta 函数 $delta(t-T)$ 有下面几个性质：

- $delta(0) = infinity$（再次强调，这不严谨！$infinity in.not CC$）

- $forall x != 0, delta(x) = 0$

- $display(integral_(0^(-))^(0^(+)) delta(x) d x= 1)$（挺掉 san 的，忍一下）

$
  (d y)/(d t) = a y + q delta(t-T) \
  ==> y(t) = y(0) e^(a t) + q e^(a(t-T))
$

== 指数函数 $e^(c t)$
和前面两位牛鬼蛇神相比，指数函数性质太好了

$
  y' = a y + e ^(c t) \
  ==> y(t) = y(0)e^(a t) + 1/(c-a) (e^(c t) - e^(a t))
$

如果 $c = a$，则有

$
  y = y(0)e^(a t) + t e^(a t)
$

#line(length: 100%)

= 问题
1. 回顾一下，$(d y)/(d t) = a y + q$ 的通解是怎么算出来的？（提示：积分因子）

2. Dirac delta 函数的本质是什么？（提示：和 Heaviside 阶跃函数有关）

3. 解释 $y(0) = y_0$ 和 $q(t)$ 的区别

#line(length: 100%)
= 习题
== 1.4.3
这是一个输入项为常数的 ODE，利用公式：
#math.equation(block: true, numbering: "(1)")[
  $(d y)/(d t) = a y + q ==> y(t) = y(0)e^(a t) + q / a (e^(a t) - 1)$
]

观察到 $e^(a t)$ 项会收敛于 0 或者发散到正无穷，按照含有和不含有 $e^(a t)$ 拆开，得到表达式：

#math.equation(block: true, numbering: "(1)")[
  $y(t) =(y(0) + q/a)e^(a t) - q / a$
]<std_eq>

不难发现，当 $a < 1$ 的时候，微分方程有*稳态 (steady state)* $-q/a$；当 $a > 1$ 的时候，方程没有稳态

1. 带入 @std_eq，得出：$ cases(y_T = 2 e^(-2t), y_S = 4) $
2. 按照 null 和 particular 拆分，得到：$ cases(y_N = 6e^(-2t), y_P = -4(e^(-2t) - 1)) $

== 1.4.11
#image("res/1.4.11.svg", format: "svg")

套公式，懒得解释。源代码参阅 #link(<source_1.4.11>, "这里")

=== (a)
$ 
  cases(
    y_S = -3,
    y_T = -2e^(-2t)
  )
$

=== (b)
$
  cases(
    y_S = 3,
    y_T = 4e^(-2t)
  )
$

观察容易知道，两个 $y_(infinity)$ 分别为 $-3$ 和 $3$

== 1.4.16
=== (a)
$y(t) = y(0)e^(5t) + 3/5 (e^(5(t-4)) - 1), space y_infinity = -5/3$

=== (b)
$y(t) = y(0)e^(-t) - 7(e^(4-t) - 1), space y_infinity = 7$

== 1.4.22
=== (a)
$y_infinity = +infinity$

=== (b)
$y_infinity = 0$

== 1.4.24
这本质是线性微分方程，所以我们可以分别把 $delta(t-1)$ 和 $H(t-3)$ 分别按照 $y'_(P)(t) = q(t)$ 来求解，然后线性加和。最后的答案是 1

但是这里有一个更有趣的思路——如果方程达到了稳态，*这意味着 $ y' = 0$*，对应到原本的式子里，就有：

$
  0 = -y_infinity + 0 + 1, space ==> y_infinity = 1
$

== 1.4.28
#image("res/1.4.28.svg", format: "svg")

套公式，没啥好说的

源代码参阅 #link(<source_1.4.28>, "这里")

解得 $y = (t+1)e^(2t)$

== 1.4.35

#line(length: 100%)

= 源代码
== 1.4.11 <source_1.4.11>
```julia
using DifferentialEquations, CairoMakie

u0 = [1.0]  # 对应 y(0)，即函数的初始值。即便只有一个值，也要以向量的形式写出来
t_span = (0.0, 5.0)

function f1!(du, u, p, t)
    du[1] = -2*u[1] + 6
end

function f2!(du, u, p, t)
    du[1] = -2*u[1] - 6
end

problem1 = ODEProblem(f1!, u0, t_span)
solution1 = solve(problem1)

problem2 = ODEProblem(f2!, u0, t_span)
solution2 = solve(problem2)

timestamps = range(t_span[1], t_span[2], length=1000)
y1 = [solution1(t)[1] for t in timestamps]
y2 = [solution2(t)[1] for t in timestamps]
    
figure = Figure(size = (400, 300))
axis = Axis(
    figure[1, 1];
    xlabel = "t",
    ylabel = "y(t)",
    title = "Two Differential Equation Solutions"
)

lines!(axis, timestamps, y1; label="y'=-2y+6")
lines!(axis, timestamps, y2; label="y'=-2y-6")
vlines!(axis, [0.0]; color = :black)  # y 轴
hlines!(axis, [0.0]; color = :black)  # x 轴

axislegend(axis, position = :rb)

save("res/1.4.11.svg", figure)
```

== 1.4.28 <source_1.4.28>
```julia
using DifferentialEquations, CairoMakie

function f!(du, u, p, t)
    du[1] = 2*u[1] + exp(2*t)
end

y0 = [1.0]
t_span = (0.0, 3.0)

prob = ODEProblem(f!, y0, t_span)
sol = solve(prob)

figure = Figure(size=(400, 300))
axis = Axis(figure[1, 1]; xlabel="t", ylabel="y(t)", title="y' - 2y = e^(2t)")

ts = range(t_span[1], t_span[2], length=2000)

y = [sol(t)[1] for t in ts]

lines!(axis, ts, y)
save("res/1.4.28.svg", figure)
```