from AUTOclui import *
clean()
EQrun = run(e='asmc', c='asmc')

UZp= run(EQrun('UZ1'), c='asmc.2')
save('asmc')

POrun2 = run(UZp('HB'),c='HB')
append('asmc')

#POrun3 = run(PO('UZ'), c='HB.2', DS='-', NMX=2200)

#save(relabel(merge(POrun2+POrun3)),'period')
plot('asmc')
wait()
