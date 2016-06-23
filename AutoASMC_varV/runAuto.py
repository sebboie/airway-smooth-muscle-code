from AUTOclui import *
clean()

EQrun = run(e='asmc', c='asmc')
save('asmc')

PO = run(EQrun('HB'),c='HB')
append('asmc')

POvarSocc = run(PO('UZ'), c='HB.3', DS='-', UZSTOP={11:1000}) 
save('runP4')


plot('asmc')
wait()


