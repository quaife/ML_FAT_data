#ML_FAT_data

Sample data for results generated in the paper titled "Data-driven fire modeling: Learning first arrival times and model parameters with neural networks"

## Description

This repository contains fire spread simulations generated with a
physics-driven and data-driven model. The data-driven model is
trained with a TensorFlow applied to data generated with the
physics-driven model described in the paper titled "A simple model for
wildland fire vortex–sink interactions". The data are separated into
* A forward problem (forward_problem directory) that predicts fire
  spread behavior based on fuel and atmospheric properties.
* An inverse problem (inverese_problem directory) that predicts
  fuel and atmospheric properties based on fire spread behavior.

Three different networks (CNN, Unet, and FC-Unet) are considered for the forward problem, and one network (CNN-FC) is considered for the inverse problem.

## Getting Started

### Using MATLAB

The data and code in this repository is meant to be run in MATLAB. For
those who do not have access to a MATLAB license, please visit the
MATLAB Online (basic) resource provided by Mathworks. This is a free
version of MATLAB available to run in your browser for a set number of
hours per month.

### Executing the Program

Data of fire spread behavior are saved as .mat files. To visualize the
output of each of the models, run the corresponding matlab file. They
are
* CNN_forward, Unet_forward, and FCUnet_forward for the forward problem.
* CNNFC_backward.m for the inverse problem.
The MATLAB scripts will load the appropriate .mat files, create plots
of the physics-driven and data-driven networks, and report errors.

Additional MATLAB files are available to generate each of the figures in
the previously mentioned publication. 

## Author

Xin Tong and Bryan Quaife (bquaife@fsu.edu)

## Correspondence

Bryan Quaife (bquaife@fsu.edu)

## License and Citation

If this code is used in your research or publications, please cite the
following reference to acknowledge the original work:

Tong, X., & Quaife, B. (2025). Data-driven fire modeling: Learning first
arrival times and model parameters with neural networks. Environmental
Modelling & Software, 183, 106253.

This project is licensed under the MIT License. See the [LICENSE](./
LICENSE.txt) file for the full text.
