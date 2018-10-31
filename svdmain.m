clear all;
close all;
%%
prompt = 'Enter the matrix to decompose: ';
M = input(prompt);

% Uncomment this to test the without having to enter a matrix explicitely 
% M = [1 1 1 0 0; 3 3 3 0 0; 4 4 4 0 0; 5 5 5 0 0;2 0 0 4 4; 0 1 0 5 5; 0 0 0 2 2];

% computing the eigenvalues and the corresponding eigenvectors for M'*M
% using the custom function
[V, E] = eigenvalue_vector(M'*M);

% computing the value of U from the computed value of V and E
U = M*(pinv(sqrt(E)*V'));

% sorting the eigenvalues in descending order
[e, ind] = sort(diag(E), 'descend');

% elimiating the the zero value eigenvalues and the corresponding
% eigenvectors to get the corresponding ranked values
for i = 1:length(e)
    if e(i) == 0
        continue;
    end
    if i == 1
        e_ranked = e(i);
        ind_ranked = ind(i);
    else
        e_ranked = [e_ranked; e(i)];
        ind_ranked = [ind_ranked; ind(i)];
    end
end
E_ranked = E(ind_ranked, ind_ranked);
V_ranked = V(:,ind_ranked);
U_ranked = U(:,ind_ranked);

% taking the square root of the eigenvalues to compute epsilon
Epsilon = sqrt(E_ranked);

% computing the estimated M
M_new = U_ranked*Epsilon*V_ranked';

fprintf('U -\n');
disp(U_ranked);

fprintf('Epsilon -\n');
disp(Epsilon)

fprintf('V -\n');
disp(V_ranked);

fprintf('Estimated M -\n');
disp(M_new);