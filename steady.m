ip3    = 0.0;
KCL    = 0.0;
influx = 1.0;
open   = 1.0;
gCa    = 0.009;
gSocc  = 0.0015;

par = [ip3; KCL; influx; open; gCa; gSocc];

c   = 0.165715430397007;
cb  = 0.165715430397007; 
ct  = 86.614773862844118;
h42 = 0.938060442341532;
Pso = 0.068402298300266;
V   = -46.679028350414868;

x0  = [c;cb;ct;h42;Pso;V];

[t, y]   = ode23s(@(t,x) asmc(t,x,par), [0 2000], x0);

save('data/steady.mat', 'y');
save('data/steady.mat', 't','-append');

clf;
figure(1);
plot(t,y(:,1))