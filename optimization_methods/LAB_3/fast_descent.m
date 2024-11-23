clc;

%% Метод наискорейшего спуска

x = [0; 0]; 

a_lower = -10;
a_upper = 10;

% Счетчики
func_cnt = 0;
iter_cnt = 0;
grad_cnt = 0;

% Буферы приема подсчета из функции поиска альфа
func_cnt_a = 0;
iter_cnt_a = 0;
grad_cnt_a = 0;

grad = grad_f(x);
grad_cnt = grad_cnt + 1;

while norm(grad) >= eps
    [alpha, iter_cnt_a, func_cnt_a, grad_cnt_a] = find_alpha(x, a_lower, a_upper);
    x = x - alpha * grad;
    grad = grad_f(x);

    func_cnt = func_cnt + func_cnt_a;
    grad_cnt = grad_cnt + grad_cnt_a + 1;
    iter_cnt = iter_cnt + iter_cnt_a + 1;
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
