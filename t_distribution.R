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
# independent data
n1<-8; x1<-132.86;s1<-15.34
n2<-21;x2<-127.44;s2<-18.23

n1 <- 9
n2 <- 9
x1 <- -3  ##treated
x2 <- 1.5  ##placebo
s1 <- 1.8  ##treated
s2 <- 2  ##placebo
O1<-s1^2
O2<-s2^2

quant<-0.975
s<-(O1/n1 + O2/n2)^0.5;s
      
sp <- sqrt(((n1-1) * s1^2 + (n2-1)  * s2^2) / (n1 + n2- 2));sp
x1- x2 + c(-1, 1) * qt(p=quant,df=(n1 + n2- 2)) * s * (1 / n1 + 1 / n2)^0.5

t.test(x1,x2, var.equal=F,df=18)
?t.test
?qt


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


# unequal variances
n1 <- 8
n2 <- 21
x1 <- 132.86  ##treated
x2 <- 127.44  ##placebo
s1 <- 15.34  ##treated
s2 <- 18.23  ##placebo
O1<-s1^2
O2<-s2^2




# calculate the t degree of freedom
t_df<-((O1/ n1 + O2/ n2)^2)/
      (((O1/ n1)^2)/(n1-1)+
             ((O2/n2)^2)/(n2-1))

t_df

# calculate the t quantile 
t_q_df<-qt(.975, df=t_df);t_q_df

sp <- sqrt(((n1-1) * s1^2 + (n2-1)  * s2^2) / (n1 + n2- 2));sp
t_q_df<-qnorm(.975,t_df)

# finaly find the confidence interval
-1*(x1 - x2) + c(-1, 1) * t_q_df * (O1/ n1 + O2/ n2)^0.5



################################ from the book #################################
qt(.975,df=25)
qt(0.1,df=20)
pt(-2.1,df=18)*100
'x-t*s*sqrt(n)=0.025'

qt(p=0.1,df=18)
pt(q=-2.10,df=18)*100
pt(q=1.65,df=20,lower.tail=F)

#E5.17
pt(q=c(-3,3),df=2)

#E.518
pt(q=-1.79,df=19,lower.tail=F)

#E5.19
x<-4.4
b<-19
s<-2.3
n<-19

t_z<-qnorm(.975,x,s);t_z # z distribution

t_t<-qt(0.975,df=18);t_t #t distribution
x+c(-1,1)*t_t*s/sqrt(n)

#E5.20
There are no obvious outliers; all observations are within 2 standard deviations of the mean. If there
is skew, it is not evident. There are no red 
ags for the normal model based on this (limited) information,
and we do not have reason to believe the mercury content is not nearly normal in this type of sh.

#E5.22
x<-.287
s<-.069
n<-15

t_t<-qt(0.95,df=18);t_t #t distribution
x+c(-1,1)*t_t*s/sqrt(n)

#E5.23  one sample t test
x<-135.9
s<-82.2
n<-30

#H0: students do not have on average a score that is bigger than 100 
T0 = 100
#HA:student scores improve by more than 100 points on average after takingthe company's course
 #HA>100
t_samp<-(x-T0)/(s/sqrt(n));t_samp
 
 pt(t_samp,df=29)


#
n<-25
x<-70
s<-10
quant<-0.975
t_t<-qt(quant/2,n-1);t_t
x+c(-1,1)*t_t*s/sqrt(n)

t_z<-qnorm(c(0.025,0.975),x,s);t_z

x+c(-1,1)*t_z * (s/sqrt(n))



