from AUTOclui import *
clean()

EQrun = run(e='asmc', c='asmc')
save('asmc')

PO = run(EQrun('HB'),c='HB')
append('asmc')


plot('asmc')
wait()


