fprintf('Design a high-pass filter using the frequency sampling method \n');
fprintf('Enter filter parameters \n');
M = input('Number of samples: '); % Number of samples
Wp = input('Passband cutoff frequency: '); % Passband cutoff frequency
fprintf('Frequency of the sine wave to be filtered \n');
f1 = input('First frequency: ');
f2 = input('Second frequency: ');
f3 = input('Third frequency: ');
fs = 2000; % Sampling frequency
m = 0:M/2; % Sample points
Wm = 2 * pi * m / (M + 1); % Cutoff frequency
mtr = ceil(Wp * (M + 1) / (2 * pi)); % Round the positive part, i.e., ceil(3.5) = 4; ceil(-3.2) = -3;
Ad = Wm >= Wp;
Ad(mtr) = 0.28;
Hd = Ad .* exp(-1j * 0.5 * M * Wm); % Define the frequency domain sampling vector H(k)
Hd = [Hd conj(fliplr(Hd(2:M/2+1)))];
%fliplr to perform the matrix reverse and conj is the conjugate
h = real(ifft(Hd)); % h(n) = IDFT[H(k)]
w = linspace(0, pi, 1000); % Take 1000 points between 0 and pi
H = freqz(h, 1, w); % Plot representing amplitude - frequency of the filter
figure(1)
plot(w/pi, 20 * log10(abs(H))); % Parameters are normalized frequency and amplitude
xlabel('Normalized Frequency'); ylabel('Gain (dB)'); title('High-pass Filter Amplitude Response');
axis([0 1 -50 0]);
figure(2)
subplot(211)
t = 0:1/fs:0.25; % Define the time domain and step
s = sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t) + sin(2 * pi * f3 * t); % Signal before filtering
plot(t, s); % Plot before filtering
xlabel('Time/s'); ylabel('Amplitude'); title('Time Domain Plot Before Filtering');
subplot(212)
Fs = fft(s, 512); % Transform to the frequency domain
AFs = abs(Fs); % Amplitude
f = (0:255) * fs / 512; % Sample frequency
plot(f, AFs(1:256)); % Plot in the frequency domain before filtering
xlabel('Frequency/Hz'); ylabel('Amplitude'); title('Frequency Domain Plot Before Filtering');
figure(3)
sf = filter(h, 1, s); % Use the filter function
subplot(211)
plot(t, sf) % Plot after filtering
xlabel('Time/s'); ylabel('Amplitude'); title('Time Domain Plot After Filtering')
axis([0.2 0.25 -2 2]); % Set the coordinate range for the image
subplot(212)
Fsf = fft(sf, 512); AFsf = abs(Fsf);
f = (0:255) * fs / 512; % Sample frequency
plot(f, AFsf(1:256)) % Plot in the frequency domain after filtering
xlabel('Frequency/Hz'); ylabel('Amplitude'); title('Frequency Domain Plot After Filtering');
