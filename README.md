# microstructure_percolation_sample_simulations
## Required:
- MeteoIO and SNOWPACK (https://code.wsl.ch/snow-models/ or https://github.com/snowpack-model/snowpack)
- gnuplot for plotting
- basic linux tools


## Steps to reproduce:
1) Create directories ```./output/```, ```./plots/``` and ```./postprocess/```
2) Modify the first line in ```run_all.sh``` to point to the ```bin``` path where the SNOWPACK binary is installed
3) Run all the simulations using:
```bash run_all.sh```
4) Run ```bash main_postprocess.sh```. This creates a file ```main_postprocess_to_exec.lst```
5) Run ```bash main_postprocess_to_exec.lst``` which will create the files in ```./postprocess/``` that are needed for plotting.
6) Run ```bash main_plotsimulations.sh``` to create the plots ```topublish1.pdf``` and ```sensitivity_study.pdf``` in the directory ```./plots/```
