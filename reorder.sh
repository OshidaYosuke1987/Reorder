#!/bin/sh
#ファイル名（変更前後）配列を個数分初期化
how_many_files=`ls $1 | wc -l`
origings=($how_many_files)
destins=($how_many_files)

#変更前ファイル名配列に個数分代入
i=0
for name in `ls -rt $1`
do
  origins[$i]=${name}
  let i++
done

i=0
for index in `seq -f %03g 1 $how_many_files`
do
  destins[$i]="$2_${index}.png"
  let i++
done

for i in $(seq 0 $(($how_many_files-1)))
do
  if test $# -eq 0 ; then
	   mv ${origins[$i]} ${destins[$i]}
   elif test $# -eq 1 ; then
     echo "Failed! Lacking argument"
   else
     mv $1/${origins[$i]} $1/${destins[$i]}
   fi
done
