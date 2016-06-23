ip3    = 0.0;
KCL    = 50.0;
influx = 1.0;
open   = 1.0;
gCa    = 0.009;
gSocc  = 0.0015;

par = [ip3; KCL; influx; open; gCa; gSocc];

steady = load('data/steady');
y0     = steady.y';
t1     = steady.t';
y      = AuxiliaryFunctions(t1,y0,par);

depol  = load('data/depolarization');
z0     = depol.y';
t2     = depol.t';
z      = AuxiliaryFunctions(t2,z0,par);

t1     = t1';
t2     = t2';
y      = y';
z      = z';

save('data/depolarization_currents.mat', 'y');
save('data/depolarization_currents.mat', 't1','-append');
save('data/depolarization_currents.mat', 'z','-append');
save('data/depolarization_currents.mat', 't2','-append');
