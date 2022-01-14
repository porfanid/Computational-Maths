function problem2d()
  
  
  #Data#
  AM = 4835;
  Kps=5;
  Kds=15+(AM/1000);  
  t = 0:0.1:30;
  Sdes = AM/200;
  
  s(1)=0;
  s1(1)=0;
  Bs = 3 + (AM/5000);
  m=9;
  delta =((Kds+Bs)/m)^2-4*(Kps/m);
  r1 = ((-Kds+Bs/m)+sqrt(delta))/2;
  r2 = ((-Kps+Bs/m)-sqrt(delta))/2;
  
  c1 = Sdes*r1/(r2-r1);
  c2 = -Sdes*(r1/(r2+r1)+1); 
  
  # Begin  #
  
  
  s = Sdes + c1*exp(t*(r1))+c2*exp(t*(r2)) ;  
  s1 = r1*c1*exp(t*(r1))+r2*c2*exp(t*(r2));
  
  
  # Subplot #
  
  figure(1)
  plot(t,s1)
  title("s' Problem 2 e")
  ylabel(" s'")
  xlabel("t(sec)")
 
  

  figure(2)
  plot(t,s)
  title("s Proplem 2 e")
  ylabel(" s ")
  xlabel("t(sec)")

  
  
  
  
  
  
  
  
  endfunction