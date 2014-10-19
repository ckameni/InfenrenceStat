## drawing: comparing z and t dsitribution
require(manipulate);require(ggplot2)
k <- nrow(mtcars);
xvals <- seq(-5, 5, length = k)
myplot <- function(df){
      d <- data.frame(y = c(dnorm(xvals), dt(xvals, df)),
                      x = xvals,
                      dist = factor(rep(c("Normal", "T"), c(k,k))))
      g <- ggplot(d, aes(x = x, y = y)) 
      g <- g + geom_line(size = 2, aes(colour = dist))
      g
}
manipulate(myplot(mu), mu = slider(1, 20, step = 1))  

## drawing comparing t and z quantiles
pvals <- seq(.5, .99, by = .01)
myplot2 <- function(df){
      d <- data.frame(n= qnorm(pvals),t=qt(pvals, df),
                      p = pvals)
      g <- ggplot(d, aes(x= n, y = t))
      g <- g + geom_abline(size = 2, col = "lightblue")
      g <- g + geom_line(size = 2, col = "black")
      g <- g + geom_vline(xintercept = qnorm(0.975))
      g <- g + geom_hline(yintercept = qt(0.975, df))
      g
}
manipulate(myplot2(df), df = slider(1, 20, step = 1))


# differents methods to find the 95% confindence interval of a paire data!!
str(mtcars)
str(mpg)


g1 <- mtcars$mpg[1 : 16]; g2 <- mtcars$mpg[17 : 32]
difference <- g2 - g1
mn <- mean(difference); s <- sd(difference,na.rm=T); n <- 16


mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)
t.test(difference)
t.test(g2, g1, paired = TRUE)
t.test(extra ~ I(relevel(group, 2)), paired = TRUE, data = sleep)


round(t.test(mtcars$mpg)$conf.int) ## Lösung

###########
#4/11 paired data
### important: function to find quantile of t distribution is 
'qt()'

n<-9
s<-1
x+t*s*sqrt(n)

freedom<-n-1

# as we are interested about the lower endpoint will focus on
'x-t*s*sqrt(n)=0'

t<-qt(0.975,freedom)
x=t*s/sqrt(n);x  #lösung

#########
#5/11 independent data
n1<-8; X1_<-132.86;s1<-15.34
n2<-21;X2_<-127.44;s2<-18.23
quant<-0.975
sp <- sqrt(((n1-1) * s1^2 + (n2-1)  * s2^2) / (n1 + n2- 2));sp
X1_- X2_ + c(-1, 1) * qt(quant,(n1 + n2- 2)) * sp * (1 / n1 + 1 / n2)^0.5





## another Example

library(datasets); 
data(ChickWeight); library(reshape2)

##define weight gain or loss
wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")
names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")
library(dplyr)
wideCW <- mutate(wideCW,gain = time21 - time0)


#Let's do a t interval
wideCW14 <- subset(wideCW, Diet %in% c(1, 4))
dim(wideCW14)

rbind(
t.test(gain ~ Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)$conf,
t.test(gain ~ Diet, paired = FALSE, var.equal = FALSE, data = wideCW14)$conf
)


