data = load('grafic_gb76_reg.plot');

u = data(:, 1);
y = data(:, 3);

n = 567;
Te1 = 1;

t = 0:Te1:n-1;

figure;
hold on;
plot(t, u);
plot(t, y);

hold off;