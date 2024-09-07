%% Harmonica Records
clear all
close all
clc
% column 1: Nominal frequencies
% column 2: Real frequencies
% column 3: Amplitudes

% ex1_C4 = [261.2618	261.2618	1;
% 522.5236	522.7215	0.2947;
% 783.7854	783.7854	0.0707;
% 1.0450e+03	0	0;
% 1.3063e+03	1.3063e+03	0.0515;
% 1.5676e+03	0	0;
% 1.8288e+03	1.8292e+03	0.0384;
% 2.0901e+03	2.0905e+03	0.0263];

in1_D4 = [287.3101	287.3101	1,
574.6202	574.4519	0.1236,
861.9304	861.9304	0.1192,
1.1492e+03	1.1491e+03	0.0429,
1.4366e+03	1.4364e+03	0.0588,
1.7239e+03	1.7239e+03	0.0341,
2.0112e+03	2.0110e+03	0.0592,
2.2985e+03	2.2973e+03	0.0681];

ex2_F4 =[287.3101	287.3101	1;
574.6202	574.4519	0.1236;
861.9304	861.9304	0.1192;
1.1492e+03	1.1491e+03	0.0429;
1.4366e+03	1.4364e+03	0.0588;
1.7239e+03	1.7239e+03	0.0341;
2.0112e+03	2.0110e+03	0.0592;
2.2985e+03	2.2973e+03	0.0681];

% in2_G4=[382.9119	382.9119	1;
% 765.8237	0	0;
% 1.1487e+03	1.1486e+03	0.2513;
% 1.5316e+03	1.5315e+03	0.0834;
% 1.9146e+03	1.9146e+03	0.0246;
% 2.2975e+03	2.2975e+03	0.1154;
% 2.6804e+03	2.6802e+03	0.1796;
% 3.0633e+03	3.0631e+03	0.0252];

ex3_G4s=[395.1987	395.1987	1;
790.3974	790.2291	0.0948;
1.1856e+03	1.1854e+03	0.3038;
1.5808e+03	1.5808e+03	0.2085;
1.9760e+03	1.9753e+03	0.0452;
2.3712e+03	2.3714e+03	0.3878;
2.7664e+03	2.7655e+03	0.3114;
3.1616e+03	3.1618e+03	0.1240];

in3_B5=[487.2928	487.2928	1;
974.5856	974.3877	0.2676;
1.4619e+03	1.4619e+03	0.1379;
1.9492e+03	1.9490e+03	0.2684;
2.4365e+03	2.4363e+03	0.4332;
2.9238e+03	2.9234e+03	0.1539;
3.4110e+03	3.4107e+03	0.1685;
3.8983e+03	3.8979e+03	0.0489];

ex4_C5s=[526.8779	526.8779	0.5372;
1.0538e+03	1.0536e+03	0.1823;
1.5806e+03	1.5806e+03	0.1629;
2.1075e+03	2.1077e+03	0.1995;
2.6344e+03	2.6346e+03	0.1990;
3.1613e+03	3.1615e+03	1;
3.6881e+03	3.6883e+03	0.0776;
4.2150e+03	4.2152e+03	0.0564];

in4_D5=[586.4535	586.4535	1;
1.1729e+03	1.1727e+03	0.1932;
1.7594e+03	1.7590e+03	0.0519;
2.3458e+03	2.3452e+03	0.3364;
2.9323e+03	2.9317e+03	0.7440;
3.5187e+03	3.5181e+03	0.4359;
4.1052e+03	4.1040e+03	0.0370;
4.6916e+03	4.6906e+03	0.0688];

ex5_E5=[658.3005	658.3005	0.0872;
1.3166e+03	1.3166e+03	0.1170;
1.9749e+03	1.9751e+03	0.3077;
2.6332e+03	2.6332e+03	0.2610;
3.2915e+03	3.2915e+03	1;
3.9498e+03	3.9494e+03	0.0346;
4.6081e+03	4.6077e+03	0.2337;
5.2664e+03	5.2660e+03	0.0401];

in5_F5=[703.8846	703.8846	0.2770;
1.4078e+03	1.4083e+03	0.0538;
2.1117e+03	2.1128e+03	1;
2.8155e+03	2.8128e+03	0.5103;
3.5194e+03	3.5162e+03	0.1652;
4.2233e+03	4.2191e+03	0.2114;
4.9272e+03	4.9269e+03	0.1206;
5.6311e+03	5.6336e+03	0.1092];

ex6_G5s=[790.1190	790.1190	0.4343;
1.5802e+03	1.5800e+03	0.2140;
2.3704e+03	2.3702e+03	1;
3.1605e+03	3.1599e+03	0.4858;
3.9506e+03	3.9500e+03	0.3311;
4.7407e+03	4.7399e+03	0.1584;
5.5308e+03	5.5298e+03	0.1890;
6.3210e+03	6.3202e+03	0.0515];

in6_A5=[886.5087	886.5087	0.8191;
1.7730e+03	1.7732e+03	0.1797;
2.6595e+03	2.6597e+03	0.5932;
3.5460e+03	3.5464e+03	0.1185;
4.4325e+03	4.4331e+03	1;
5.3191e+03	5.3198e+03	0.1887;
6.2056e+03	6.2064e+03	0.1979;
7.0921e+03	7.0931e+03	0.2638];

ex7_C6=[1.0524e+03	1.0524e+03	0.2465;
2.1047e+03	2.1049e+03	0.1267;
3.1571e+03	3.1573e+03	1;
4.2095e+03	4.2099e+03	0.1571;
5.2619e+03	5.2630e+03	0.0615;
6.3142e+03	6.3154e+03	0.0402;
7.3666e+03	7.3678e+03	0.0779;
8.4190e+03	8.4203e+03	0.0340];

in7_B6=[984.8778	984.8778	0.5866;
1.9698e+03	1.9688e+03	0.3888;
2.9546e+03	2.9546e+03	1;
3.9395e+03	3.9395e+03	0.0955;
4.9244e+03	4.9216e+03	0.0952;
5.9093e+03	5.9093e+03	0.1252;
6.8941e+03	6.8902e+03	0.2060;
7.8790e+03	7.8792e+03	0.0787];

ex8_E6=[1.3164e+03	1.3164e+03	1;
2.6328e+03	2.6298e+03	0.1621;
3.9492e+03	3.9453e+03	0.3631;
5.2656e+03	5.2607e+03	0.0911;
6.5820e+03	6.5759e+03	0.6649;
7.8984e+03	7.8907e+03	0.1583;
9.2148e+03	9.2150e+03	0.1701;
1.0531e+04	1.0521e+04	0.0896];

in8_D6=[1.1816e+03	1.1816e+03	1;
2.3632e+03	2.3634e+03	0.1933;
3.5448e+03	3.5452e+03	0.6833;
4.7265e+03	4.7269e+03	0.2011;
5.9081e+03	5.9089e+03	0.5304;
7.0897e+03	7.0905e+03	0.1470;
8.2713e+03	8.2725e+03	0.2633;
9.4529e+03	9.4543e+03	0.0898];

ex9_G6=[1.5676e+03	1.5676e+03	0.2317;
3.1351e+03	3.1355e+03	0.7655;
4.7027e+03	4.7033e+03	1;
6.2703e+03	6.2705e+03	0.1435;
7.8379e+03	7.8384e+03	0.2972;
9.4054e+03	9.4062e+03	0.1737;
1.0973e+04	1.0976e+04	0.1591;
1.2541e+04	1.2539e+04	0.0449];

in9_F6=[1.4021e+03	1.4021e+03	0.3980;
2.8042e+03	2.8042e+03	0.2059;
4.2063e+03	4.2065e+03	1;
5.6084e+03	5.6088e+03	0.0737;
7.0105e+03	7.0109e+03	0.3692;
8.4126e+03	8.4134e+03	0.1560;
9.8147e+03	9.8155e+03	0.1005;
1.1217e+04	1.1218e+04	0.1468];

H_samples = [ex2_F4, ex3_G4s, ex4_C5s, ex5_E5, ex6_G5s, ex7_C6, ex8_E6, ex9_G6, in1_D4, in3_B5, in4_D5, in5_F5, in6_A5, in7_B6, in8_D6, in9_F6];
f_ex = [ex2_F4(1,1), ex3_G4s(1,1), ex4_C5s(1,1), ex5_E5(1,1), ex6_G5s(1,1), ex7_C6(1,1), ex8_E6(1,1), ex9_G6(1,1)];
f_in = [in1_D4(1,1), in3_B5(1,1), in4_D5(1,1), in5_F5(1,1), in6_A5(1,1), in7_B6(1,1), in8_D6(1,1), in9_F6(1,1)];

%% Centroid
SC=[]
for k=1:3:(length(H_samples))
    SC = [SC centroid(H_samples(:,k:(k+2)))]
end

figure()
hold on
plot(f_ex,SC(1:8),'red .', MarkerSize=40)
plot(f_in,SC(9:end),'blue .',MarkerSize=40)
legend('Exhale', 'Inhale')
grid on
xlabel('Frequency [Hz]')
ylabel('Spectral centroid')
xlim([f_ex(1)-50 f_in(end)+50])

%% Spectral Content of even and odd harmonics
EO = [0 0];
aux = 1;
for k=1:3:(length(H_samples))
    EO(aux,:) = evenodd(H_samples(:,k:(k+2)));
    aux = aux+1;
end

figure()
hold on
plot([f_ex' f_ex'],EO(1:8,:),'red .', MarkerSize=40)
plot([f_in' f_in'],EO(9:end,:),'blue .', MarkerSize=40)
legend('Exhale','', 'Inhale')
grid on
xlabel('Frequency [Hz]')
ylabel('Spectral Content of even and odd harmonics')
xlim([f_ex(1)-50 f_in(end)+50])
ylim([0 1.5])

%% Tristimulus
T = [0 0 0];
aux = 1;
for k=1:3:(length(H_samples))
    T(aux,:) = tristim(H_samples(:,k:(k+2)));
    aux = aux+1;
end

figure()
tri = [0 1];
tri1 = [0 0];
tri2 = [1 0];
hold on
plot(tri, tri1, 'black', LineWidth=3)
plot(tri, tri2, 'black', LineWidth=3)
plot(tri1, tri, 'black', LineWidth=3)

plot(T(1:8,2), T(1:8,3),'red .', MarkerSize=40)
plot(T(9:end,2), T(9:end,3),'blue .',MarkerSize=40)
legend('','','','Exhale', 'Inhale')
grid on
xlabel('T2')
ylabel('T3')
xlim(tri)
ylim(tri)

%% Inharmonicity
harmonics = [1:length(in1_D4(:,1))]

inh=[]
for k=1:3:(length(H_samples))
    inh = [inh inharm(H_samples(:,k:(k+2)))]
end

figure()
hold on
for k=1:length(inh)
    stem(harmonics,inh(:,k),'.', MarkerSize=30)
end
% stem(harmonics,INH_GC,'red .', MarkerSize=20)
% stem(harmonics,INH_GE,'m .', MarkerSize=20)
% stem(harmonics,INH_RC,'blue .', MarkerSize=20)
% stem(harmonics,INH_RE,'green .', MarkerSize=20)
legend('exhale_F4', 'exhale_G4s', 'exhale_C5s', 'exhale_E5', 'exhale_G5s', 'exhale_C6', 'exhale_E6', 'exhale_G6', 'inhale_D4', 'inhale_B5', 'inhale_D5', 'inhale_F5', 'inhale_A5', 'inhale_B6', 'inhale_D6', 'inhale_F6')
grid on
fontsize(gca, 20, 'points')
xlabel('Harmonics')
ylabel('Inharmonicity')

%% Functions

% Spectral Centroid
function B = centroid(input)
n=[1:length(input(:,1))]';
B = sum(n.*input(:,3))./sum(input(:,3));
end

% Spectral Content of even and odd harmonics
function [even odd]=evenodd(input)
even=sqrt(sum(input(2:2:end,3).^2)/sum(input(:,3).^2));
odd=sqrt(sum(input(1:2:end,3).^2)/sum(input(:,3).^2));
end

% Tristimulus
function tri=tristim(input)
T1=(input(1,3).^2)/sum(input(:,3).^2);
T2=sum(input(2:4,3).^2)/sum(input(:,3).^2);
T3=sum(input(5:end,3).^2)/sum(input(:,3).^2);
tri = [T1 T2 T3]
end

% Inharmonicity
function INH = inharm(input)
n=[1:length(input(:,1))]';
fn= input(:,2);
f1=input(1,2);
deltaf = fn-n.*f1;
fc=f1.*(1+(sum(input(:,3).*deltaf./(n.*f1))./sum(input(:,3))));
INH=(fn-(n.*fc))./(n.*f1);
end