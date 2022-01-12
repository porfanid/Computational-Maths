function Problem_1_3 ()


# -------------- Data ------------ #

  f1 = 4835/7000
  f2 = 4835/7000
  m = 9
  d=1
  h=0.0001
  Iz= 0.038
  s0 = 4835/1000
  t = 0:30
  bs = 3 + (4835/5000)
  bu = 5 - (4835/5000)
  Kps = 5
  Kds =15+ (AM/1000)
  s(0)=0
  Sdes=AM/200 
  

  s1(1)=0
  #s2= (Kps*(Sdes-s)-Kds*s1 - bs*abs(s1)*s1)/9
  s = zeros(1,length(t))
  s1 = zeros(1,length(t))
  s2 = zeros(1,length(t))

# -------------- Euler 1------------ #


# --------------- Transportation Move ---------------- #

for k = length(t)*(t+1)
  s2(k) = ((Kps*(Sdes-s(k))-Kds*s1(k) - bs*abs(s1(k))*s1(k)))/m  # s"
  s1(k+1) = s1(k)+h*s2(k) # s'
  s(k+1)  = s(k)+h*s1(k)  # s
endfor

# ----------------- Rational Movement ------------------ #


  
  w = zeros(1,length(t))
  w1 = zeros (1,length(t))
  w(1) = 0
  for k = 1: length(t)*(t)
    w1(k)=(d/2*(f2-f1) - bu*abs(w(k))*w(k)) #w1
    w(k+1) = w(k)+h*w1(k) #w
  endfor

  # --------------- subplot ---------------- #






# ---------------- Improved Method Euler ----------------- #

# -------------- Data ------------ #

  f1 = 4835/7000
  f2 = 4835/7000
  m = 9
  d=1
  h=0.0001
  Iz= 0.038
  s0 = 4835/1000
  t = 0:30
  bs = 3 + (4835/5000)
  bu = 5 - (4835/5000)
  Kps = 5
  Kds =15+ (AM/1000)
  s(0)=0
  Sdes=AM/200 
  




  s1(1)=0
  #s2= (Kps*(Sdes-s)-Kds*s1 - bs*abs(s1)*s1)/9
  s = zeros(1,length(t))
  s1 = zeros(1,length(t))
  s2 = zeros(1,length(t))



  # s'(n+1) = s'(n) + hs"(n)

  for k = length(t)*t
    s2(k)=((Kps*(Sdes-s(k))-Kds*s1(k) - bs*abs(s1(k))*s1(k)))/m  #s"
    s1(k+1) = s1(k) + h/2*(s2(k)+((Kps*(Sdes-(s(k)+h*s1(k)))-Kds(s1(k)+h*s2(k))-bs*abs(s1(k)+h*s2(k))*(s1(k)+h*s2(k)))/m) #s'
    s(k) = s(k) + h/2*(s1(k)+s1(k+1)) # s
  endfor


# ---------- Subplot ---------- #
figure(1)  # s" # s'
subplot(1,2,1)
plot(s2)
title(" s''= Kps(Sdes - s)-Kds(s')-bs|s'|s'  ")
ylabel("s"")
xlabel("t(sec)")

figure(2)





endfunction