function [h_bar, h_err] = vk_bargraph(q,n,LE,UE,yL,xL,palette)

%% VK_BARGRAPH Produce bar graphs with errorbars from point estimates of groups
%
% USAGE: [h_bar, h_err] = vk_bargraph_v1(q,n,LE,UE,yL,xL,palette)
% where q is the vector of groups' point estimates (e.g. mean, median), n is the
% number of observations per group, LE and UE are the lower and upper
% error estimates, respectively, yL and xL are the title of the Y and X
% Axis, respectively, and palette is the range of colors to be used to
% label groups.

hold on;
textYPosition = floor(ceil((max(UE)+max(q)).*100)./10)./100;

for iGroups = 1:length(q)
    h_bar = bar(iGroups,q(iGroups),'FaceColor',palette{iGroups});
    h_err = errorbar(iGroups,q(iGroups),LE(iGroups),UE(iGroups), 'LineWidth', 2, 'Color', 'k');
    text(iGroups-0.1, textYPosition,['n = ', num2str(n(iGroups))], 'FontSize', 14, 'FontWeight', 'Bold')
end
ylabel(yL,'FontSize', 14, 'FontWeight', 'Bold')
set(gca,'XTick',(1:iGroups),'XTickLabel',xL, 'FontSize', 14, 'FontWeight', 'Bold', 'XLim', [0.5 2.5])