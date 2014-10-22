
#H0: populatios means are equal

a<-c(7.3,6.5,5.2,6.3,7.0,5.9,5.2,5.0,4.7,5.7,5.7,3.3,5.0,4.6,4.8,3.8,4.6)
b<-c(4.2,4,2.6,4.9,4.4,4.4,5.5,5.1,5.1,3.2,3.9,3.2,4.9,4.3,4.8,2.4,5.5,5.5,3.7)

     x1<-mean(a);O1<-var(a);x1;O1
     x2<-mean(b);O2<-var(b);x2;O2

     t_samp<-(x1- x2 )/(O1 / n1 + O2 / n2)^0.5
      t_samp

      df<-n1 + n2 - 2;df
      alpha<-0.05
      
      t_pop<-qt(p=alpha/2,df=34);t_q<-abs(t_q)   # two tailed test!!! i divided alpha
      t_pop


# is t > t_q? yes! H0 is rejected!
#therefore, the null hypothesis of equal brains volumes can be rejected, p<0.05

#therefore the alternative hypothesis of unequal brain volumes can be accepted!

# Smoker and non smokers do not have equal brain sizes, t(34) =3.07,p<0.05

#cannot  conclude that smoking causes brain be smaller

#random samling, indepence of observations,




qt(P=6df=34)

quant<-0.975

sp <- sqrt(((n1-1) * s1^2 + (n2-1)  * s2^2) / (n1 + n2- 2));sp


x1- x2 + c(-1, 1) * qt(quant,(n1 + n2- 2)) * sp * (1 / n1 + 1 / n2)^0.5
