function[x_pop,fx_val] = functieobiectiv(x_pop,options)
	Kr = x_pop(1);
	Ti = x_pop(2);
	Td = x_pop(3);
	assignin('base', 'Kr', x_pop(1));
	assignin('base', 'Ti', x_pop(2));
	assignin('base', 'Td', x_pop(3));

	[T,state,outputs] = sim('modelSRA',20); %20 reprezinta timpul de simulare
	er = outputs(:,1);
	y = outputs(:,2);
	ref = outputs(:,3);
	t = outputs(:,4);

	IND = (er' * er); %ISE - Integral of Square Error
	yt1 = find(er>0.05, 1, 'last');
	yt2 = find(er<-0.05, 1, 'last'); %pe liniile de mai sus se cautabanda de regim stationar de 5%
	
	SettlingTime = t(max([yt1 yt2]));
	Overshoot = abs(min(min(er),0));
	if (Overshoot > OvershootCond & t1 > SettlingTime > t2) 
		%se inlocuieste OvershootCond cu o valoarespecifica problemei de rezolvat
		%se adauga conditii corespunzatoareasupra timpului tranzitoriu
		IND = 10e300;
	end
	fx_val=1/IND
end