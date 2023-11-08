fprintf('Design a high-pass filter using the window method \n');
fprintf('Enter filter parameters \n');
d1 = input('Enter ripple level: ');
d2 = d1;
pf = input('Passband frequency: ');
sf = input('Stopband frequency: ');
wc = (pf + sf) / 2;
D = sf - pf;
fs = 3000; % Sampling frequency
As = 20 * log(d1); % Calculate amplitude based on ripple level

% Choose an appropriate window
if (As > -30)
    fprintf('Choose a Rectangular window');
    window = 1;
    n = ceil(4 * pi / D);
end
if ((As > -49) && (As < -30))
    fprintf('Choose a Hanning window');
    window = 2;
    n = ceil(8 * pi / D);
end
if ((As > -63) && (As < -49))
    fprintf('Choose a Hamming window');
    window = 3;
    n = ceil(8 * pi / D);
end
if (As < -63)
    fprintf('Choose a Blackman window');
    window = 4;
    n = ceil(12 * pi / D);
end

% Check and ensure 'n' is odd
if (rem(n, 2) == 0)
    m = n + 1;
else
    m = n;
end
fprintf('\nFilter order %0.0f \n', m);

% Compute the window function based on the selected window
w = zeros(m, 1);
if (window == 1) % Rectangular window
    for i = 1:1:m
        w(i) = 1;
    end
elseif (window == 2) % Hanning window
    for i = 0:1:(m - 1)
        w(i + 1) = 0.5 * (1 - cos(2 * pi * i / (m - 1)));
    end
elseif (window == 3) % Hamming window
    for i = 0:1:(m - 1)
        w(i + 1) = 0.54 * 1 - 0.46 * cos(2 * pi * i / (m - 1));
    end
elseif (window == 4) % Blackman window
    for i = 0:1:(m - 1)
        w(i + 1) = 0.42 * 1 - 0.45 * cos(2 * pi * i / (m - 1)) + 0.08 * cos(4 * pi * i / (m - 1));
    end
end

% Ideal impulse response calculation
a = (m - 1) / 2;
hd = zeros(m - 1, 1);
for i = 0:1:(m - 1)
    hd(i + 1) = -sin(wc * (i - a)) / (pi * (i - a));
end
hd(a + 1) = 1 - wc / pi;

b1 = hd .* w;
h = b1'; % Transpose the matrix 'b1'

N = length(h); % Length of 'h'
[H, w1] = freqz(h, 1, 1000); % Compute the frequency response with 1000 samples
db = 20 * log10(abs(H)); % Convert the frequency response to dB

n = 0:1:m - 1;
% Plot
figure; stem(n, hd);
axis([0, m - 1, -0.1, 0.8]);
title('Ideal Impulse Response Sequence');
xlabel('n'); ylabel('hd(n)');

figure; stem(n, w);
axis([0, m - 1, 0, 1.1]);
title('Window Function Sequence');
xlabel('n'); ylabel('w(n)');

figure; stem(n, h);
axis([0, m - 1, -0.1, 0.8]);
title('Absolute Magnitude of Frequency Response');
xlabel('n'); ylabel('h(n)');

figure;
plot(w1 / pi, db);
grid;
hold on;
plot(-w1 / pi, db);
grid;
axis([-1, 1, -100, 10]);
title('Relative Magnitude (dB) of Frequency Response');
xlabel('Frequency in pi units');
ylabel('Decibels');
