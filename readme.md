# Optimisation des performances d'un programme par compilation optimisante
Le projet consiste a etudier les differentes optimisations effectuees a la compilation a travers 2 etapes:
- compiler 2 programmes en C/C++ avec chaque niveau d'optimisation (-O0, -O1, -O2, -O3, -Os) et chaque compilateur (gcc, clang, icx, ccomp) pour comparer les performances.
- faire des recherches sur les optimisations activees a chaque niveau d'optimisation pour chaque compilateur

## Autres details

comparer les perf sur 2 prog :
- matrix multiply => taille des matrices 2x celle du cache le plus gros
- code c ou c++ d'un algo de graphe ( boost )

a faire :
- compiler les programmes avec toutes les options de compil
- calculer le temps 12 fois pour chaque executable
- utiliser R pour faire des boites a moustache
- checker les autres options d'opti et voir laquelle fait quoi

j'archive si jamais quelqu'un en a besoin
