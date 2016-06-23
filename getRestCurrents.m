ip3    = 0.05;
KCL    = 0.0;
influx = 1.0;
open   = 1.0;
gCa    = 0.009;
gSocc  = 0.0015;

par = [ip3; KCL; influx; open; gCa; gSocc];

steady = load('data/steady.mat');
y      = steady.y';
t      = steady.t';
y      = AuxiliaryFunctions(t,y,par);



t      = t';
y      = y';

save('data/rest_currents.mat', 'y');
save('data/rest_currents.mat', 't','-append');

