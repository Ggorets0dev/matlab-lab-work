clc;

%% Метод градиентного спуска

x = [0; 0]; 
alpha = 0.01; % Шаг изменения

% Счетчики
func_cnt = 0;
iter_cnt = 0;
grad_cnt = 0;

grad = grad_f(x);
grad_cnt = grad_cnt + 1;

while sqrt(grad(1) ^ 2 + grad(2) ^ 2) >= eps
    y = x - alpha * grad;
    
    Fx = var_func(x);
    Fy = var_func(y);
    func_cnt = func_cnt + 2;

    if Fy < Fx
        x = y;
    else
        alpha = alpha / 2;
    end

    grad = grad_f(x);
    grad_cnt = grad_cnt + 1;

    iter_cnt = iter_cnt + 1;
end


% Вывод результатов
disp('Минимум найден:');
disp(['x1 = ', num2str(x(1))]);
disp(['x2 = ', num2str(x(2))]);
disp(['f(x) = ', num2str(var_func(x))]);
disp('------------');
disp(['Количество вычислений функции = ', num2str(func_cnt)]);
disp(['Количество вычислений градиента = ', num2str(grad_cnt)]);
disp(['Количество итераций = ', num2str(iter_cnt)]);
