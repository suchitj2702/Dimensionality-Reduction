## Dimensionality Reduction using UV Decomposition and SV Decomposition

This is a demonstration of how a matrix can be decomposed into matrices of smaller dimensions.

UV Decomposition features iteratively updating elements of the decomposed matrices using gradient descent. UVD allows us to predict values of unknown spaces if the decomposed matrix is sparse.

SVD features eigen-decomposition using eigenvalues and eigenvectors. Dimension can be reduced by eliminating the least significant eigenvalues.

## UV Decomposition -
### Running the demo
* Give the following command in the MATLAB command terminal
  ```MATLAB
  uvmain.m
  ```
* Enter the sparse matrix to be decomposed.
* Enter the internal dimension for decomposition

### Result
* The decomposed matrices U and V are displayed
* Also the estimated P matrix(P = U x V) is shown

### Limitations/Assumptions
Termination of the process will take place when the difference in RMSE between M(original) and P(estimated) for the current iteration and the last iteration is below a threshold(currently set to 0.01), because it is assumed that if the RMSE is not changing much, it means that we have reached a saturation point. In some cases this assumption leads to termination at a stage when the matrix has not been accurately decomposed.

## Singular Value Decomposition(SVD)
### Computing U, V and epsilon
* V and Epsilon is computed by the function eigenvalue_vector.m, which returns the eigenvalues and eigenvectors of any given matrix.
* U is then computed using the relation U = M x inv(Epsilon x V')

### Running the demo
* Give the following command in the MATLAB command terminal
  ```MATLAB
  svdmain.m
  ```
* Enter the matrix to be decomposed
### Result
* Matrices U, Epsilon and V respectively
* Estimated M from the relation M_estimate = U x Epsilon x V';
