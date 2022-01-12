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
    w1(k)=((d/2*(f2-f1) - bu*abs(w(k))*w(k)))/Iz #w1
    w(k+1) = w(k)+h*w1(k) #w
  endfor

  # --------------- subplot ---------------- #
  figure(1)
  subplot(1,2,1)
  plot(s2)
  title(" s''= Kps(Sdes-s)-Kds(s')-bs|s'|s'")
  ylabel("s"")
  xlabel("t(sec)")
  subplot(2,1,2)
  plot(s1)
  title("s'(k+1) = s'(k) + h/2(s"(k)+((Kps(Sdes-(s(k)+h*s'(k)))-Kds(s'(k)+h*s"(k))-bs'abs(s1(k)+hs"(k))(s'(k)+hs"(k)))/m)")
  ylabel("s'")
  xlabel("t(sec)")

  figure(2) #s
  plot(s)
  title("s(k+1) = s(k) + h/2*(s'(k)+s'(k+1))")
  ylabel("s")
  xlabel("t(sec)")

  figure(3)
  subplot(1,2,1)
  title("w'=(d/2(f2-f1)-bu|w(k)|w(k))/Iz")
  xlabel("t(sec)")
  ylabel("w'")
  plot(w1)

  subplot(1,2,2)
  title("w(k+1)=w(k)+hw'(k)")
  xlabel("t(sec)")
  ylabel("w")
  plot(w)



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
    s(k+1) = s(k) + h/2*(s1(k)+s1(k+1)) # s
  endfor


# ---------- Subplot ---------- #
figure(4)  # s" # s'
subplot(1,2,1) # s"
plot(s2)
title(" s''= Kps(Sdes - s)-Kds(s')-bs|s'|s'  ")
ylabel("s"")
xlabel("t(sec)")

subplot(2,1,2)
plot(s1)
title("s'(k+1) = s'(k) + h/2(s"(k)+((Kps(Sdes-(s(k)+h*s'(k)))-Kds(s'(k)+h*s"(k))-bs'abs(s1(k)+hs"(k))(s'(k)+hs"(k)))/m)")
ylabel("s'")
xlabel("t(sec)")

figure(5) #s
plot(s)
title("s(k+1) = s(k) + h/2*(s'(k)+s'(k+1))")
ylabel("s")
xlabel("t(sec)")


endfunction