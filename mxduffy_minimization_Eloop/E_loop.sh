BIN=vasp.5.3.5-intel
rm WAVECAR
for i in  150 160 170 180 190 200 210 220 230 240 250 260 270 280 290 300 350 400 450 500 ; do
cat >INCAR <<!
System = Cu-As-Te
ISTART = 0 ; ICHARG = 2
ENCUT = $i
ISMEAR = 0; SIGMA = 0.1
NSW = 5
IBRION = 2
ISIF = 3
LREAL = .TRUE.
LPLANE = .FALSE.
NPAR = 6
NSIM = 1
ISYM=2
LCHARG=F
!
echo "ENCUT= $i" ; mpirun -np 1 $BIN
E=`tail -1 OSZICAR` ; echo $i $E  >>SUMMARY.Eloop
mkdir -p out$i
mv INCAR out$i
mv CONTCAR out$i
mv OUTCAR out$i
mv OSZICAR out$i
mv CHGCAR out$i
done
cat SUMMARY.Eloop