#!/bin/bash

mkdir logs
touch mass_cg.txt
for MASS in 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0;
do
cd logs
mkdir mass_$MASS
cd mass_$MASS
cp ~/project/crack/in.crack ./
sed "s/SS/$MASS/g" in.crack > in.crack2
srun -N 1 -p RT_build --ntasks-per-node=1 -J lammps_malakhov --comment="first try" ~/bin/lmp_mpi -in in.crack2
cd ../..
cpu=$(awk -f test.awk ~/project/crack/logs/mass_$MASS/log.lammps)
echo "$MASS $cpu" >> mass_cg.txt
done
gnuplot gnuplot.sh
curl -s -X POST https://api.telegram.org/bot1991871701:AAG7q9OzUwJbLSXchQ4S8kwgto77z3poxD0/sendMessage -d chat_id=446636263 -d text="Calculation is over"
curl -F photo=@"home/common/studtscm05/project/crack/AvTemp.png" https://api.telegram.org/bot1991871701:AAG7q9OzUwJbLSXchQ4S8kwgto77z3poxD0/sendPhoto?chat_id=446636263
