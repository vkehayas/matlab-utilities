function [patchH] = vk_fix_legends(patchH)
%% Remove patch objects from legend when using boundedline

for jj = 1:length(patchH)
    if patchH(jj)~=0
        set(get(get(patchH(jj),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    end
end

end