function Euler()
  
  #----------------Data----------------#
  
  m = 9
  d=1
  h=0.0001
  Iz= 0.038
  s0 = 4835/1000
  t = 0:30
  bs = 3 - (4835/5000)
  bu = 5 - (4835/5000)
  
  s1=0
  s2= [(f1+f2) - bs*abs(s1)*s1]/9
  s = zeros(1,length(t))
  w = zeros(1,length(t))
  w0 = 0
  w1 = ((d/2*(f2-f1))-bu*abs(w0)*w0)/0.38
  # --------------------------- Euler Method 1 --------------------------#
  
         
  #     .!. (psolh) 
  
  
  # -------------------------- Transport Movement ---------------------#
  
  s(1) = s0 + h*s2
  for k = 1:31
    s(k+1)= s(k)+h*s2 
  endfor
  
  # -------------------------- Rational Movement ----------------------#
  
  w(1) = w0 + h*w1
  for k =1:31
    w(k+1) = w(k)+h*w1
  endfor

  # --------------------------- Subplot --------------------------------#
  subplot(1,2,1)
  plot(k,s)
  xlabel("t")
  ylabel("s(t)")
  grid
  title(" Euler method Transport Movement (s(t+1)= s(t)+h[(f1+f2)-bs|s'|*s']/9)")

  subplot(1,2,2)
  plot(k,w)
  xlabel("t")
  ylabel("w(t)")
  grid
  title(" Euler method Rational Movement (w(t+1) = w(t)+h*w1)")




  # ---------------------------- Euler Method 2--------------------------#
  
  f1 = 4835/7000
  f2 = 4835/8000
  m = 9
  d=1
  h=0.0001
  Iz= 0.038
  s0 = 4835/1000
  t = 0:30
  bs = 3 - (4835/5000)
  bu = 5 - (4835/5000)
  
  s1=0
  s2= [(f1+f2) - bs*abs(s1)*s1]/9
  s = zeros(1,length(t))
  w = zeros(1,length(t))
  w0 = 0
  w1 = ((d/2*(f2-f1))-bu*abs(w0)*w0)/0.38
  
  
  # -------------------------- Transport Movement ---------------------#

  s(1) = s0 + h*s2
  for k = 1:31
    s(k+1)= s(k)+h*s2 
  endfor
  
  # -------------------------- Rational Movement ----------------------#

  w(1) = w0 + h*w1
  for k =1:31
    w(k+1) = w(k)+h*w1
  endfor

  # --------------------------- Subplot --------------------------------#

  subplot(1,2,1)
  plot(k,s)
  xlabel("t")
  ylabel("s(t)")
  grid
  title(" Euler method Transport Movement (s(t+1)= s(t)+h[(f1+f2)-bs|s'|*s']/9)")

  subplot(1,2,2)
  plot(k,w)
  xlabel("t")
  ylabel("w(t)")
  grid
  title(" Euler method Rational Movement (w(t+1) = w(t)+h*w1)")
  
  endfunction