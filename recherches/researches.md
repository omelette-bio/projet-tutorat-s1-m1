# recherches pour le sujet

## architecture de mon pc portable

### infos de base
model name : 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz
cpucores : 4
logical cpu : 8
address sizes	: 39 bits physical, 48 bits virtual

### tailles de caches
instruction : 32KB
L1 : 48KB
L2 : 1280KB
L3 : 8192KB

+-------------------------------------+
| +------+ +------+ +------+ +------+ |
| | 0  4 | | 1  5 | | 2  6 | | 3  7 | |
| +------+ +------+ +------+ +------+ |
| +------+ +------+ +------+ +------+ |
| | 48kB | | 48kB | | 48kB | | 48kB | |
| +------+ +------+ +------+ +------+ |
| +------+ +------+ +------+ +------+ |
| |  1MB | |  1MB | |  1MB | |  1MB | |
| +------+ +------+ +------+ +------+ |
| +---------------------------------+ |
| |               8MB               | |
| +---------------------------------+ |
+-------------------------------------+

## debut du projet

pour que les matrices fassent 2 fois la taille du plus gros cache => minimum 1155 elements, je vais prendre gros et faire 2000