function [du] = var_func(t, u)
    du = (2 * t * u .^ 3) / (1 - t.^2 * u .^ 2);
end

