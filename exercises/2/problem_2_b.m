# Pavlos Orfanidis: 4134
# Giorgos Hatziligos: 4835
# Spyros Kontakis: 4702

function problem_2_b()
  #{
  # I will insert semicolons(;) in every line in matlab to avoid printing unwanted text to the screen
  #}
  # inserting the required data to the programm
  m=12;
  AM=4835;
  kds=15;
  kps=5;
  k1=0.1:100;
  bs=4-AM/5000;
  # End of required data
  
  
  
  # Program begins here
  find_root=0;
  max_root_index = (length(k1)-1)
  for n=0.1:max_root_index
    find_root+=1;
    u1=roots([(m/kps), (n+bs)/kps, 1]);
    solution1(find_root)=u1(1);
    solution2(find_root)=u1(2);
  endfor
  
  for n=0.1:max_root_index
    find_root+=1
    u2=roots([(find_root), (kds+bs)/(find_root), 1])
    solution3=u2(1);
    solution4=u2(2);
  endfor
  
  
  # Constructing the plots
  
  subplot(1,4,1);
  plot(real(solution1), imag(solution1));
  stem(solution1);
  title("Poles with Kds as a variable");
  xlabel("Real(t)");
  ylabel("Imag(t)");
  
  
  #plot(real(solution2), imag(solution2))
  
  
  
  
  subplot(1,4,2);
  plot(real(solution2), imag(solution2))
  stem(solution2)
  title("Poles with Kps as a variable");
  xlabel("Real(t)");
  ylabel("Imag(t)");
  
  
  
  
  subplot(1,4,3);
  plot(real(solution3), imag(solution3))
  stem(solution3)
  title("Poles with Kps as a variable");
  xlabel("Real(t)");
  ylabel("Imag(t)");
  
  
  
  
  subplot(1,4,4);
  plot(real(solution4), imag(solution4))
  stem(solution4);
  subplot(1,4,2);
  plot(real(solution2), imag(solution2))
  stem(solution2)
  title("Poles with Kps as a variable");
  xlabel("Real(t)");
  ylabel("Imag(t)");
  title("Poles with Kps as a variable");
  xlabel("Real(t)");
  ylabel("Imag(t)");
  # end of function
endfunction