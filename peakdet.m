function [amplitude, latency] = peakdet(signal, nstd, max_or_min, amp_thresh)
%% PEAKDET Simple peak detection based on the derivatives method
%
% Given signal vector "signal" either maximum peaks (max_or_min = 'max') or 
% minimum peaks (max_or_min = 'min') will be returned. Whether thresholding is 
% applied is controled by 'amp_thresh' ('on', 'off'). If amplitude thresholding 
% is 'on', a threshold in standard deviation units larger than 0 needs to be 
% provided in 'nstd', otherwise can be left empty (i.e. []). Both the amplitude 
% of the signal ('amplitude') and its time-stamp ('latency') are returned as 
% output. The function provides a very simple algorithm for peak detection based
% on the derivatives method. It is very fast as it is fully vectorized, and 
% works best when the peaks are interspersed with relatively low-amplitude 
% gaussian noise.

der1 = diff(signal,1);
prod1 = der1(1:end-1).*der1(2:end);
fzeros = find(prod1<0)+1;
der2 = diff(signal,2);

switch max_or_min
  case 'max'
    maxs = fzeros(der2(fzeros-1)<0);
    if strcmp(amp_thresh,'on')
      stamps = maxs(signal(maxs)> (mean(signal) + nstd*std(signal)));
    else stamps = maxs;
    end
  case 'min'
    mins = fzeros(der2(fzeros-1)>0);
    if strcmp(amp_thresh,'on')
      stamps = mins(signal(mins)< (mean(signal) - nstd*std(signal)));
    else stamps = mins;
    end
end

latency = stamps;
amplitude = signal(latency);

end