
==GPU nodes==

You can view the hardware specifications for GPU node types on the [[RC Systems | RC Systems Platforms Overview]] page.

===Available modules===

You can see the available CUDA modules by typing <code>module avail cuda</code>. 

There are samples in <code>/shared/ucl/apps/cuda/7.5.18/gnu-4.9.2/NVIDIA_CUDA-7.5_Samples/</code>, which are further documented [http://docs.nvidia.com/cuda/cuda-samples/index.html by NVIDIA here]. In general, you should look at their CUDA docs: http://docs.nvidia.com/cuda/

===Sample jobscripts===

You can see [https://wiki.rc.ucl.ac.uk/wiki/Legion_Scripts#GPU_job_script_example_.28experimental.29 sample jobscripts here]. 

Use this in your script to request up to 2 GPUs.
<code>
 #$ -l gpu=2
</code>

Load GCC and the relevant CUDA module.
<code>
 module unload compilers mpi
 module load compilers/gnu/4.9.2
 module load cuda/7.5.18/gnu-4.9.2
</code>

===Running the sample code===

To get started, here's how you would compile and run one of the cuda/5.0 samples interactively on a user test node using a GPU.

1. Load the cuda module
<code>
 module unload compilers mpi
 module load compilers/gnu/4.9.2
 module load cuda/7.5.18/gnu-4.9.2
</code>

2. Copy the samples directory to somewhere in your home (or to Scratch if you're going to want a job to write anything in the same directory).
<code>
 cp -r /shared/ucl/apps/cuda/7.5.18/gnu-4.9.2/NVIDIA_CUDA-7.5_Samples/ ~/cuda
</code>

3. Choose an example: eigenvalues in this case, and build using the provided makefile - if you have a look at it you can see it is using nvcc and g++. 
<code>
 cd NVIDIA_CUDA-7.5_Samples/6_Advanced/eigenvalues/
 make
</code>

4. Request an interactive user test node with a GPU, load the cuda module on the node and run the program.
<code>
 qrsh -l mem=512M,h_rt=0:30:0,gpu=1
 module unload compilers mpi
 module load compilers/gnu/4.9.2
 module load cuda/7.5.18
 cd ~/cuda/NVIDIA_CUDA-7.5_Samples/6_Advanced/eigenvalues/
 ./eigenvalues
</code>

5. Your output should look something like this:
<code>
 Starting eigenvalues
 GPU Device 0: "Tesla M2070" with compute capability 2.0

 Matrix size: 2048 x 2048 
 Precision: 0.000010
 Iterations to be timed: 100
 Result filename: 'eigenvalues.dat'
 Gerschgorin interval: -2.894310 / 2.923303
 Average time step 1: 26.739325 ms
 Average time step 2, one intervals: 9.031162 ms
 Average time step 2, mult intervals: 0.004330 ms
 Average time TOTAL: 35.806992 ms
 Test Succeeded!
</code>


===Using MPI and GPUs===

It is possible to run MPI programs that use GPUs but only within a single node, so you can request up to 2 GPUs and 12 CPUs.
