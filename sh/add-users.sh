for users in `cat users.csv`

do
  user=`echo $users | sed 's/"//g' | cut -f 1 -d ,`
  pass=`echo $users | sed 's/"//g' | cut -f 2 -d ,`
  useradd $user -m -p `mkpasswd $pass`
done
