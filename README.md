# **1. PLATFORM**

## **1.1. FLUTTER LÀ GÌ?**

Flutter là bộ công cụ UI mã nguồn mở do Google phát triển, cho phép dev xây dựng ứng dụng đa nền tảng iOS, Android. Ngoài ra Flutter còn có thể xây dựng web, desktop.

---

## **1.2. FLUTTER HOẠT ĐỘNG NHƯ THẾ NÀO?**

Flutter hoạt động dựa trên 3 thành phần chính:

### **1) DART JIT & AOT**

- AOT compile → chạy nhanh trên thiết bị thật.  
- JIT compile → hỗ trợ hot reload, tăng tốc độ phát triển.

### **2) WIDGET TREE**

- Mọi thứ trong Flutter đều là widget: UI, layout, animation.  
- UI được rebuild khi state thay đổi → tạo ra reactive UI.

### **3) RENDERING ENGINE (SKIA)**

- Flutter không sử dụng UI native, mà tự vẽ giao diện thông qua engine Skia.  
- Nhờ vậy UI đồng nhất và hiệu năng ổn định trên nhiều nền tảng.

---

# **2. SOURCE CONTROL**

## **2.1. CÁC SOURCE CONTROL ĐÃ SỬ DỤNG**

- Git (sử dụng thường xuyên)  
- SVN  

Trong các dự án thực tế, em chủ yếu dùng Git kết hợp GitHub, GitLab

---

## **2.2. BẠN CÓ BIẾT GIT KHÔNG? MỘT SỐ LỆNH GIT THƯỜNG DÙNG**

### **KHỞI TẠO & CLONE**
- **git init**  
- **git clone \<url\>**

### **KIỂM TRA & THÊM THAY ĐỔI**
- **git status**  
- **git add .**  
- **git add \<file\>**

### **COMMIT**
- **git commit -m "message"**

### **PUSH / PULL**
- **git push origin \<branch\>**  
- **git pull**

### **QUẢN LÝ NHÁNH**
- **git branch**  
- **git checkout -b feature/login**  
- **git checkout develop**  
- **git merge \<branch\>**

### **LỊCH SỬ & REVERT**
- **git log**  
- **git reset --hard**  
- **git revert \<commit\>**

---

# **3. STRUCTURE & ARCHITECTURE**

## **3.1. BLoC PATTERN LÀ GÌ? NÓ HOẠT ĐỘNG NHƯ THẾ NÀO?**

BLoC là một pattern giúp quản lí trạng thái trong ứng dụng Flutter, giúp tách biệt UI và business logic. Điều này giúp dễ test và dễ maintenance

### **CÁCH HOẠT ĐỘNG:**

1. UI gửi event vào BLoC.  
2. BLoC xử lý logic.  
3. BLoC phát ra state mới thông qua Stream.  
4. UI lắng nghe Stream và rebuild mỗi khi state thay đổi.

---

## **3.2. MVVM PATTERN LÀ GÌ?**

MVVM (Model – View – ViewModel) gồm:

- **Model:** dữ liệu, cấu trúc đối tượng.  
- **View:** giao diện người dùng.  
- **ViewModel:** xử lý logic, quản lý state, expose dữ liệu qua binding (Stream, ChangeNotifier, ValueNotifier...).

ViewModel không biết View, giúp code dễ tái sử dụng và unit test dễ dàng hơn.

## **3.3. CLEAN ARCHITECTURE?**

Là mô hình code được phân chia ra nhiều layer để phân biệt rõ ràng các chức năng và họat động riêng biệt, giảm phụ thuộc các layer và module hoá.


## **3.4. REACTIVE PROGRAMMING?**

Reactive Programming là cách lập trình dựa trên dòng dữ liệu bất đồng bộ (asynchronous data streams) và reactive state.
Thay vì pull dữ liệu, ta subscribe vào stream và tự động nhận thông báo mỗi khi dữ liệu thay đổi.


## **3.4. Can we apply MVVM or BLoC with clean code architecture?**

Clean Architecture thường được kết hợp với MVVM, BLoC, Riverpod để tạo ra cấu trúc code chuẩn mực và dễ bảo trì.
Tuy nhiên, nếu dự án tương đối nhỏ hay trung bình thì không cần thiết sử dụng clean architecture.
