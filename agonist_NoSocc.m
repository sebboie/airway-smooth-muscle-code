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

[t1, y]  = ode23s(@(t,x) asmc_ramp(t,x,par), [0 200], x0);
par      = [ip3; KCL; influx; open; gCa; 0.0];
[t2, z]  = ode23s(@(t,x) asmc(t,x,par), [0 200], y(end,:));

save('data/agonist_NoSocc.mat', 'y');
save('data/agonist_NoSocc.mat', 't1', '-append');
save('data/agonist_NoSocc.mat', 't2', '-append');
save('data/agonist_NoSocc.mat', 'z', '-append');

clf;
figure(1);
subplot(2,1,1)
plot(t1,y(:,1), t1(end)+t2, z(:,1))
subplot(2,1,2)
plot(t1,y(:,6), t1(end)+t2, z(:,6))
