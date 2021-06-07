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
        C2 = y_0;
        C1 = y_prime_0 - C2 * w(1);
        

        fprintf('Y = %.4gxe^%.4gx + %.4ge^%.4gx\n',C1 , w(2), C2, w(2));
    end

%Case 3 - Complex roots
    if (b*b < 4*a*c)
        r = real(w(1,1));
        i = imag(w(1,1));
        y = exp(real(w(1,1))*x)*(C1 *cos(r*x)+ C2 *sin(r*x));
        fprintf('Y = e^%.4gx[ C1cos%.4gx + C2sin%.4gx ]\n', r, i, i);
        C1 = y_0;
        C2 = (y_prime_0 -C1 * r)/i;
        if(C1 == 0)
            fprintf('Y = e^%.4gx[  %.4gsin%.4gx ]\n',r , C2, i);
        end
        if(C2 == 0)
            fprintf('Y = e^%.4gx[  %.4gcos%.4gx ]\n',r , C1, i);
        end
        
        if(C1~=0 && C2 ~=0 )
            fprintf('Y = e^%.4gx[ %.4gcos%.4gx + %.4gsin%.4gx ]\n',r , C1, i, C2, i);
        end       
        fprintf('');
    end


