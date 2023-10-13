function [x,fval,exitflag,output] = MyOptim(x0)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimset;
%% Modify options setting
options = optimset(options,'Display', 'off');
options = optimset(options,'PlotFcns', {  @optimplotx @optimplotfval });
[x,fval,exitflag,output] = ...
fminsearch(@(x)(x(1)-pi)^2+(x(2)-10)^2+(x(3)+2.7)^2,x0,options);
