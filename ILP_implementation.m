% Define Decision Variables
x1 = optimvar('x1','Type','integer', 'LowerBound',0, 'UpperBound', Inf);
x2 = optimvar('x2','Type','integer','LowerBound',0, 'UpperBound', Inf);

% Objective Function (Maximize Profit)
prob = optimproblem('Objective', 750*x1 + 650   *x2, 'ObjectiveSense', 'maximize');

% Constraints
prob.Constraints.c1  =  3600*x1 +  650*x2 <= 350000;  % glazed fruits
prob.Constraints.c2  =  200*x1 +  240*x2 <= 40000;  % raisins
prob.Constraints.c3  =  720*x1 +  720*x2 <= 850000;  % all-purpose flour
prob.Constraints.c4  =  480*x1 +  480*x2 <= 550000;  % brown sugar
prob.Constraints.c5  =  4.26*x1 +  4.26*x2 <= 800;   % baking powder
prob.Constraints.c6  =  4.26*x1 +  4.26*x2 <= 800;   % cinnamon
prob.Constraints.c7  =  2.13*x1 +  2.13*x2 <= 600;   % all-spice
prob.Constraints.c8  =  4.26*x1 +  4.26*x2 <= 700;   % salt
prob.Constraints.c9  =  120*x1 +  120*x2 <= 180000;  % molasses
prob.Constraints.c10 =  480*x1 +  480*x2 <= 500000;  % water
prob.Constraints.c11 =  4.26*x1 +  4.26*x2 <= 700;   % mace
prob.Constraints.c12 =  240*x1 +  240*x2 <= 30000;  % butter
prob.Constraints.c13 =  240*x1 +  240*x2 <= 32000;  % walnuts
prob.Constraints.c14 =  125*x1 +  0*x2 <= 18000;    % cherry brandy
prob.Constraints.c15 =  4.26*x1 +  0*x2 <= 700;     % vanilla
prob.Constraints.c16 =  0*x1 +  2.13*x2 <= 300;     % nutmeg
prob.Constraints.c17 =  0*x1 +  120*x2 <= 11000;    % pineapple juice


prob.Constraints.c18 =  x1 >= 80;                   % market demand xmas
prob.Constraints.c19 =  x2 >= 45;                   % market demand xmas

% Convert problem to solver form
problem = prob2struct(prob);

% Solve the ILP problem
options = optimoptions('intlinprog','Display','iter');
[sol, fval, exitflag, output] = intlinprog(problem.f, 1:length(problem.f), problem.Aineq, problem.bineq, [], [], problem.lb, problem.ub, options);

% Display results
disp('Optimal Solution:')
disp(sol)
disp(['Maximum Profit: ', num2str(fval)])
