a = input("Enter the value of the  2nd derivative coefficient: ");
b = input("Enter the value of the 1st derivative coefficient: ");
c = input("Enter the value of the variable coefficient: ");
fprintf('eqn = %.15gy"',a);
fprintf(' + %.15gyp',b);
fprintf(' + %.15gy\n',c);

y_0 = input("Enter the value y(0): ");
y_prime_0 = input("Enter the value of y'(0): ");
q = [a, b, c];
w = roots(q)
    if (b*b > 4*a*c)
        p = [a, b, c];
        fprintf('Y = C1e^%.15gx', w(1));
        fprintf(' + C2xe^%.15gx',w(2));
        
    end

    


