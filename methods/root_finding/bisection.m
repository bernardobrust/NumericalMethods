function [root, iter, err] = bisection(f, a, b, tol = 1e-6, max_iter = 128)
  % BISECTION Finds a root of f(x) = 0 in the interval [a, b].
  %   [root, iter, err] = bisection(f, a, b, tol, max_iter)
  %   Default tol = 1e-6, default max_iter = 128.

  if (nargin < 3 || nargin > 5)
    error ("bisection (function, lower_bound, upper_bound, tolerance?, max_iter?)");
  endif

  % 1. Intermediate Value Theorem validation (Bolzano's Theorem)
  fa = f(a);
  fb = f(b);

  % The theorem states that fa * fb < 0 for a root to exist, this is ineficient
  % We can instead use sign(fa) != sign(fb), which avoids a multiplication
  if sign(fa) == sign(fb)
    error("bisection:invalidInterval", ...
    "Function must have opposite signs at endpoints: f(a)=%.6f, f(b)=%.6f", fa, fb);
  endif

  % 2. Iterative loop
  for iter = 1:max_iter
    % Half-width interval calculation
    err = (b - a) / 2;
    root = a + err;
    fmid = f(root);

    % Check convergence criteria
    if err < tol || fmid == 0
      return;
    endif

    % Narrow down search interval using sign multiplication
    if sign(fmid) == sign(fa)
      a = root;
      fa = fmid;
    else
      b = root;
    endif
  endfor

  warning("bisection:maxIterReached", "Reached maximum iterations without converging.");
endfunction

% Testing:
%!test "Basic Test"
%! f = @(x) x.^2 - cos(x);
%! expected = -0.82413231;
%! [root, iterations, final_err] = bisection(f, -1, 0, 1e-8);
%! assert (root, expected, 1e-7);
%! assert(final_err <= 1e-8);

%!test "Another basic test"
%! f = @(x) x.^2 - cos(x);
%! expected = 0.82413231;
%! [root, iterations, final_err] = bisection(f, 0, 1, 1e-8);
%! assert (root, expected, 1e-7);
%! assert(final_err <= 1e-8);

% Running examples:
## Exampåe 1:
## f = @(x) x.^2 - cos(x)
##
## Run bisection between a = -1 and b = 0
## [root, iterations, final_err] = bisection(f, -1, 0, 1e-8);
##
## Print formatted results
## printf("Root found: %.8f\n", root);
## printf("Iterations: %d\n", iterations);
## printf("Estimated error: %.2e\n", final_err);
##
## Example 2:
## [root, iterations, final_err] = bisection(f, 0, 10, 1e-10);
##
## printf("Root found: %.8f\n", root);
## printf("Iterations: %d\n", iterations);
## printf("Estimated error: %.2e\n", final_err);

% Arbitrary function:
expr = input("Enter f(x): ", "s");
f = eval(["@(x) " expr]);

interval = input("Enter [a, b]: ");
[root, iterations, final_err] = bisection(f, interval(1), interval(2));

printf("Root found: %.8f\n", root);
printf("Iterations: %d\n", iterations);
printf("Estimated error: %.2e\n", final_err);
