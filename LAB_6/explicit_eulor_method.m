function explicit_eulor_method(h, x, y2)
    x_len = length(x);
    y = zeros(1, x_len);
    
    y(1) = y2;
    
    for i=1:x_len-1
        y(i + 1) = y(i) + h * var_func(x(i), y(i));
    end

    figure(1);
    plot(x, y)
    title('Явный метод Эйлера')
end