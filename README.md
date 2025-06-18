# Thiết Kế Bộ Lọc FIR Thông Cao (FIR High-Pass Filter Design)

Bài tập lớn môn **Xử Lý Tín Hiệu Số (XLTHS)** tại Học viện Công nghệ Bưu chính Viễn thông - PTIT  
**Sinh viên**: Trần Đình Hào - B22DCCN278  
**Giảng viên**: Trần Tuấn Anh | **Khóa**: D22  
📄 **Báo cáo**: [PDF](https://drive.google.com/file/d/1170IfuuoFC38nKKBDqPhG7qNUXjvv4ks/view?usp=sharing) | [DOCX](https://docs.google.com/document/d/14DLy4H8t95rMflHzGPpXQh_yq0Shodpg/edit?usp=sharing&ouid=113235621676813436249&rtpof=true&sd=true)

---

## 📝 Giới thiệu

Bộ lọc FIR (Finite Impulse Response) là một công cụ quan trọng trong xử lý tín hiệu số. Bài tập lớn này tập trung vào **thiết kế bộ lọc FIR thông cao** để loại bỏ các thành phần tần số thấp không mong muốn trong tín hiệu.

### Lý do cần thiết kế
- Loại bỏ nhiễu tần số thấp
- Tách riêng tín hiệu cao tần phục vụ phân tích
- Ứng dụng trong xử lý âm thanh, truyền thông, radar, v.v.

## 🎯 Mục tiêu đề tài

- Tìm hiểu lý thuyết về bộ lọc FIR và bộ lọc số lý tưởng
- Thiết kế bộ lọc bằng 3 phương pháp:
  - Cửa sổ (Windowing Method)
  - Lấy mẫu tần số (Frequency Sampling)
  - Bình phương tối thiểu (Least Squares)
- Triển khai và kiểm thử trên MATLAB

## 🛠 Công nghệ & Công cụ

- MATLAB (Live Script Editor)
- Các hàm MATLAB: `fir1`, `freqz`, `lsfir`
- Nền tảng chạy code mẫu: [Ideone](https://ideone.com)

## ⚙️ Nội dung thực hiện

### I. Cơ sở lý thuyết
- Bộ lọc số lý tưởng (thông cao, thông thấp, thông dải, chắn dải)
- Đáp ứng tần số của FIR
- Tính chất đối xứng / phản đối xứng trong xung h(n)

### II. Thiết kế bộ lọc
- **Cửa sổ**: Hamming, Hanning, Blackman, Kaiser,...
- **Lấy mẫu tần số**: Frequency sampling từ đáp ứng mong muốn
- **Bình phương tối thiểu**: Tối ưu hàm sai số giữa đáp ứng thực và mong muốn

### III. Mã nguồn mẫu (MATLAB)
- Window method: [https://ideone.com/ZG52uD](https://ideone.com/ZG52uD)
- Frequency sampling: [https://ideone.com/8yCyhH](https://ideone.com/8yCyhH)
- Least Squares: [https://ideone.com/YiCmS6](https://ideone.com/YiCmS6)

## 📊 So sánh kết quả

| Phương pháp           | Ưu điểm                                | Nhược điểm                             |
|-----------------------|-----------------------------------------|----------------------------------------|
| Cửa sổ                | Dễ cài đặt, đơn giản                    | Đáp ứng tần số không quá chính xác     |
| Lấy mẫu tần số        | Phản hồi rõ ràng                        | Tốn tài nguyên nếu số mẫu lớn          |
| Bình phương tối thiểu | Gần đạt đáp ứng mong muốn nhất          | Phức tạp, cần thuật toán tối ưu hóa    |

## 🧠 Nhận xét tổng quan

**Ưu điểm**:
- Ổn định, dễ hiểu, không có phản hồi vòng lặp
- Dễ triển khai thời gian thực
- Hiệu quả trong việc loại bỏ nhiễu tần số thấp

**Nhược điểm**:
- Có độ trễ (latency)
- Tốn tài nguyên tính toán
- Không linh hoạt khi cần thay đổi tần số cắt

## 📜 License

Dự án phục vụ mục đích học thuật, không có license nguồn mở.
