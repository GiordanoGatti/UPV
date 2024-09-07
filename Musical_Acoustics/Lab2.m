clear all
close all
clc

%% Recorded C5 an E5
% line 1: Nominal frequencies
% line 2: Amplitudes
% line 3: Real frequencies

R_E=[671.7268 1.3435e+03 2.0152e+03 2.6869e+03 3.3586e+03 4.0304e+03 4.7021e+03 5.3738e+03,
     1.0000 0.0793 0.1160 0.0150 0.0240 0.0106 0.0089 0.0031,
     671.7268 1.3457e+03 2.0190e+03 2.6880e+03 3.3600e+03 4.0317e+03 4.7059e+03 5.3789e+03];

G_E=[656.0074 1.3120e+03 1.9680e+03 2.6240e+03 3.2800e+03 3.9360e+03 4.5921e+03 5.2481e+03,
     1.0000 0.3477 0.6663 0.0880 0.1002 0.0303 0.0773 0.0206,
     656.0074 1.3128e+03 1.9699e+03 2.6272e+03 3.2878e+03 3.9497e+03 4.6124e+03 5.2824e+03];

R_C=[529.4118 1.0588e+03 1.5882e+03 2.1176e+03 2.6471e+03 3.1765e+03 3.7059e+03 4.2353e+03,
     1.0000 0.0182 0.0238 0.0054 0.0212 0.0084 0.0175 0.0122,
     529.4118 1.0595e+03 1.5890e+03 2.1169e+03 2.6491e+03 3.1749e+03 3.7038e+03 4.2331e+03];

G_C=[520.6843 1.0414e+03 1.5621e+03 2.0827e+03 2.6034e+03 3.1241e+03 3.6448e+03 4.1655e+03,
     1.0000 0.0808 0.1067 0.0777 0.0141 0.0649 0.0058 0.0096,
     520.6843 1.0423e+03 1.5635e+03 2.0860e+03 2.6087e+03 3.1325e+03 3.6496e+03 4.1857e+03];

f = [G_C(1,1) G_E(1,1); R_C(1,1) R_E(1,1)]; % [C5 E5 guitar / C5 E5 recorder]Hz

%% Centroid
SC_RE = centroid(R_E);
SC_GE = centroid(G_E);
SC_RC = centroid(R_C);
SC_GC = centroid(G_C);

figure()
hold on
plot(f(1,:),[SC_GC SC_GE],'red .', MarkerSize=40)
plot(f(2,:),[SC_RC SC_RE],'blue .',MarkerSize=40)
legend('Guitar', 'Recorder')
grid on
xlabel('Frequency [Hz]')
ylabel('Spectral centroid')
xlim([f(1,1)-50 f(1,2)+50])

%% Spectral Content of even and odd harmonics
[even_RE odd_RE]=evenodd(R_E);
[even_GE odd_GE]=evenodd(G_E);
[even_RC odd_RC]=evenodd(R_C);
[even_GC odd_GC]=evenodd(G_C);

figure()
hold on
plot(f(1,:),[even_GC even_GE],'red .', MarkerSize=40)
plot(f(2,:),[even_RC even_RE],'blue .',MarkerSize=40)
plot(f(1,:),[odd_GC odd_GE],'m .', MarkerSize=40)
plot(f(2,:),[odd_RC odd_RE],'green .',MarkerSize=40)
legend('Guitar (even)', 'Recorder (even)', 'Guitar (Odd)', 'Recorder (Odd)')
grid on
xlabel('Frequency [Hz]')
ylabel('Spectral Content of even and odd harmonics')
xlim([f(1,1)-50 f(1,2)+50])
ylim([0 1.5])

%% Tristimulus
[T1_RE T2_RE T3_RE]=tristim(R_E);
[T1_GE T2_GE T3_GE]=tristim(G_E);
[T1_RC T2_RC T3_RC]=tristim(R_C);
[T1_GC T2_GC T3_GC]=tristim(G_C);

figure()
tri = [0 1];
tri1 = [0 0];
tri2 = [1 0];
hold on
plot(tri, tri1, 'black', LineWidth=3)
plot(tri, tri2, 'black', LineWidth=3)
plot(tri1, tri, 'black', LineWidth=3)

plot(T2_RE, T3_RE,'red .', MarkerSize=40)
plot(T2_GE, T3_GE,'blue .',MarkerSize=40)
plot(T2_RC, T3_RC,'m .', MarkerSize=40)
plot(T2_GC, T3_GC,'green .',MarkerSize=40)
legend('','','','Recorder E', 'Guitar E', 'Recorder C', 'Guitar C')
grid on
xlabel('T2')
ylabel('T3')
xlim(tri)
ylim(tri)

%% Inharmonicity
harmonics = [1:length(R_E(1,:))];

INH_RE = inharm(R_E);
INH_GE = inharm(G_E);
INH_RC = inharm(R_C);
INH_GC = inharm(G_C);

figure()
hold on
stem(harmonics,INH_GC,'red .', MarkerSize=20)
stem(harmonics,INH_GE,'m .', MarkerSize=20)
stem(harmonics,INH_RC,'blue .', MarkerSize=20)
stem(harmonics,INH_RE,'green .', MarkerSize=20)
legend('Guitar C','Guitar E','Recorder C','Recorder E')
grid on
xlabel('Harmonics')
ylabel('Inharmonicity')
%xlim([f(1)-50 f(2)+50])

%% Functions

% Spectral Centroid
function B = centroid(input)
n=[1:length(input(1,:))];
B = sum(n.*input(2,:))/sum(input(2,:));
end

% Spectral Content of even and odd harmonics
function [even odd]=evenodd(input)
even=sqrt(sum(input(2,2:2:end).^2)/sum(input(2,:).^2));
odd=sqrt(sum(input(2,1:2:end).^2)/sum(input(2,:).^2));
end

% Tristimulus
function [T1 T2 T3]=tristim(input)
T1=(input(2,1).^2)/sum(input(2,:).^2);
T2=sum(input(2,2:4).^2)/sum(input(2,:).^2);
T3=sum(input(2,5:end).^2)/sum(input(2,:).^2);
end

% Inharmonicity
function INH = inharm(input)
n=[1:length(input(1,:))];
fn= input(3,:);
f1=input(3,1);
deltaf = fn-n.*f1;
fc=f1.*(1+(sum(input(2,:).*deltaf./(n.*f1))./sum(input(2,:))));
INH=(fn-(n.*fc))./(n.*f1);
end