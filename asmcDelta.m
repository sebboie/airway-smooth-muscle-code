function y = asmcDelta(t, x, par)

% Variables
c   = x(1,:);
cb  = x(2,:);
ct  = x(3,:);
h42 = x(4,:);
Pso = x(5,:);
V   = x(6,:);

% Parameters that can be changed for various stimuli
p      = par(1,:);
KCL    = par(2,:);
influx = par(3,:);
open   = par(4,:);
gCa    = par(5,:); 
gSocc  = par(6,:); 
Delta  = par(7,:);


% Parameters IP3 recepetors
cp0    = 120.0; % Cao et al.
q26    = 10500.0; % Cao et al.
q62    = 4010.0; % Cao et al. 
H      = 20.0; % Cao et al.
L      = 0.5; % Cao et al. 
kdiff  = 10.0; % Cao et al.
kleak  = 0.0032; % Cao et al.
y1     = 100.0; % Cao et al. 
y2     = 10.0; % Cao et al. 
kIPR   = 0.07; % Cao et al. 0.05
k24    = 0.35; % Cao et al.
km24   = 80.0; % Cao et al.

% Parameters for serca pump
Vs     = 13.25;  % Cao et al. 10.0
ns     = 1.75; % Cao et al.
Ks     = 0.26; % Cao et al.

% Parameters for ryanodine receptors
kRyR   = 0.11; % this work
kryr0  = 0.0072; % Wang et al.
kryr1  = 0.12; % Wang et al. 0.334
kryr2  = 0.33; % Wang et al. 0.5
kryr3  = 700.0; % this work

% Parameters voltage-gated Ca2+ channels
Vm     = -18; % this work
km     = 17.5; % this work

% Ion concentrations
K_ext  = 8;%8.0; % Roux et al. 5
K_int  = 120;%120.0; % Roux et al. 150
Na_ext = 130.0; % Roux et al. 
Na_int = 12.0; % Roux et al.
Cl_ext = 140.0; % Roux et al.
Cl_int = 55.0; % Roux et al.
Ca_ext = 2; % Roux et al.

% Other parameters
R      = 8314.4621; % Roux et al.
T      = 310.0; % Roux et al.
F      = 96485.3415; % Roux et al. 

% Parameters Socc channels
Tso    = 30.0; % Croisier et al.
Ksocc  = 450.0; % this work
% Parameters plasma membrane ion channels
omega   = 0.0028; % this work
scale   = 1.449; % this work
G_Kdr   = 0.035; % Roux et al.
y_Kss   = 0.15; % Roux et al.
G_KCa   = 2.45; % Roux et al.
alpha   = 280.0; % Roux et al.
beta    = 480.0; % Roux et al.
G_Cl    = 0.01; % Roux et al.
Ca_CT    = 0.5; % Roux et al.
I_NaKMax = 0.7; % Roux et al.
Km_K     = 1.0; % Roux et al.
Km_Na    = 40.0; % Roux et al.
G_bNa    = 0.003263; % Roux et al.
G_bK     = 0.008729; % Roux et al. 
Cm       = 2e-5; % Roux et al.
Vrocc   = 0.0005;% this work
Vp      = 0.614; % Cao et al. 0.8
np      = 2.0; % Cao et al.
Kp      = 0.5; % Cao et al.

% Functions IP3 receptors
a42 = 1.8.*p.^2./(p.^2+0.34);
V24 = 62.0+880.0./(p.^2+4.0);
V42 = 110.0.*p.^2./(p.^2+0.01);
k42 = 0.49+0.543.*p.^3./(p.^3+64.0);
a24 = 1.0+5.0./(p.^2+0.25);
km42 = 0.41+25.0.*p.^3./(p.^3+274.6);
cs = y2.*(ct-c-cb./y1);
cp = cp0.*cs./100.0;
h24inf = km24.^2./(cp.^2+km24.^2);
m42inf = cb.^3./(cb.^3+k42.^3);
m24inf = cp.^3./(cp.^3+k24.^3);
q42inf = a42+V42.*m42inf.*h42;
q24inf = a24+V24.*(1.0-m24inf.*h24inf);
D = q42inf.*(q62+q26)./(q42inf.*q62+q42inf.*q26+q24inf.*q62);
lh42 = (1.0-D).*L+D.*H;
JIPR = kIPR.*(D.*q26./(q62+q26)).*(cs-cb);
Jdiff = kdiff.*(cb-c);

% Nernst potentials
E_Na = (R*T/F).*log(Na_ext./Na_int);
E_K =  (R*T/F).*log((K_ext+KCL)./K_int);
E_Cl =  (R*T/F).*log(Cl_int./(Cl_ext+KCL));
E_Ca = (R*T/(2*F)).*log(Ca_ext./(c.*1.0e-3));

% Ryanodine receptor
PRyR = (kryr0+kryr1.*c.^3./(kryr2.^3+c.^3)).*(cs.^4./(kryr3.^4.0+cs.^4.0));
JRyR = kRyR.*PRyR.*(cs-c);

% Other internal Ca2+ channels
Jserca = Vs.*c.^ns./(Ks.^ns+c.^ns);
Jleak  = kleak.*(cs-c);

% plasma membrane Ca2+ channels
Jrocc  = open.*influx.*Vrocc.*p.*(V-E_Ca);
Jsocc  = open.*influx.*gSocc.*Pso.*(V-E_Ca);
Jpm    = open.*(Vp.*c.^np-omega.*Ca_ext)./(Kp.^np+c.^np);
mVocc = 1.0./(1.0+exp(-(V-Vm)./km));
Vca = V.*((1.0e-3.*c)-Ca_ext.*exp(-2.0.*V.*F./(R*T)))./(1.0-exp(-2.0.*V.*F./(R*T)));
J_CaL = open.*influx.*gCa.*mVocc.^2.*Vca;

% Delayed-rectifier potassium channels
xa_Inf  = 1.0./(1.0+exp((-V+5.5)/6.0));
xi1_Inf = 1.0./(1.0+exp((V+4.3)/7.5));
xi2_Inf = 1.0./(1.0+exp((V+4.3)/7.5));
I_Kdr   = G_Kdr.*(y_Kss+(xi1_Inf+xi2_Inf).*(1-y_Kss)).*xa_Inf.^2.*(V-E_K);

% Big-conductance Ca2+ activated potassium channels
K_4 = 0.0000125.*exp(-1.99.*V.*F./(R.*T));
K_2 = 0.000275.*exp(-1.51.*V.*F./(R*T));
K_m1 = 0.24.*exp(-0.012.*V);
K_1 = 0.85.*exp(0.04.*V);
x_Ca1Inf = ((c.*1.0e-3).^2+K_4.*(c.*1.0e-3))./((c.*1.0e-3).^2+K_4.*(c.*1.0e-3).*(1+alpha./beta)+K_4.*K_2.*alpha./beta);
B = K_1.*(c.*1.0e-3).*x_Ca1Inf./K_m1;
I_KCa = G_KCa.*x_Ca1Inf.*B.*(V-E_K);


% Chloride channel
I_ClCa = G_Cl.*(V-E_Cl)./(1+(Ca_CT./c).^3);

% Other plasma membrane channels
I_NaK = I_NaKMax.*((K_ext+KCL)./(Km_K+(K_ext+KCL))).*(Na_int./(Km_Na+Na_int));
I_bK = G_bK.*(V-E_K);
I_bNa = G_bNa.*(V-E_Na);

% Differential equations
y(1,:) = Jdiff + Jleak + JRyR - Jserca + open.*scale.*(-Jpm+influx.*(-Jrocc-(0.0406-Delta.*0.0229)/0.0177.*Jsocc-Delta.*J_CaL));
y(2,:) = y1.*(JIPR-Jdiff);
y(3,:) = open.*scale.*(-Jpm+influx.*(-Jrocc-Jsocc-J_CaL));
y(4,:) = lh42.*(km42.^3./(cb.^3+km42.^3)-h42);
y(5,:) = 1.0./Tso.*(Ksocc.^4./(Ksocc.^4+cs.^4)-Pso);
y(6,:) = -1.0./Cm.*(open.*(Jpm+influx.*(Jrocc+Jsocc+J_CaL))+I_Kdr+I_ClCa+I_bK+I_bNa+I_NaK+I_KCa);
end
