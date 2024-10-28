M=1024;
K = 8;
f = zeros(M,1);
f(1:K)=ones(K,1);
figure;
plot(1:20,f(1:20),'.');
ylim([0,4]);
xlabel('1D function (x=1...1024)');


F=zeros(M,1);
for u= 0:M-1
   for x = 0:M-1
       F(u+1) = F(u+1) + ( (-1)^x* f(x+1) * exp(-1i*2*pi*u*x/M));
   end
   F(u+1) = 1/M*F(u+1);
end
figure;
plot(1:M, abs(F(1:M)));
xlabel('1D DFT (x=1...1024)');