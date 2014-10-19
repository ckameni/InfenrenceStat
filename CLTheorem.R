
Pop=3000

n<-100
mu= 3.45
sigma= 1.63
pnorm(5,mu,sigma)

z= (5 - mu)/sigma
z
pnorm(z,lower.tail= F)*100



P(X>3.6)? CLT
X~N(mean= 3.45,SE= 1.63/sqrt(100))
SE= 1.63/sqrt(100)
Z<- (3.6-3.45)/SE
rz<-round(Z,2)
pnorm(rz,lower.tail=F)


n=100
mu<-15
sigma<-10
x1<-14
x2<-15

se<-sigma/sqrt(n)
se
z1<- (x1-mu)/se
z2<- (x2-mu)/se

pnorm(z2)-pnorm(z1)





standardError<- sqrt(variance/length(n))
standardError





mu=0.5
var= sqrt(mu*(1-mu)/100)
var
pnorm(0.45,mu,var)

pbinom(45,100,0.5)


x<-c(1.3,2.2,2.7,3.1,3.3,3.7)
quantile(x)

quantile(x,seq(0,1,by=.1))

install.packages("UsingR")
library(UsingR)


head(father.son)
x<-father.son$sheight
summary(father.son)
head(x)
str(x)
summary(x)

# 95% confidence interval in feet( divided by 12)
(mean(x)+c(-1,1)* qnorm(0.975) * sd(x)/sqrt(length(x)))/12
summary(father.son)



#95% confidence mean height in inches

x<-father.son$fheight
(mean(x)+c(-1,1)* qnorm(c(0.025,0.975) * sd(x)/sqrt(length(x))))


# Sample Proportion
round(1/sqrt(10^(1:6)),3)


#Binomial interval
(0.56 +c(-1,1)* qnorm(0.975) * sqrt(0.56*0.44/100))
 binom.test(56,100)$conf.int # alternativ

# poisson inter
poisson.test(10*60, T = 60)$conf

