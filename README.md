InfenrenceStat
==============


#1 liens utiles

# t test
###one-sample ttest
https://www.youtube.com/watch?v=kvmSAXhX9Hs

###two sample t test 
very instructive video with a bunch of examples and commands and  intructions how to interpret the resuults
https://www.youtube.com/watch?v=RlhnNbPZC0A

###Paired t Test
https://www.youtube.com/watch?v=yD6aU0fY2lo


### Independent Samples t-test - Writing Up Results
https://www.youtube.com/watch?v=WA7Ysxd-91E
https://www.youtube.com/watch?v=B0aLjkJqpl0
https://www.youtube.com/watch?v=nZF_8QQEvj0



###Independent t-test - Explained Simply
the series eplains how to perform a dependent t-test  understand what the test is, when it works,

https://www.youtube.com/watch?v=3azuAaOJack
https://www.youtube.com/watch?v=X3xUn40ycyM
https://www.youtube.com/watch?v=nG-MOrtNgt8
https://www.youtube.com/watch?v=PfBKBuYYb3o
https://www.youtube.com/watch?v=IQgeSeRKkVY
https://www.youtube.com/watch?v=wFp61RpDnA0
https://www.youtube.com/watch?v=HqdvffPGgw0
https://www.youtube.com/watch?v=-XCSZW7Z3S0



#### Performing a binomial test in R

Posted on November 6, 2012 by Sarah Stowell No Comments Leave a comment
Binomial test

A binomial test compares the number of successes observed in a given number of trials with a hypothesised probability of success. The test has the null hypothesis that the real probability of success is equal to some value denoted p, and the alternative hypothesis that it is not equal to p. The test can also be performed with a one-sided alternative hypothesis that the real probability of success is either greater than p or that it is less than p.
You can perform a binomial test with the binom.test function.  The command takes the general form:
> binom.test(nsuccesses, ntrials, p)

where nsuccesses is the number of successes observed, ntrials is the total number of trials and p is the hypothesised probability of success.
Alternatively you can give the number of successes and the number of failures observed, as shown below.

> binom.test(c(nsuccesses, nfailures), p)

To perform a one-sided test, set the alternative argument to "less" or "greater" as required.

> binom.test(nsuccesses, ntrials, p, alternative="greater")

The output includes a 95% confidence interval for the true probability. To adjust the size of this interval, use the conf.level argument as shown.

> binom.test(nsuccesses, ntrials, p, conf.level=0.99)

Example: Binomial test for die rolls

In a game, you suspect your opponent is using a die which is biased to roll a six greater than 1/6 of the time. Suppose you want to prove this by rolling the die 300 times and using a binomial test to determine whether the probability of rolling a six is equal to 1/6. A one-tailed test with a significance level of 0.05 will be used.
You roll the die 300 times and throw a total of 60 sixes. To perform the test, use the command:

> binom.test(60, 300, 1/6, alternative="greater")

   Exact binomial test

data:  60 and 300 
number of successes = 60, number of trials = 300, p-value = 0.07299
alternative hypothesis: true probability of success is greater than 0.1666667 
95 percent confidence interval:
 0.1626847 1.0000000 
sample estimates:
probability of success 
                   0.2
From the output you can see that the p-value is 0.07299. As this is not less that the significance level of 0.05, we cannot reject the null hypothesis that the probability of rolling a six is 1/6. This means that there is no evidence to prove that the die is not fair.


####Two sample Z-test
Comparison of the means of two independent groups of samples, taken from two populations with known variance.

Is asked to compare the average heights of two groups. The first group (A) consists of individuals of Italian nationality (the variance of the Italian population is 5); the second group is taken from individuals of German nationality (the variance of German population variance is 8.5). The data are given below:

A: 175, 168, 168, 190, 156, 181, 182, 175, 174, 179
B: 185, 169, 173, 173, 188, 186, 175, 174, 179, 180


Since we have the variance of the population, we must proceed with a two sample Z-test. Even in this case is not avalilable in R a function to solve the problem, but we can easily create it ourselves.

$$Z=\frac{(\overline{x}_1-\overline{x}_2)-(\mu_1-\mu_2)}{\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}}$$


z.test2sam = function(a, b, var.a, var.b){
   n.a = length(a)
   n.b = length(b)
   zeta = (mean(a) - mean(b)) / (sqrt(var.a/n.a + var.b/n.b))
   return(zeta)
}


The function z.test2sam provides in output the value of zeta, after receiving in input two vectors (a and b), the variance of the first population (var.a) and the variance of the second population (var.b).
Using this function we obtain: 


a = c(175, 168, 168, 190, 156, 181, 182, 175, 174, 179)
b = c(185, 169, 173, 173, 188, 186, 175, 174, 179, 180)

z.test2sam(a, b, 5, 8.5)
[1] -2.926254


The value of zeta is greater than the value of the critical value zeta tabulated for alpha equal to 0.05 (z-tabulated = 1.96 for a two-tailed test): then we reject the null hypothesis in favor of the alternative hypothesis. We conclude that the two means are significantly different.
