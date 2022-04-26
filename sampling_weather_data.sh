#!/usr/bin/bash

# Download Data

# cek folder data
if [ ! -d data ]; then
	mkdir data
	mv KJAX.csv data/
else
	mv KJAX.csv data/
fi

# Seleksi Data berdasarkan kolom
csvcut -c 1,2,3,4 ./data/KJAX.csv | csvgrep 2014 > data/KJAX_sliced.csv 

# Sampling Data
cat data/KJAX_sliced.csv | sample -r 0.2 > data/KJAX_sampled.csv

if [ ! -d log ]; then
	mkdir log
	touch log/log
fi

