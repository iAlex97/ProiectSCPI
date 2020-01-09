data = load('grafic_gb76_reg.plot');

u = data(:, 1);
y = data(:, 3);

n = 546;
Te1 = 1;

t = 0:Te1:n-1;

figure;
hold on;
plot(t, u(1:n));
plot(t, y(1:n));

legend('comanda', 'iesirea');

hold off;

data = load('grafic_gb76_ridiche.plot');

u = data(:, 1);
y = data(:, 3);

n = 546;
Te1 = 1;

t = 0:Te1:n-1;

figure;
hold on;
plot(t, u(1:n));
plot(t, y(1:n));

legend('comanda', 'iesirea');

hold off;