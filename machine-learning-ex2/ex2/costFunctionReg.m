function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
theta_len = length(theta);
J_reg = (lambda/(2*m))*sum(theta(2:theta_len).^2);
J = ((1/m)*(-y'*log(sigmoid(X*theta))-((1-y')*log(1-sigmoid(X*theta))))) + J_reg;
grad_reg = grad + [zeros(1,1); (lambda/m)*theta(2:theta_len)];
grad = ((1/m)*X'*(sigmoid(X*theta)-y)) + grad_reg;




% =============================================================

end
