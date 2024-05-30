function step_basis_delta(X, Y, k, m)
    y_len = length(Y);
    XN = X;
    x_len = length(XN);
    YN = zeros(1, x_len);
   
    A = ones(y_len, k);
    for i = 1 : y_len
        for j = 2 : k
            A(i, j) = X(i) .^ (j - 1);
        end
    end
   
    b = inv(A' * A) * A' * Y;
   
    for q = 1 : k
        YN = YN + b(q) * XN .^ (q - 1);
    end

    z = polyfit(X, Y, k);
    YNM = polyval(z, XN);
    delta = YNM - YN;
    figure(m)
    hold on
    plot(X, delta)
    grid on
end
