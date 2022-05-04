#!/bin/bash

#filein="users.txt"
#if [ ! -f "$filein" ]
#then
#  echo "Impossible de trouver le fichier"
#else
#fi
input="$1"
while IFS= read -r line
do
  login=$(cut -d: -f1 <<< "$line")

  prenom=$(cut -d: -f2 <<< "$line")

  nom=$(cut -d: -f3 <<< "$line")

  motdepasse=$(cut -d: -f4 <<< "$line")

  motdepasse_crypt=$(perl -e 'print crypt($ARGV[0], "motdepasse")' $motdepasse)

cut -d: -f 1 /etc/passwd | grep "^$login" >/dev/null


if [ $? -eq 0 ]; then

	echo "$login existe"

	exit 1
else

useradd -m -p "$motdepasse" "$login" -c "$prenom $nom"  

passwd --expire $login

for i in `seq 8`
do
  touch /home/$login/$i
done

 [ $? -eq 0 ] && echo "Utilisateur ajouter a /etc/passwd" || echo "Erreur dans l'ajout de l'utilisateur"
fi
done < "$input"
#else
#	echo "Il y a seulement root qui peut ajouter des users"
#	exit 2
#fi
