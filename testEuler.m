function testEuler()
  am = 4835
  f1 = am/7000
  f2 = am/7000
  h=0.01
  t = 0:h:30

  s = zeros(1,length(t))
  s1 = zeros(1, length(t))#s'
  s2 = zeros(1, length(t))#s"

  s(1) = am/1000
  s1(1)=0
  s2(1)=0
  for k = 1:3000*(t+1)
    s1(k+1) = ((f1+f2)*t(k)+h*(s(k)^2)/2)/9
    s(k+1)= s(k)+h*s1(k)
  endfor
  plot(s)
endfunction