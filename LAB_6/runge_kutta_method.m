function runge_kutta_method(h, x, y2)
    x_len = length(x);
    y = zeros(1, x_len);
    
    y(1) = y2;
    
    for i = 1:x_len-1
        k1 = var_func(x(i), y(i));
        
        k2 = var_func(x(i) + 1 / 2 * h, y(i) + h * k1 / 2);
        k3 = var_func(x(i) + 1 / 2 * h, y(i) + h * k2 / 2);
        
        k4 = var_func(x(i) + h, y(i) + h * k3);
        y(i + 1) = y(i) + 1 / 6 * h * (k1 + 2 * k2 + 2 * k3 + k4);
    end
    
    figure(2)
    grid on;
    plot(x, y)
    title('Метод Рунге-Кутты 4-го порядка')
end

