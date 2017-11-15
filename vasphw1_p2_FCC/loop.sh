
BIN=vasp.5.3.5-intel
rm WAVECAR
for i in  3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 ; do
cat >POSCAR <<!
fcc Si:                                 
   $i     
     0.4450880861535205    0.4450880861535205   -0.0000000000000000
     0.0000000000000000    0.4450880861535205    0.4450880861535205
     0.4450880861535205    0.0000000000000000    0.4450880861535205
   Si
     1
Direct
  0.0000000000000000  0.0000000000000000  0.0000000000000000
 
  0.00000000E+00  0.00000000E+00  0.00000000E+00
!
echo "a= $i" ; mpirun -np 1 $BIN
E=`tail -1 OSZICAR` ; echo $i $E  >>SUMMARY.fcc
mkdir -p out$i
mv POSCAR out$i
mv CONTCAR out$i
mv OUTCAR out$i
mv OSZICAR out$i
mv CHGCAR out$i
done
cat SUMMARY.fcc