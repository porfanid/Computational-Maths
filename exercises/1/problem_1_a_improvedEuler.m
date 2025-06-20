# Pavlos Orfanidis: 4134
# Giorgos Hatziligos: 4835
# Spyros Kontakis: 4702

function problem_1_a_improvedEuler()
  
  #----------- First -----------#

  #----------- Data 1----------#
  f1 = 4835/7000;
  f2 = 4835/7000;
  m = 9;
  d=1;
  h=0.001;
  Iz= 0.38;
  s0 = 4835/1000;
  AM = 4835;
  bs = 3 - (4835/5000);
  bu = 5 - (4835/5000);

  
  t = 0:0.001:30;
  display(length(t));
  s1=0;
  #s2= [(f1+f2) - bs*abs(s1)*s1]/9
  s = zeros(1,30000);
  s1 = zeros(1,30000);
  s2 = zeros(1,30000);
  s1(1) = 0 ;
  s(1)=AM/4835;
  
  # -------- ImprovedEuler 1 -------- #
  
  # ---------- Trasportation Move ---------- #
  # s' #
  for k = 1:30000
    s2(k) = ((f1+f2) -bs*((abs(s1(k))*s1(k))))/m;
    #s1(k+1)= s1(k)+h/2*(s2(k)+(f1+f2/m - (abs((s1(k)+h*(s2(k))))*(s1(k)+h*(s2(k))))/m)
    s1(k+1) = s1(k)+h/2*(s2(k)+(f1+f2)/m-(bs*abs(s1(k)+h*s2(k))*(s1(k)+h*s2(k)))/m);
  endfor
  
  # s #
  
  for k = 1:30000
    s(k+1) = s(k)+h/2*(s1(k)+s1(k+1));
  endfor
  
  # --------- Rational Move 1 --------- #
  w = zeros(1,30000);
  w1 = zeros(1,30000);
  w1(1)=0;
  # w' and w #
  
  for k =1:30000
    w1(k) = ((d/2*(f2-f1)-bu*abs(w(k))*w(k))/Iz);
    #w(k) = w(k)+h/2*(w1(k)+(d/2*(f2-f1)-bu*abs(w(k)+w1(k))*(w(k)+w1(k)))/Iz)
    w(k+1)= w(k)+h/2*(w1(k)+h*(w1(k)+((d/2*(f2-f1)-bu*abs(w(k)+w1(k))*(w(k)+w1(k)))/Iz)));
  endfor
  #}
  
  #---------- SUBPLOT 1----------#
  
  figure(1)
  subplot(1,2,1)
  plot(t,s1)
  title("Improved method s'")
  ylabel("s'")
  xlabel("t(sec)")
  
  subplot(1,2,2)
  plot(t,s)
  title("Improved Method Euler s")
  ylabel("s'")
  xlabel("t(sec)")
  
 
  figure(2)
  subplot(1,2,1)
  plot(w1)
  ylabel("w'")
  xlabel("t(sec)")

  subplot(1,2,2)
  
  plot(t,w)
  title("Improved Method Euler w")
  ylabel("w")
  xlabel("t(sec)")
    

  
  # ----------- Second Input Values (f1+f2) -------------#


  #----------- Data 2----------#
  f1 = 4835/7000;
  f2 = 4835/8000;
  m = 9;
  d=1;
  h=0.0001;
  Iz= 0.38;
  s0 = 4835/1000;
  AM = 4835;
  bs = 3 - (4835/5000);
  bu = 5 - (4835/5000);
  
  t = 0:0.001:30;
  
  s1=0;
  #s2= [(f1+f2) - bs*abs(s1)*s1]/9
  s = zeros(1,30000);
  display(length(s));
  s1 = zeros(1,30000);
  s2 = zeros(1,30000);
  s1(1) = 0 ;
  s(1)=AM/1000;
  
  #-------- ImprovedEuler 2 --------#
  
  # --------- Traspotational --------#
  
  
  # s' #
  
  for k = 1:30000
    s2(k) = ((f1+f2) -bs*((abs(s1(k))*s1(k))))/m;
    #s1(k+1)= s1(k)+h/2*(s2(k)+(f1+f2/m - (abs((s1(k)+h*(s2(k))))*(s1(k)+h*(s2(k))))/m)
    s1(k+1) = s1(k)+h/2*(s2(k)+(f1+f2)/m-(bs*abs(s1(k)+h*s2(k))*(s1(k)+h*s2(k)))/m);
  endfor
  
  # s #
  
  for k = 1:30000
    s(k+1) = s(k)+h/2*(s1(k)+s1(k+1));
  endfor

  
  
  # ----------- Rational Move 2 ------------- #

  # w' and w #
  
  for k = 1:30000
    w1(k) = ((d/2*(f2-f1)-bu*abs(w(k))*w(k))/Iz);
    #w(k) = w(k)+h/2*(w1(k)+(d/2*(f2-f1)-bu*abs(w(k)+w1(k))*(w(k)+w1(k)))/Iz)
    w(k+1)= w(k)+h/2*(w1(k)+h*(w1(k)+((d/2*(f2-f1)-bu*abs(w(k)+w1(k))*(w(k)+w1(k)))/Iz)));
  endfor  
  
  #---------- SUBPLOT 2----------#
  
  figure(3)
  subplot(1,2,1)
  plot(t,s1)
  title("Improved method euler s' ")
  ylabel("s'")
  xlabel("t(sec)")
  
  
  subplot(1,2,2)
  plot(t,s)
  title("Improved Method euler s ")
  ylabel("s")
  xlabel("t(sec)")
  
  
  figure(4)
  subplot(1,2,1)
  plot(w1)
  ylabel("w'")
  xlabel("t(sec)")
  
  subplot(1,2,2)
  plot(t,w)
  title("Improved method w")
  ylabel("w")
  xlabel("t(sec)")
  
endfunction

  
  