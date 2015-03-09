# bubbleasm
Implémentation du tri à bulle sur Microprocessor Simulator for Students

## Présentation
Cet exercice permet d'aborder la programmation en assembleur en implémentant un algortihme connu de tri sur un tableau d'entiers de huit éléments : 5 1 4 2 8 9 3 7

## Algorithme
Le principe du tri à bulles est de parcourir le tableau plusieurs fois en échangeant les éléments deux à deux lorsque le premier n'est pas inférieur au second.
On ne recommence par de parcours lorsque le dernier n'a pas engendré de commutation.
De plus, étant donné qu'à la fin de chaque parcours, le dernier élément est forcément à sa place, le parcours suivant s'arrêtera un élément avant.
Au pire des cas, (ç'est à dire si le tableau est classé en ordre décroissant), la complexité de l'algorithme est n!.

1. echangeEffectue = vrai;
2. x=-1;
2. while (echangeEffectue est vrai)
3. echangeEffectue = faux;
4. x++;
2. pour chaque element i allant de 1 a n-x
3.     si (element i) > (element i+1)
4.          echange element i et element i+1;
5.          echangeEffectue=vrai;
5. 			fin si
6. fin pour



## Implémentation
Pour implémenter cela avec le simulateur, le tableau, ainsi que le drapeau de commutation et l'indice maximum de parcours (n-x) sont stockés dans le registre.
Les indices dans le registre sont choisis de manière suffisamment grande pour les instructions ne viennent recopier les données.
Les blocs de code associés à des commandes jumps conditionnels permettent d'effectuer les comparaisons et d'exécuter les instructions correspondant à chaque cas.
La variable CL est utilisée comme compteur de parcours du tableau.
Les variables AL,BL et DL permettent d'effectuer les opérations arithmétiques ou de comparaison.

La pile n'a pas été utilisée dans ce cas, mais c'est un outil utile dans ce contexte assembleur ou peu de variables sont exploitables.

# Remarques
variables asm
