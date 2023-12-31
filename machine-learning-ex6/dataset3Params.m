function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;


% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%steps = [0.01 0.03 0.1 0.3 1 3 10 30];
%err = 1.0;

%for i = 1:length(steps)
%    for j = 1:length(steps)
%        current_C = steps(i);
%        current_sigma = steps(j);

%        model = svmTrain(X, y, current_C, @(x1, x2) gaussianKernel(x1, x2, current_sigma));
%        predictions = svmPredict(model, Xval);

%       current_err = mean(double(predictions ~= yval));
%        if current_err < err
%            C = current_C;
%            sigma = current_sigma;
%            err = current_err;
%        end
%    end
%end

err = 1.0;

list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
for i = 1 : length(list)
    for j = 1 : length(list)
        C1 = list(i);
        sigma1 = list(j);

        model = svmTrain(X, y, C1, @(x1, x2) gaussianKernel(x1, x2, sigma1));
        predictions = svmPredict(model, Xval);

        err1 = mean(double(predictions ~= yval));
        if err1 < err
                C = C1;
                sigma = sigma1;
                err = err1;
        end
    end
end









% =========================================================================

end
