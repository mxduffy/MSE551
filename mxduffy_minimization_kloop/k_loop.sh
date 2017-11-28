BIN=vasp.5.3.5-intel
rm WAVECAR
for i in  3 4 5 6 7 8 9 10 11 12 13 14 15; do
cat >KPOINTS <<!
k-points
 0
Monkhorst Pack
 $i $i $i
 0  0  0
!
echo "M= $i" ; mpirun -np 48 $BIN
E=`tail -1 OSZICAR` ; echo $i $E  >>SUMMARY.kloop
mkdir -p k_out$i
mv KPOINTS out$i
mv CONTCAR out$i
mv OUTCAR out$i
mv OSZICAR out$i
done
cat SUMMARY.kloop