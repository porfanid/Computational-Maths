function ImprovedEuler
  
  #----------- First -----------#

  #----------- Data 1----------#
  f1 = 4835/7000
  f2 = 4835/7000
  m = 9
  d=1
  h=0.0001
  Iz= 0.038
  s0 = 4835/1000
  AM = 4835
  bs = 3 - (4835/5000)
  bu = 5 - (4835/5000)

  
  
  t = 0:0.1:30
  display(length(t))
  s1=0
  #s2= [(f1+f2) - bs*abs(s1)*s1]/9
  s = zeros(1,length(t))
  display(length(s))
  s1 = zeros(1,length(t))
  s2 = zeros(1,length(t))
  s1(1) = 0 
  s(1)=AM/4835
  
  # -------- ImprovedEuler 1 -------- #
  
  # ---------- Trasportation Move ---------- #
  # s' #
  for k = length(t)*(t+1)
    s2(k) = (f1+f2 -bs*(abs(s1(k)*s1(k))))/m
    s1(k+1)= s1(k)+h/2*(s2(k)+(f1+f2/m - (abs((s1(k)+h*(s2(k))))*(s1(k)+h*(s2(k))))/m)
  endfor
  
  # s #
  
  for k = length(t)*(t+1)
    s(k+1) = s(k)+h/2(s1(k)+s1(k+1))
  endfor
  
  # --------- Rational Move 1 --------- #

  # w' and w #

  
  #---------- SUBPLOT 1----------#

  figure(1)
  subplot(1,2,1)
  title("Improved method s'")
  ylabel("s'")
  xlabel("t(sec)")
  plot(s1)

  subplot(1,2,2)
  title("Improved Method Euler s")
  ylabel("s'")
  xlabel("t(sec)")
  plot(s)




  # ----------- Second Input Values (f1+f2) -------------#


  #----------- Data 2----------#
  f1 = 4835/7000
  f2 = 4835/8000
  m = 9
  d=1
  h=0.0001
  Iz= 0.038
  s0 = 4835/1000
  AM = 4835
  bs = 3 - (4835/5000)
  bu = 5 - (4835/5000)
  
  t = 0:0.1:30
  display(length(t))
  s1=0
  #s2= [(f1+f2) - bs*abs(s1)*s1]/9
  s = zeros(1,length(t))
  display(length(s))
  s1 = zeros(1,length(t))
  s2 = zeros(1,length(t))
  s1(1) = 0 
  s(1)=AM/4835
  
  #-------- ImprovedEuler 2 --------#
  
  # --------- Traspotational --------#
  
  
  # s' #
  
  for k = length(t)(t+1)
    s2(k) = (f1+f2 -bs*(abs(s1(k)*s1(k))))/m
    s1(k+1)= s1(k)+h/2*(s2(k)+(f1+f2/m - abs((s1(k)+h*(s2(k))))*(s1(k)+h*(s2(k))))
  endfor
  
  # s #
  
  for k = length(t)*(t+1)
    s(k+1) = s(k)+h/2(s1(k)+s1(k+1))
  endfor



  # ----------- Rational Move 2 ------------- #

  # w' and w #


  #---------- SUBPLOT 2----------#
  figure(2)
  subplot(1,2,1)
  title("Improved method euler s' ")
  ylabel("s'")
  xlabel("t(sec)")
  plot(s1)
  
  subplot(1,2,2)
  title("Improved Method euler s ")
  ylabel("s")
  xlabel("t(sec)")
  subplot(s)
  
endfunction

  
  