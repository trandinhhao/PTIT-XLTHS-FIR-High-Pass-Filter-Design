fprintf('Design a high-pass filter using the least squares method \n');
fprintf('Enter filter parameters \n');
fs = input('Sampling frequency: ');
t_start = input('Start time: ');
t_end = input('End time: ');
t = t_start:1/fs:t_end;
f = input('Signal frequency: ');
x = sin(2*pi*f*t) + 0.5*randn(size(t)); % Sinusoidal signal with noise
num_taps = input('FIR filter length/number of FIR response samples: ');
cutoff = input('Cutoff frequency: ');

% Create the desired frequency response vector
freq = [0, cutoff, cutoff*1.5, 1];
amp = [1, 1, 0, 0];
b = firls(num_taps, freq, amp);

% Apply the FIR filter to the input signal
y = filter(b, 1, x); % Apply the FIR filter

% Plot a comparison between the input and filtered signals
figure;
subplot(2, 1, 1);
plot(t, x);
title('Input Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, y);
title('Output Signal after Filtering');
xlabel('Time');
ylabel('Amplitude');
