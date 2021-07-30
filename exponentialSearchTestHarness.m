%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:        Exponential Search Test Harness
% Author:       Samir Habibi (sid1819363)
% Rev. Date:    11/05/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; % Delete all variables.
close all; % Close all windows.
clc; % Clear command window.

maxArraySize = 1024;

for N = 1:maxArraySize

    array = 1:N;

    for searchTarget = 1:N
        [comparisons(searchTarget)] = ...
            exponentialSearch(array, searchTarget);
    end % end for

    best_comparisons(N) = min(comparisons);
    average_comparisons(N) = mean(comparisons);
    worst_comparisons(N) = max(comparisons);

    clear comparisons;

end % end for

figure;

% Plot Observed

plot(1:maxArraySize, best_comparisons,'g','LineWidth',3);hold on;
plot(1:maxArraySize, average_comparisons,'y','LineWidth',3);
plot(1:maxArraySize, worst_comparisons,'r','LineWidth',3);

% Plot Expected

plot(1:maxArraySize, linspace(1,1,maxArraySize),...
    'k:', 'LineWidth', 1); % best
plot(1:maxArraySize, (((log2(1:maxArraySize)-1)) .* 2),...
    'k--','LineWidth', 1); % average
plot(1:maxArraySize, floor(log2(1:maxArraySize) .* 2 + 1),...
    'k-', 'LineWidth', 1); % worst

% Annotate Chart

legend('O best','O average','O worst','E best','E average','E worst');
xlabel('Array Length (N)','FontSize',14)
ylabel('Comparisons', 'FontSize', 14);
titleString = sprintf('%s\n%s', ...
    'Exponential Search', 'Colours: Observed (O), Black/Dotted: Expected (E)');
title(titleString,'FontSize', 14);
xlim([0 maxArraySize]);
ylim([0 max(worst_comparisons)]);
axis square;

% Store High-resolution Image for Report
 
print -f1 -r300 -dbmp exponentialSearchSuccesful.bmp