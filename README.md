# microstructure_percolation_sample_simulations
## Required:
- MeteoIO and SNOWPACK (https://code.wsl.ch/snow-models/ or https://github.com/snowpack-model/snowpack)
- gnuplot for plotting
- basic linux tools


## Steps to reproduce:
1) Create directories ```./output/```, ```./plots/``` and ```./postprocess/```

2) Run the simulations using:
```snowpack -c sample1.ini -e 2021-06-01T00:00:00```
and
```snowpack -c sample2.ini -e 2021-06-01T00:00:00```

3) Run ```bash main_postprocess.sh```. This creates a file ```main_postprocess_to_exec.lst```
4) Run ```bash main_postprocess_to_exec.lst``` which will create the files in ```./postprocess/``` that are needed for plotting.
5) Run ```bash main_plotsimulations.sh``` to create the plot ```topublish1.pdf``` in the directory ```./plots/```
