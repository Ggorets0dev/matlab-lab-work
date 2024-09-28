function step_basis_matlab(X, Y, k, m)
    XN = X;
    z = polyfit(X, Y', k);
    YNM  = polyval(z, XN);
    
    figure(m)
    hold on
    plot(XN, YNM)
    plot(X, Y, 'r.')
    grid on
end
