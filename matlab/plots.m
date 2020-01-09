data = load('grafic.plot');

s = tf('s');

delay = 12;
u_amp = 55;

Kf = 29 / u_amp;
Tf = 160 / 3;

Hf = exp(s*-delay)*Kf/(Tf*s+1);

u = data(:, 1);
y = data(:, 3);

n = 788;
Te1 = 1;

t = 0:Te1:n-1;

figure;
hold on;

[ylin,~] = step(u_amp*Hf, t);
plot(t, ylin);

plot(t, y);
plot(t, u);

legend('comanda', 'iesirea', 'sistem liniar');

hold off;

stepinfo(ylin, t, 'RiseTimeLimits', [0.05 0.95])

% regulator PI
% Ti = 0.8*delay + 0.5*Tf
% Kr = 0.7*(Tf)/(delay*Kf)
Kr = 0.9327
Ti = 36.5748

Hr = Kr * (1 + 1/(Ti*s));
Hd = Hr * Hf;

H0 = Hd/(1+Hd);

Hr_d = c2d(Hr, 1, 'tustin')

% lsim(H0, u, t)
[y_reg_d,t_reg_d] = step(u_amp*H0);
stepinfo(y_reg_d, t_reg_d, 'RiseTimeLimits', [0.05 0.95])

figure;

hold on;
plot(t_reg_d, y_reg_d)
plot(t_reg_d, u_amp * ones(length(t_reg_d)))

legend('y(t)', 'r(t)')
hold off;