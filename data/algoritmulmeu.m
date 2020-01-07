popSize = 50; % numar natural intre 20 si 100

Kr_min = 0
Kr_max = 10

Ti_min = 0
Ti_max = 3

Td_min = 0
Td_max = 3

varBound = [
	Kr_min, Ti_min, Td_min
	Kr_max, Ti_max, Td_max
]

evalFN = 'functieobiectiv';
evalOps = [];

% precizion, reprezentation type
options = [1e-6 1];

initPop = initializega(popSize, varBound, evalFN, evalOps, options);

bounds = [Kr_min Kr_max; Ti_min Ti_max; Td_min Td_max];
startPop = initPop;
opts = [1e-6 1 0];

termFN = 'maxGenTerm';
termOps = 50;
selectFN = 'normGeomSelect';
selectOps = 0.08;
xOverFNs = 'arithXover';
xOverOps = 4;
mutFNs = 'unifMutation';
mutOps = popSize * 8 / 100;

[x,endPop,bPop,traceInfo] = ga(bounds,evalFN,evalOps,startPop,opts, ...
				termFN,termOps,selectFN,selectOps,xOverFNs,xOverOps, ...
				mutFNs,mutOps);

Kr = x(1);
Ti = x(2);
Td = x(3);
assignin('base', 'Kr', x(1));
assignin('base', 'Ti', x(2));
assignin('base', 'Td', x(3));

[T,state,outputs] = sim('modelSRA',20); %20[sec.] reprezintatimpul de simulare

y=outputs(:,2);
ref=outputs(:,3);
t=outputs(:,4);
figure(1);
hold on;
grid on;
G1=plot(t,y,'b');
G2=plot(t,ref,'m');
legend('Turatia motorului','Turatia de referinta');
axis tight;
hold off;

