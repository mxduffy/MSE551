#!/usr/bin/bash







#################################################extract_info###########################################################

E=`grep  -A61 "Step PotEng KinEng TotEng Enthalpy Temp Volume Press " log.lammps` 

echo $E  >>SUMMARY


#################################################end_extract_info###########################################################



