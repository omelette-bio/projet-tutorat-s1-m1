build:
	echo "real : user : sys" >> time_data.txt
	for i in {1..12}; do (/usr/bin/time -f "%e : %U : %S" ./matrix-multiply-icx-O3) 2>> time_data.txt; done