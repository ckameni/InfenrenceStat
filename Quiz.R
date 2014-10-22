pnorm(5,3.45,1.63, lower.tail=F)
      
pnorm(3.6,3.45,0.163, lower.tail=F)


3.45+0.163
head(mtcars)
pnorm(.92)

### Homewwork 3
#3/11
names(mtcars)
Mu<-with(mtcars,mean(mpg))
sigma<-with(mtcars,sd(mpg))

S=sigma/sqrt(nrow(mtcars))

Mu
sigma
pValue=0.025

qnorm((1-pValue),Mu,S);
qnorm(pValue,Mu,S)

# alternativ
round(t.test(mtcars$mpg)$conf.int)


#4/11
n<-9
s<-1
int<-0.95
q<- int + (1-int)/2;q
freedom<- 9 -1

#x  + t* s/sqrt(n) 
#x  - t* s/sqrt(n) = 0

#x= t* s/sqrt(n)


qt(q,freedom)/3

 
#
a<-with(father.son,sd(fheight))
b<-with(father.son,mean(fheight))

qnorm((1-pValue),b,a);qnorm(pValue,b,a)
t.test(father.son$fheight)


qnorm(0.95,100,10)

qnorm(0.95,100,10/sqrt(50))

qnorm(0.95,100,sqrt(10/50))

pbinom(4,6,0.5, lower.tail=F)


y<-1:20;mean(y);var(y)
b<-0:1;mean(b);var(b);sd(b)

pnorm(0.51,.5,sqrt(1/12/100), lower.tail=F)


sqrt(1/12/1000)

.9*.2

qnorm(.93,100,10)
pnorm(-0.7)
#### Quiz
#2
mu<- 80
sigma<-10
pnorm(70,80,10)*100
#3
mu<-1100
sigma<- 75
qnorm(0.95,mu,sigma)

#4
mu= 1100
sd=75
s= sd/sqrt(100)
qnorm(0.95,mu,s)

#5 
pbinom(3,5,0.5,lower.tail=F)

#6
n=100
mu<-15
sigma<-10
x1<-14
x2<-16

se<-sigma/sqrt(n)
se
z1<- (x1-mu)/se
z2<- (x2-mu)/se

pnorm(z2)-pnorm(z1)

x<- c(TRUE,FALSE);sd(x)

#7
mu= .5
var= 1/12
n=1000

1/12

#8
sqrt(1/12/100)
 

#9
mu=5
n=3
p=15


ppois(10,lambda=5*3)
