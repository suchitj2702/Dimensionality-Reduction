function [X, lambda] = eigenvalue_vector(A)
    s = size(A);
    % creating the identity matrix
    I = eye(length(A));
    
    syms x
    % equation to be solved for compute eigenvalues
    eq1 = det(A - I*x) == 0;
    
    % solving the equation wrt x to get the eigenvalues
    eigval = double(solve(eq1, x));
    
    % arranging the eigenvalues in form of a diagnol matrix
    lambda = zeros(length(eigval));
    for i = 1:size(eigval)
        lambda(i, i) = eigval(i);
    end
    
    X = zeros(s);
    
    % computing eigenvectors iteratively from the eigenvalues
    for i = 1:length(A)
        if eigval(i) == 0
            continue;
        end
        % computing the RHS of homogenous eqn to compute eigenvectors
        mat = A - eigval(i)*I;
        % finding the null space of homogenous eqns i.e. the requied eigenvectors 
        X(:, i) = null(mat);
    end
end