from AUTOclui import *
clean()
EQrun = run(e='asmc', c='asmc')
save('asmc')

PO = run(EQrun('HB'),c='HB')
append('asmc')

POrun2 = run(PO('UZ'),c='HB.2', NMX=2200)
#POrun3 = run(PO('UZ'), c='HB.2', DS='-', NMX=2200)

plot('asmc')
wait()
