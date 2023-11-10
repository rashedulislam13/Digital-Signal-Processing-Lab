

%%%%%%%%%%%%%    FIR   %%%%%%%%%%%%%%%%%%%

% Low pass Filter:
% Suppose our target is to pass all frequencies below 1200 Hz
fs = 8000;  % sampling frequency
n = 50;     % order of the filter
w = 1200 / (fs/2);

b = fir1(n, w, 'low');  % Zeros of the filter
freqz(b, 1, 128, fs);    % Magnitude and Phase Plot of the filter

figure;
[h, w] = freqz(b, 1, 128, fs);
plot(w, abs(h));  % Normalized Magnitude Plot
grid on;

figure;
zplane(b, 1);



% High Pass Filter:
% Suppose our target is to pass all frequencies above 1200 Hz
fs = 8000;  % sampling frequency
n = 50;     % order of the filter
w = 1200 / (fs/2);

b = fir1(n, w, 'high');  % Zeros of the filter
freqz(b, 1, 128, fs);    % Magnitude and Phase Plot of the filter

figure;
[h, w] = freqz(b, 1, 128, fs);
plot(w, abs(h));  % Normalized Magnitude Plot
grid on;

figure;
zplane(b, 1);



%Band Pass Filter:
fs=8000; 
n=40;
b=fir1(n,[1200/4000 1800/4000],'bandpass'); 
freqz(b,1,128,8000)
figure(2)
[h,w]=freqz(b,1,128,8000);
plot(w,abs(h)); % Normalized Magnitude Plot
grid on;
figure(3) 
zplane(b,1);


%Band Stop Filter:
fs=8000;
15
n=40;
b=fir1(n,[1200/4000 2800/4000],'stop');
freqz(b,1,128,8000)
figure(2)
[h,w]=freqz(b,1,128,8000);
plot(w,abs(h)); % Normalized Magnitude Plot
grid on;
figure(3) 
zplane(b,1);


%Notch Filter:
fs=8000; 
n=40;
b=fir1(n,[1500/4000 1550/4000],'stop'); 
freqz(b,1,128,8000)
figure(2) 
[h,w]=freqz(b,1,128,8000);
plot(w,abs(h)); % Normalized Magnitude Plot
grid on;
figure(3) 
zplane(b,1);



%Multiband Filter: 
n=50;
w=[0.2 0.4 0.6]; 
b=fir1(n,w); 
freqz(b,1,128,8000)
figure(2) 
[h,w]=freqz(b,1,128,8000);
plot(w,abs(h)); % Normalized Magnitude Plot
grid on;
figure(3)
zplane(b,1);






%%%%%%%%%   IIR   %%%%%%%%%%%%%%%%%%%%%%%%%

%Low Pass Filter:
%Suppose our target is to design a filter to pass all frequencies below 1200 Hz with pass 
% band %ripples = 1 dB and minimum stop band attenuation of 50 dB at 1500 Hz. The sampling 
%frequency for the filter is 8000 Hz;

fs=8000;
[n,w]=buttord(1200/4000,1500/4000,1,50); % finding the order of the filter
[b,a]=butter(n,w); % finding zeros and poles for filter
figure(1) 
freqz(b,a,512,8000); 
figure(2)
[h,q] = freqz(b,a,512,8000);
plot(q,abs(h)); % Normalized Magnitude plot grid
figure(3) 
f=1200:2:1500;
freqz(b,a,f,8000) % plotting the Transition band figure(4)
zplane(b,a) % pole zero constellation diagram


 
%High Pass Filter:
%We will consider same filter but our target now is to pass all frequencies above 1200 Hz;
[n,w]=buttord(1200/5000,1500/5000,1,50);
[b,a]=butter(n,w,'high'); 
figure(1) 
freqz(b,a,512,10000); 
figure(2)
[h,q] = freqz(b,a,512,8000);
plot(q,abs(h)); % Normalized Magnitude plot grid
figure(3) 
f=1200:2:1500; 
freqz(b,a,f,10000) 
figure(4) 
zplane(b,a);



%Band Pass Filter:
%with pass band ripples = 1 dB and minimum stop band attenuation of 50 dB. The
%sampling frequency for the filter is 8000 Hz;
[n,w]=buttord([1200/4000,2800/4000],[400/4000, 3200/4000],1,50);
[b,a]=butter(n,w,'bandpass'); 
figure(1) 
freqz(b,a,128,8000)
figure(2)
[h,w]=freqz(b,a,128,8000);
plot(w,abs(h))
grid on;
figure(3) 
f=600:2:1200;
freqz(b,a,f,8000); % Transition Band figure(4)
f=2800:2:3200;
freqz(b,a,f,8000); % Transition Band figure(5)
zplane(b,a);



%Band Stop Filter:
[n,w]=buttord([1200/4000,2800/4000],[400/4000, 3200/4000],1,50); 
[b,a]=butter(n,w,'stop');
figure(1) 
freqz(b,a,128,8000) 
[h,w]=freqz(b,a,128,8000);
figure(2)
plot(w,abs(h));
grid on;
figure(3) 
f=600:2:1200;
freqz(b,a,f,8000); % Transition Band figure(4)
f=2800:2:3200;
freqz(b,a,f,8000); % Transition Band figure(5)
zplane(b,a);
