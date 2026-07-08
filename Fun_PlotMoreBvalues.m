function Fun_PlotMoreBvalues(b0,bKMS,dbKMS1,dbKMS2,bmle,dbmle,bmleunbias,dbmleunbias,...
    bbinned,dbbinned,bplus,dbplus1,dbplus2,bls,als,dbls)

nexttile;
hold on;
NumMethods=6;
yline(b0,'LineWidth',3,'Color',[.3 .3 .3],'LineStyle','-.');
errorbar(1:NumMethods,[bls,bmle,bKMS,bmleunbias,bbinned,bplus],[dbls,dbmle,dbKMS1-bKMS,dbmleunbias, ...
    dbbinned,dbplus1],[dbls,dbmle,dbKMS2-bKMS,dbmleunbias,dbbinned,dbplus2],'LineWidth',1.9, ...
    'CapSize',20,'Color',[0.0314    0.7804    0.4314]);
scatter(1:NumMethods,[bls,bmle,bKMS,bmleunbias,bbinned,bplus],300,'Marker','diamond', ...
    'MarkerFaceColor',[.98 .98 .98],'LineWidth',2,'MarkerEdgeColor',[0 0 0]);
ylim([b0-0.2-0.02 b0+0.2+0.02]);
xticks(1:NumMethods);
xlim([0 NumMethods+1]);
yticks(floor(b0)-0.2:0.1:ceil(b0)+0.2);
yticklabels(floor(b0)-0.2:0.1:ceil(b0)+0.2);

Fun_defaultAxes;
xticklabels({'LS','MLE','KMS','unBias','Binned','b+'});
xlabel('Methods');
ylabel('$b$-value','Interpreter','latex');
set(gcf,'position',[300,50,700,600]);

% nexttile([4,3]);
% axis off;
% nexttile([6,3]);
% Minuend=1;
% dM0=0.1;
% [nshow,eshow]=histcounts(mag0,Mc0-Minuend:dM0:max(mag0));
% sumshow=flip(cumsum(flip(nshow)));
% plot(eshow(1:end-1),sumshow,'Marker','square','LineStyle','none', ...
%         'MarkerEdgeColor',[.1 .1 .1],'MarkerSize',16,'LineWidth',1.2, ...
%         'MarkerFaceColor','none');
% xlim([Mc0-Minuend +inf]);
% Fun_defaultAxes;
% xlabel('Mi');
% ax=gca;
% ax.YScale='log';

end