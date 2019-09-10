% generate fractal by calling follow_z

% generate one million points !!!!!!

a = -2; b = 2;
a_imag = -2i; b_imag = 2i;

iter = 1e6;

num_real = ones(iter,1); 
num_imag = zeros(iter,1);
p = zeros(iter,1);



for i = 1:iter
    num_real(i) = a + (b - a).*rand;
    num_imag(i) = a_imag + (b_imag - a_imag).*rand;
    
    [~, nmax_complex(i)] =  follow_z_MM(num_real(i) + num_imag(i),c);
    %[~, nmax_imag(i)] =  follow_z_MM(num_imag(i),c);
    
    %fprintf('Iteration %g : \t %2.2f numreal \t %4f nmax \n',i,num_real(i), nmax_complex(i));
    
    
    
    p(i) = [num_real(i) + num_imag(i)];
end

