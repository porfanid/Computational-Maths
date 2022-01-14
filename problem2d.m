function problem2d()
  
  
  #Data#
  AM = 4835;
  Kps=5;
  Kds=15+(AM/1000);  
  t = 0:0.1:30;
  Sdes=AM/200;
  
  s(1)=0;
  s1(1)=0;
  s2(1)=0;
  Bs = 3 + (AM/5000);
  m=9;
  delta =((Kds+Bs)/m)^2-4*(Kps/m);
  r1 = ((-Kps/m)+sqrt(delta))/2;
  r2 = ((-Kps/m)-sqrt(delta))/2;
  
  
  # Begin  #
  s = Sdes + (-Sdes/(((r1/r2)+1)))*exp(t*(r1/2)) + (-Sdes/((r1/r2)+1))*exp(t*(r2/2));  
  s1 = Sdes + (r1/2)*(-Sdes/(((r1/r2)+1)))*exp(t*(r1/2)) + (r2/2)*(-Sdes/((r1/r2)+1))*exp(t*(r2/2));
  
  
  # Subplot #
  
  figure(1)
  plot(s1)
  title("s' Problem 2 e")
  ylabel(" s'")
  xlabel("t(sec)")
 
  

  figure(2)
  plot(s)
  title("s Proplem 2 e")
  ylabel(" s ")
  xlabel("t(sec)")

  
  
  
  
  
  
  
  
  endfunction