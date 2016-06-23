ip3    = 0.05;
KCL    = 0.0;
influx = 1.0;
open   = 1.0;
gCa    = 0.009;
gSocc  = 0.0015;

par = [ip3; KCL; influx; open; gCa; gSocc];

c   = 0.164052254736007;
cb  = 0.164052254736303; 
ct  = 88.141040158944278;
h42 = 0.939795571585303;
Pso = 0.064069265171092;
V   = -46.696765192469137;

x0  = [c;cb;ct;h42;Pso;V];
options = odeset('RelTol',1e-7,'AbsTol',1E-10);

[t1, y]   = ode23s(@(t,x) asmc_ramp(t,x,par), [0 200], x0, options);

kryr0  = 0.0072; 
kryr1  = 0.12; 
kryr2  = 0.33; 
kryr3  = 700.0;
y1     = 100.0;
y2     = 10.0;

ct = y(end,3);
cb = y(end,2);
c  = y(end,1);
cs = y2.*(ct-c-cb./y1);

pryr = (kryr0+kryr1.*c.^3./(kryr2.^3+c.^3)).*(cs.^4./(kryr3.^4.0+cs.^4.0))
par = [ip3; KCL; influx; open; gCa; gSocc];


[t2, z]   = ode23s(@(t,x) asmc_rycaff(t,x,par), [0 200], [y(end,:)'; pryr], options);

save('data/ryanodine_caffeine.mat', 'y');
save('data/ryanodine_caffeine.mat', 't1', '-append');
save('data/ryanodine_caffeine.mat', 't2', '-append');
save('data/ryanodine_caffeine.mat', 'z', '-append');

clf;
figure(1);
subplot(3,1,1)
plot(t1,y(:,1),t2+t1(end),z(:,1))
subplot(3,1,2)
plot(t1,y(:,6),t2+t1(end),z(:,6))
subplot(3,1,3)
plot(t2,z(:,7))
