clc;
a = input('Enter the value of the  2nd derivative coefficient: ');
b = input('Enter the value of the 1st derivative coefficient: ');
c = input('Enter the value of the variable coefficient: ');
fprintf('eqn = %.15gy"',a);
fprintf(' + %.15gyp',b);
fprintf(' + %.15gy\n',c);

y_0 = input('Enter the value y(0): ');
y_prime_0 = input('Enter the value of yprime(0): ');
q = [a, b, c];
w = roots(q)
    if (b*b > 4*a*c)
        fprintf('Y = C1e^%.4gx', w(1));
        fprintf(' + C2e^%.4gx',w(2));
        
        A = [1 ,1;
            w(1), w(2)];
        B = [y_0;
            y_prime_0];
        sol = linsolve(A, B)
        fprintf('Y = %.4ge^%.4gx', sol(1), w(1));
        fprintf(' + %.4ge^%.4gx', sol(2), w(2));
    end
    
%Case 2 if the roots are real and repeated
    if (b*b == 4*a*c)
        
        fprintf('Y = C1xe^%.4gx + C2e^%.4gx',w(2), w(2));
        fprintf('Yp = C1e^%.4gx', w(1));
        fprintf(' + %.4gC1xe^%.4gx + %.4gC2e^%.4gx\n',w(2), w(2), w(2), w(2));
        
        
        C2 = y_0;
        C1 = y_prime_0 - C2 * w(1);
        

        fprintf('Y = %.4gxe^%.4gx + %.4ge^%.4gx\n',C1 , w(2), C2, w(2));
    end    


