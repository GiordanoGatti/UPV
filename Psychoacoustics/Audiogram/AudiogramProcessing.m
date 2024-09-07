clear all 
close all
clc

%% Load data
initials = ["ACR","GG","TBR","AP","AR","FP","HA","JN","KM","LKH","MA","PFOM","SS","DH","KrM"];
aux_names = 0;
for ini=initials
    aux_names = aux_names+1;
    load('1A_WAVES_'+ini+'.mat');
    Data(1,aux_names,:) = results(:,1); 
    Data(2,aux_names,:) = results(:,2); 
    Data(3,aux_names,:) = results(:,4);
    clear results
end

avg_nomask = mean(squeeze(Data(1,:,:)));

%% Plot nomask without shift 
[ref, fref] = iso226(0);

figure()
hold on
for plt=1:length(initials)
    semilogx(freq_set, squeeze(Data(1,plt,:)), "- .", MarkerSize=12)
end
semilogx(fref,ref, "- .", LineWidth=2, MarkerSize=12)
legend([initials "ISO226"])
title("No Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on

figure()
hold on
semilogx(freq_set, avg_nomask, "- .", LineWidth=2, MarkerSize=12)
semilogx(fref,ref, "- .", LineWidth=2, MarkerSize=12)
legend(["Average" "ISO226"])
title("No Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on

% Shifted plots
ref1k_index = find(fref==1000);
index1k = find(freq_set==1000);
for ind=1:length(initials)
    shifts_nomask(ind) = ref(ref1k_index)-Data(1,ind,index1k);
end
shifts_nomask = [shifts_nomask (ref(ref1k_index)-avg_nomask(index1k))];

figure()
hold on
for plt=1:length(initials)
    semilogx(freq_set, squeeze(Data(1,plt,:))+shifts_nomask(plt), "- .", MarkerSize=12)
end
semilogx(fref,ref, "- .", LineWidth=2, MarkerSize=12)
legend([initials "ISO226"])
title("No Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on

figure()
hold on
semilogx(freq_set, avg_nomask+shifts_nomask(end), "- .", LineWidth=2, MarkerSize=12)
semilogx(fref,ref, "- .", LineWidth=2, MarkerSize=12)
legend(["Average" "ISO226"])
title("No Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on

%% 400 mask
for ind=1:length(initials)
    shifts_400mask(ind) = ref(ref1k_index)-Data(2,ind,index1k);
    shifts_2kmask(ind) = ref(ref1k_index)-Data(3,ind,index1k);
end
shifted400 = squeeze(Data(2,:,:))+shifts_400mask';
shifted2k = squeeze(Data(3,:,:))+shifts_2kmask';
avg400mask = mean(shifted400);
avg2kmask = mean(shifted2k);

figure()
hold on
semilogx(freq_set, avg400mask, "- .", LineWidth=2, MarkerSize=12)
semilogx(freq_set,avg_nomask+shifts_nomask(end), "- .", LineWidth=2, MarkerSize=12)
legend(["Average (400 Hz Mask)" "Average (no mask)"])
title("400 Hz Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on

figure()
hold on
semilogx(freq_set, avg400mask, "- .", LineWidth=2, MarkerSize=12)
semilogx(fref,ref, "- .", LineWidth=2, MarkerSize=12)
legend(["Average" "ISO226"])
title("400 Hz Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on

figure()
hold on
semilogx(freq_set, avg2kmask, "- .", LineWidth=2, MarkerSize=12)
semilogx(freq_set, avg_nomask+shifts_nomask(end), "- .", LineWidth=2, MarkerSize=12)
legend(["Average" "ISO226"])
title("2 kHz Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on

figure()
hold on
semilogx(freq_set, avg2kmask, "- .", LineWidth=2, MarkerSize=12)
semilogx(fref,ref, "- .", LineWidth=2, MarkerSize=12)
legend(["Average (2 kHz Mask)" "Average (no mask)"])
title("2 kHz Mask")
xlim([30,16000])
xlabel("Frequency [Hz]")
ylabel("SPL [dB]")
fontsize(20,"points")
grid on





