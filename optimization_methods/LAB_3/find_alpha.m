function [res, iter_cnt, func_cnt, grad_cnt]  = find_alpha(x_k, min_alpha, max_alpha)
    % Определяем функцию
    var_func = @(x) 45 * (x(1) .^ 2) - 88 .* x(1) .* x(2) + 45 .* (x(2) .^ 2) + 102 .* x(1) + 268 .* x(2) - 21;
    
    % Определяем градиент функции
    grad_f = @(x) [
        90 * x(1) - 88 * x(2) + 102;
        -88 * x(1) + 90 * x(2) + 268;
    ];

    % Счетчики
    func_cnt = 0;
    iter_cnt = 0;
    grad_cnt = 0;

    eps = 1e-3;
    a = min_alpha;
    b = max_alpha;
    d = (b - a) / 4;
    alpha = a;
    x0 = x_k - alpha * grad_f(x_k);
    f0 = var_func(x0);
    k = 0;
    
    func_cnt = func_cnt + 1;
    grad_cnt = grad_cnt + 1;

    while abs(d) > eps & k < 100
        next_alpha = alpha + d;
        x1 = x_k - next_alpha * grad_f(x_k);
        f1 = var_func(x1);
        
        func_cnt = func_cnt + 1;
        grad_cnt = grad_cnt + 1;

        if f1 <= f0 & (d > 0 & next_alpha ~= b | d < 0 & next_alpha ~= a)
            alpha = next_alpha;
            x0 = x1;
            f0 = f1;
        else
            d = -d/4;
        end

        iter_cnt = iter_cnt + 1;
    end
    
    res = alpha;
end
