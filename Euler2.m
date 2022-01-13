function Euler()
  
  #---------------- Data ----------------#
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
  t = 0:0.1:30
  display(length(t))
  # --------------- Transportation ---------------- #
  
  s1=0
  #s2= [(f1+f2) - bs*abs(s1)*s1]/9
  s = zeros(1,length(t))
  display(length(s))
  s1 = zeros(1,length(t))
  s2 = zeros(1,length(t))
  s1(1) = 0 
  s(1)=AM/4835
  
  # ---------------- Rational ---------------------- #
  
  
  w = zeros(1,length(t))
  w1 = zeros (1,length(t))
  
  
  # ----------- PROGRAM BEGINS ---------------#
  
  # --------------------------- Euler Method 1 --------------------------#

  

  # ----- new ------ #
  #s2= ((f1+f2) - bs*abs(s1)*s1)/m
  #s2(1) = ((f1+f2)+bs*(abs(s1(1))*s1(1)))
  
  
  # --------------- Transportation Move ---------------- #
  
   
  for k = 1 : length(t)*(t+1)
    s2(k)= (((f1+f2)+bs*(abs(s1(k))*s1(k))))/m
    s1(k+1) = s1(k) + h*s2(k)
  endfor
  #plot s" s'
  figure(1)
  title(" Euler Method s' ")
  subplot(1,2,1)
  ylabel("s"")
  xlabel("t(sec)")
  plot(s2)
  subplot(1,2,2)
  ylabel("s'")
  xlabel("t(sec)")
  plot(s1)
  
  
  for k = 1 : length(t)*(t)
    s(k+1) = s(k)+h*s1(k)
  endfor

  #plot s
  figure(2)
  title("Euler Method s")
  ylabel("s")
  xlabel("t(sec)")
  plot(s)
  
  # ---------------- Rational Move ---------------------- #
  w(1) = 0
  for k = 1: length(t)*(t)
    w1(k)=((d/2*(f2-f1) - bu*abs(w(k))*w(k)))/Iz
    w(k+1) = w(k)+h*w1(k)
  endfor
  


  #------ plot w and w' ------#
  figure(3)
  subplot(1,2,1)
  title("Euler Method w")
  ylabel("w'")
  xlabel("t(sec)")
  plot(w1)
  subplot(1,2,2)
  ylabel("w")
  xlabel("t(sec)")
  plot(w)  
  
  
  
  # ----------- SECOND ------------ #
  
    
  #---------------- Data 2----------------#
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
  # --------------------------- Euler Method 2 --------------------------#



  # ----- new ------ #
  #s2= ((f1+f2) - bs*abs(s1)*s1)/m
  #s2(1) = ((f1+f2)+bs*(abs(s1(1))*s1(1)))
  
  
  # --------------- Transportation Move ---------------- #
  
  
  for k = 1 : length(t)*(t+1)
    s2(k)= (((f1+f2)+bs*(abs(s1(k))*s1(k))))/m
    s1(k+1) = s1(k) + h*s2(k)
  endfor

  # plot s" and s'
  figure(4)
  subplot(1,2,1)
  title("Euler method s' ")
  ylabel("s"")
  xlabel("t(sec)")
  plot(s2)
  subplot(1,2,2)
  ylabel("s'")
  xlabel("t(sec)")
  plot(s1)
  

  for k = 1 : length(t)*(t+1)
    s(k+1) = s(k)+h*s1(k)
  endfor
  figure(5)
  title("Euler Method s")
  plot(s)
  
  # ---------------- Rational Move ---------------------- #
  
  w(1) = 0
  for k = 1: length(t)*(t)
    w1(k)=((d/2*(f2-f1) - bu*abs(w(k))*w(k)))/Iz
    w(k+1) = w(k)+h*w1(k)
  endfor
  # plot w1 and w #

  figure(6)

  subplot(1,2,1)
  title("Euler Method w")
  plot(w1)
  ylabel("w'")
  xlabel("t(sec)")

  plot(w)  
  ylabel("w")
  xlabel("t(sec)")

  endfunction