function ImprovedEuler
  
  
  #----------- Data ----------#
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
  
  #-------- ImprovedEuler 1 --------#
  
  # s' #
  for k = length(t)(t+1)
    s1(k+1)= s1(k)+hs1()
  endfor
  
  endfunction