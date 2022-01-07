function testEuler()
  am = 4835
  f1 = am/7000
  f2 = am/7000
  h=0.0001
  t = 0:h:30

  s = zeros(1,length(t))

  s1 = zeros(1, length(t))#

  s(1) = am/1000
  s1(1)=0
  for k = 1:length(t)
    s1(k) = (f1+f2)*t(k)+h*(s(k)^2)/2
    s(k+1)= s(k)+h*s1(k)
  endfor
endfunction