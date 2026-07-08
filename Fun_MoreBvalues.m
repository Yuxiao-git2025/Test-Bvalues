function [bKMS,dbKMS1,dbKMS2,bmle,dbmle,bmleunbias,dbmleunbias,...
    bbinned,dbbinned,bplus,dbplus1,dbplus2,bls,als,dbls]=Fun_MoreBvalues(mag0,Mmin,dM)

[bKMS,KMSm,KMSs,KMS0]=cal_bvalue_KMS(mag0,20); % (1)
dbKMS1=prctile(KMSm,5);
dbKMS2=prctile(KMSm,95); % approximate confidence
[bmle,dbmle]=cal_bvalue(mag0,Mmin,dM);      % (2)
[bmleunbias,dbmleunbias]=cal_bvalue_unbiased(mag0,Mmin,0.0); % (3)
[bbinned,dbbinned]=cal_bvalue_Binned(mag0,Mmin,dM);      % (4)
% [bplus,dbplus]=cal_bvalue_Positive(mag0,0.2,2000);     % (5)
[bplus,dbplus1,dbplus2]=cal_bvalue_Positive2(mag0,dM,'dep','pos','trim'); % (5)
[bls,als,dbls]=cal_blvalue_weighted(mag0,Mmin,dM,ceil(max(mag0)),0,0.95);  % (6)
end