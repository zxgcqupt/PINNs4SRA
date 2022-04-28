# A generic physics-informed neural network (PINN)-based framework for reliability assessment of multi-state systems

In this project, we develop a generic physics-informed neural netwowk (PINN)-based framework to tackle the reliability assessment of multi-state systems (MSSs). Towards this goal, we first recast the MSS reliability assessment as a machine learning problem, where two individual loss terms are constructed to approximate the initial MSS condition and the state transitions governed by ordinary differential equations (ODEs) in MSS. To tackle the problem of high imbalance in the magnitudes of back-propagated gradients, we treat each loss term as an individual task and de-conflict these tasks by projecting a task's gradient onto the norm plane of any other task with a conflicting gradient based on the projecting conflicting gradients (PCGrad) method. The performance of the PINN-based framework for MSS reliability assessment is demonstrated in a variety of situations (i.e., time-independent or time-dependent state transitions) with different system scales (i.e., small, medidum). The computational performance of PINN is compared with several state-of-the-art methods listed below:
- Runge-Kutta method
- Monte Carlo Simulations (MCS)
- PINN with PCGrad is compared with the case of PINN without PCGrad
- Analytical solutions, such as Laplace transform and eigenvectors-based methods in the case of MSS with time-independent state transitions. (**Note analytical solutions are only applicable to MSSs with time-independent state transitions.**)

## Getting Started

* The source codes of the three numerical examples are saved in three separate folders: **small_homogeneous_CTMC**, **small_non_homogeneous_CTMC**, and **medium_homogeneous_CTMC**. 
* The source codes of MCS simulations for the three numerical examples are saved in the folder **Monte Carlo Simulation**. 
* The Matlab codes of the Runge-Kutta method are saved in the folder **Solver**
* Note that the two folders **small_homogeneous_CTMC** and **medium_homogeneous_CTMC** correspond to the first and the third numerical example, and the notebook "Analytical_solution_for_...." illustrates the basic steps to perform MSS reliability assessment by using two analytical solutions: eigenvectors-based method and Laplace transform-based approach. 


## Requirements
* Python >= 3.6 (Anaconda3 is recommended)

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the required packages.

```bash
pip install -r requirements.txt
```

Another way is to manually install the following packages in the virtual environment you created.

```
matplotlib==3.5.1
numpy==1.22.2
pandas==1.4.1
seaborn==0.11.2
sympy==1.10.1
tensorflow==2.8.0
tensorflow_gpu==2.7.0
tqdm==4.62.3
```

## Reference
If you find our program useful for your work, we kindly request that you cite the following work. 
```
@article{zhou2022PINN,
  title={A generic physics-informed neural network-based framework for reliability assessment of multi-state systems},
  author={Zhou, Taotao and Zhang, Xiaoge and Droguett, Enrique Lopez and Mosleh, Ali},
  journal={Reliability Engineering & Systems Safety},
  volume={Under Review},
  year={2022},
  publisher={Elsevier}
}
```
