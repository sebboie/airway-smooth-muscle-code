ip3    = 0.05;
KCL    = 0.0;
influx = 1.0;
open   = 1.0;
gCa    = 0.009;
gSocc  = 0.0015;

par = [ip3; KCL; influx; open; gCa; gSocc];



agonistNif  = load('data/agonist_Nifedipine');
t1  = agonistNif.t1';
t2  = agonistNif.t2';
y0    = agonistNif.y';
z0    = agonistNif.z';

y      = AuxiliaryFunctions(t1,y0,par);

par = [ip3; KCL; influx; open; 0; gSocc];

z      = AuxiliaryFunctions(t2,z0,par);

t1     = t1';
t2     = t2';
y      = y';
z      = z';

save('data/agonist_Nifedipine_currents.mat', 'y');
save('data/agonist_Nifedipine_currents.mat', 't1','-append');
save('data/agonist_Nifedipine_currents.mat', 'z','-append');
save('data/agonist_Nifedipine_currents.mat', 't2','-append');
