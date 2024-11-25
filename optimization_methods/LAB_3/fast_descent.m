clc;
%% Метод наискорейшего спуска
% Минимизация через матрицу Гессе

x = [0; 0];

% Счетчики
func_cnt = 0;
iter_cnt = 0;
grad_cnt = 0;

while true
    grad = grad_f(x);
    grad_cnt = grad_cnt + 1;

    n_grad = sqrt(grad(1)^2 + grad(2)^2);
    
    if n_grad < eps
        break
    end
  
   num_a = dot(grad, grad);
   denum_a = dot(grad, G_matr * grad);
   alpha = num_a / denum_a;
   x = x - alpha * grad;
   
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
