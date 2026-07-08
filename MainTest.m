%% ========================================================================
% >> A systhetic sample
rng('shuffle');
Nsamples=1000;  % Numbers
b0=0.8;         % Seismic b-value
Mc0=2;          % Cut-off magnitude
dM=0.01;        % Magnitude binned (0.01,...,0.1) 
mag0=-1/b0.*log10(rand(1,Nsamples))+Mc0; % also you can try truncated FMD

% =========================================================================
% >> Calculation
% Approximately equal is sufficient: Mmin=Mc0
[bKMS,dbKMS1,dbKMS2,bmle,dbmle,bmleunbias,dbmleunbias,...
    bbinned,dbbinned,bplus,dbplus1,dbplus2,bls,als,dbls]=Fun_MoreBvalues(mag0,Mc0,dM);

%% ========================================================================
% >> Comparision
figure;
tiledlayout(1,1,"TileSpacing","compact","Padding","compact");
Fun_PlotMoreBvalues(b0,bKMS,dbKMS1,dbKMS2,bmle,dbmle,bmleunbias,dbmleunbias,...
    bbinned,dbbinned,bplus,dbplus1,dbplus2,bls,als,dbls);
title(sprintf('Nsample=%d',Nsamples));
fprintf('# Total %d events\n',Nsamples);
fprintf('# b0=%.1f, Mc=%.1f\n',b0,Mc0);

