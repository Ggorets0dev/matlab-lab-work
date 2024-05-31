function internal_method(a, b, y2)
    [x, y] = ode45('var_func', [a, b], y2);
    
    figure(3)
    grid on;
    plot(x, y)
    title('Встроенные средства MATLAB')
end

