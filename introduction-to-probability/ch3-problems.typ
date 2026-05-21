= 3.2
$f_(X)(x) = lambda/2 e^(-lambda abs(x))$

验证是否满足归一化条件。注意到 $f_(X)(x)$ 是一个偶函数，若 $integral_0^(+infinity) f(x) dif x = I$，那么 $integral_(-infinity)^(+infinity) f(x) dif x = 2I$

$
    I = integral_0^(+infinity) lambda/2 e^(-lambda abs(x)) dif x = lambda/2 integral_0^(+infinity) e^(-lambda x) dif x = 1/2 ==> 2I = 1
$

下面计算拉普拉斯分布的均值：

$
    E(X) = integral_(-infinity)^(+infinity) x lambda/2 e^(-lambda abs(x)) dif x
$

可以观察到 $lambda/2 x e^(-lambda x)$ 是奇的。所以 $integral_(-infinity)^(+infinity) x f_(X)(x) dif x = 0$。然后求解方差：

$
    D(X) = E(X^2) - E^2(X) = E(X^2)
$

$
    E(X^2) = integral_(-infinity)^(+infinity) x^2 f_(X)(x) dif x = 2/(lambda^2)
$
