% Decision Variables
x1 = optimvar('x1','LowerBound',0,'UpperBound',Inf);
x2 = optimvar ('x2','LowerBound',0,'UpperBound',Inf);

%Objective Function
prob = optimproblem('Objective', 200*x1 + 150*x2, 'ObjectiveSense', 'max');

%Constraints
%glazed fruits
prob.Constraints.c1=  360*x1 +  240*x2 <=35000;
%raisins
prob.Constraints.c2=  240*x1 +  240*x2 <=40000;
%all-purpose flour
prob.Constraints.c3=  720*x1 +  720*x2 <=85000;
%brown sugar
prob.Constraints.c4=  480*x1 +  480*x2 <=55000;
%baking powder
prob.Constraints.c5=  4.26*x1 +  4.26*x2 <=800;
%cinnamon
prob.Constraints.c6=  4.26*x1 +  4.26*x2 <=800;
%all-spice
prob.Constraints.c7=  2.13*x1 +  2.13*x2 <=600;
%salt
prob.Constraints.c8=  4.26*x1 +  4.26*x2 <=700;
%molassess
prob.Constraints.c9=  120*x1 +  120*x2 <=18000;
%water
prob.Constraints.c10=  480*x1 +  480*x2 <=50000;
%mace
prob.Constraints.c11=  4.26*x1 +  4.26*x2 <=700;
%butter
prob.Constraints.c12=  240*x1 +  240*x2 <=30000;
%walnuts
prob.Constraints.c13=  240*x1 +  240*x2 <=32000;
%cherry brandy
prob.Constraints.c14=  125*x1 +  0*x2 <=18000;
%vanilla
prob.Constraints.c15=  4.26*x1 +  0*x2 <=700;
%nutmeg
prob.Constraints.c16=  0*x1 +  2.13*x2 <=300;
%pineapple juice
prob.Constraints.c17=  0*x1 +  120*x2 <=11000;
%market demand xmas
prob.Constraints.c18=  x1 >= 35;
%market demand xmas
prob.Constraints.c19=  x2 >=31;
%% 

%Problem Structure
problem=prob2struct(prob);
prob.Variables

% Solve the ILP problem
options = optimoptions('linprog','Display','iter');
[sol, fval, exitflag, output, lamdbda] = linprog(problem);

% Display results
disp('Optimal Solution:')
disp(sol)
disp(['Maximum Revenue: ', num2str(fval)])

lamdbda.ineqlin

