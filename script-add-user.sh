#!/bin/bash

#filein="user.txt"
#if [ ! -f "$filein" ]
#then
#  echo "Impossible de trouver le fichier"
#else
#fi
input="$1"
while IFS= read -r line
do
  login=$(cut -d: -f 1 <<< "$line")
  prenom=$(cut -d: -f 2 <<< "$line")
  nom=$(cut -d: -f 3 <<< "$line")
  motdepasse=$(cut -d: -f 4 <<< "$line")

cut -d -f 1 /etc/passwd | egrep "login" >/dev/null


if [ $? -eq 0 ]; then
	echo "$login existe"
	exit 1
else
useradd -m "$login" "$motdepasse"
passwd --expire "$login"

for i in `seq 10`
do
  rdm=$(

 [ $? -eq 0 ] && echo "Utilisateur ajouter a /etc/passwd" || echo "Erreur dans l'ajout de l'utilisateur"
fi
done < "$input"
#else
#	echo "Il y a seulement root qui peut ajouter des users"
#	exit 2
#fi
