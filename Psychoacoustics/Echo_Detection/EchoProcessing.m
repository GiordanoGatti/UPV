clear all
close all
clc

%% Load Data
initials = ["ACR","GG","TBR","AP","AR","FP","HA","JN","KM","LKH","MA","PFOM","SCS","DH","KrM","MU"];;
aux_names = 0;
for ini=initials
    aux_names = aux_names+1;
    load('1B_WAVES_'+ini+'.mat');
    Data(:,aux_names,:) = data; 
    clear data
end

%% Plot detection 
for l=1:length(freqs)
    figure()
    hold on
    for k=1:length(initials)
        plot(delay_set, squeeze(Data(:,k,l)),"- .", LineWidth=2, MarkerSize=15)
    end
    xlim([delay_set(1),delay_set(end)])
    xlabel("Delay")
    ylabel("Detection")
    legend(initials)
    title("Frequency: "+freqs(l))
    fontsize(20,"points")
    grid on
end

%% Plot Average detection
for l=1:length(freqs)
    figure()
    hold on
    plot(delay_set, mean(squeeze(Data(:,:,l)),2),"- .", LineWidth=2, MarkerSize=15)
    xlim([delay_set(1),delay_set(end)])
    xlabel("Delay")
    ylabel("Average Detection")
    title("Frequency: "+freqs(l))
    fontsize(20,"points")
    grid on
end

%% Fit Psychometric curve
x = delay_set;
n = zeros(1,length(x))+length(initials);
for m=1:length(freqs)
    y = sum(squeeze(Data(:,:,m))');
    dt50(m) = fit_nlm(x',n',y',(10^5));
    title("Frequency: "+freqs(m))
    display("Frequency: "+freqs(m))
    display("Threshold delay for echo detection (∆t50): "+dt50(m))
    display("Minimum distance in front of a wall that is required to perceive echo (c=341m/s): "+dt50(m)*341)
end

%% Frequency analysis
figure()
hold on
plot(freqs, dt50,"- .", LineWidth=2, MarkerSize=15)
xlim([freqs(1),freqs(end)])
xlabel("Frequency")
ylabel("∆t50 [s]")
%title("Delay: "+delay_set(n))
fontsize(20,"points")
grid on

