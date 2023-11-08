fprintf('Thiết kế bộ lọc thông cao dùng phương pháp lấy mẫu tần số \n');
fprintf('Nhập thông số bộ lọc \n');
M = input('Số mẫu: '); % Số mẫu
Wp = input('Tần số cắt dải truyền: '); % Tần số cắt dải truyền
fprintf('Tần số của tín hiệu sin cần lọc \n');
f1 = input('Tần số thứ nhất: ');
f2 = input('Tần số thứ hai: ');
f3 = input('Tần số thứ ba: ');
fs = 2000; % Tần số lấy mẫu
m = 0:M/2; % Các điểm lấy mẫu
Wm = 2 * pi * m / (M + 1); % Tần số cắt dải chặn
mtr = ceil(Wp * (M + 1) / (2 * pi)); % Làm tròn phần dương, tức là ceil(3.5) = 4; ceil(-3.2) = -3;
Ad = Wm >= Wp;
Ad(mtr) = 0.28;
Hd = Ad .* exp(-1j * 0.5 * M * Wm); % Định nghĩa vector lấy mẫu trên miền tần số H(k)
Hd = [Hd conj(fliplr(Hd(2:M/2+1)))];
%fliplr để thực hiện sự đảo ngược của ma trận và conj là liên hợp
h = real(ifft(Hd)); % h(n) = IDFT[H(k)]
w = linspace(0, pi, 1000); % Lấy 1000 vector hàng giữa 0 và pi
H = freqz(h, 1, w); % Đồ thị biểu diễn biên độ - tần số của bộ lọc
figure(1)
plot(w/pi, 20 * log10(abs(H))); % Tham số lần lượt là tần số chuẩn hóa và biên độ
xlabel('Tần số chuẩn hóa'); ylabel('G Gain/dB'); title('Phản ứng biên độ của bộ lọc thông cao');
axis([0 1 -50 0]);
figure(2)
subplot(211)
t = 0:1/fs:0.25; % Định nghĩa miền thời gian và bước nhảy
s = sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t) + sin(2 * pi * f3 * t); % Tín hiệu trước khi lọc
plot(t, s); % Đồ thị trước khi lọc
xlabel('Thời gian/s'); ylabel('Biên độ'); title('Đồ thị miền thời gian trước khi lọc');
subplot(212)
Fs = fft(s, 512); % Biến đổi sang miền tần số
AFs = abs(Fs); % Biên độ
f = (0:255) * fs / 512; % Lấy mẫu tần số
plot(f, AFs(1:256)); % Đồ thị miền tần số trước khi lọc
xlabel('Tần số/Hz'); ylabel('Biên độ'); title('Đồ thị miền tần số trước khi lọc');
figure(3)
sf = filter(h, 1, s); % Sử dụng hàm filter
subplot(211)
plot(t, sf) % Đồ thị sau khi lọc
xlabel('Thời gian/s'); ylabel('Biên độ'); title('Đồ thị miền thời gian sau khi lọc')
axis([0.2 0.25 -2 2]); % Đặt phạm vi tọa độ của hình ảnh
subplot(212)
Fsf = fft(sf, 512); AFsf = abs(Fsf);
f = (0:255) * fs / 512; % Lấy mẫu tần số
plot(f, AFsf(1:256)) % Đồ thị miền tần số sau khi lọc
xlabel('Tần số/Hz'); ylabel('Biên độ'); title('Đồ thị miền tần số sau khi lọc');
