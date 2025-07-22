# 🏪 Flutter POS System

Sistem Point of Sale (POS) modern untuk restoran dan bisnis UMKM yang dikembangkan dengan Flutter.

## 📱 Screenshots

### 🔐 Login Screen
- Login dengan email dan password apapun
- Sistem autentikasi yang fleksibel

### 📊 Dashboard
- Statistik penjualan real-time
- Quick actions untuk fitur utama
- Aktivitas transaksi terbaru
- Greeting berdasarkan waktu

### 🎛️ Navigation
- Akses cepat ke semua fitur utama
- Menu navigasi yang intuitif

## ✨ Fitur Utama

### 🔑 Autentikasi
- [x] Login/Logout fungsional
- [x] Manajemen session user
- [x] Role-based access (admin, cashier)

### 📊 Dashboard
- [x] Statistik penjualan hari ini
- [x] Total transaksi
- [x] Status meja (tersedia, terisi, reserved)
- [x] Jumlah menu items
- [x] Aktivitas transaksi terbaru

### 🍽️ Manajemen Menu
- [x] Data sample menu lengkap
- [x] Kategori menu (Makanan Utama, Minuman, Cemilan)
- [x] CRUD operations untuk menu items
- [x] Stock tracking
- [x] Pencarian menu

### 🪑 Manajemen Meja
- [x] Data sample 8 meja dengan berbagai status
- [x] Management status meja (available, occupied, reserved)
- [x] Kapasitas meja
- [x] Lokasi meja (Indoor, Outdoor, VIP)

### 📋 Manajemen Pesanan
- [x] Sistem order dengan cart functionality
- [x] Add/remove items from order
- [x] Calculate subtotal, tax, total
- [x] Order history
- [x] Order status tracking

### 💳 Transaksi & Pembayaran
- [x] Multiple payment methods (Cash, Card, Digital)
- [x] Calculate change amount
- [x] Transaction history
- [x] Daily/monthly sales summary
- [x] Payment method breakdown

### ⚙️ Pengaturan
- [x] Restaurant information management
- [x] Tax rate configuration
- [x] Receipt settings
- [x] Printer settings
- [x] Backup/restore settings

## 🏗️ Arsitektur

Proyek ini menggunakan **Clean Architecture** dengan struktur sebagai berikut:

```
lib/
├── 📁 core/                   # Core functionality
│   ├── constants/             # App constants
│   ├── errors/               # Error handling
│   ├── theme/                # App theme & styling
│   └── utils/                # Utility functions
├── 📁 data/                  # Data layer
│   ├── models/               # Data models
│   ├── repositories/         # Repository implementations
│   └── datasources/          # Data sources (local/remote)
├── 📁 domain/                # Domain layer
│   ├── entities/             # Business entities
│   ├── repositories/         # Repository interfaces
│   └── usecases/            # Business logic
├── 📁 presentation/          # Presentation layer
│   ├── providers/            # State management (Provider)
│   ├── pages/               # UI screens
│   ├── widgets/             # Reusable widgets
│   └── routes/              # Navigation
└── 📁 config/               # App configuration
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.32.7
- **State Management**: Provider
- **Architecture**: Clean Architecture
- **Local Storage**: SharedPreferences + Hive
- **Navigation**: Named routes
- **Theme**: Material Design 3
- **Utilities**: intl, equatable, uuid

## 🚀 Quick Start

### Prerequisites
- Flutter SDK 3.10.0+
- Dart 3.0.0+

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd pos_system
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### 🔐 Login Credentials
Masukkan **email dan password apapun** untuk login ke sistem.

## 📋 Sample Data

Aplikasi sudah dilengkapi dengan data sample yang realistis:

### 🍽️ Menu Items
- **Makanan Utama**: Nasi Goreng Spesial, Mie Ayam, Gado-gado
- **Minuman**: Es Teh Manis, Jus Jeruk, Kopi Hitam  
- **Cemilan**: Keripik Singkong, Pisang Goreng

### 🪑 Tables
- 8 meja dengan berbagai status dan kapasitas
- Lokasi: Indoor, Outdoor, VIP

### 💳 Transactions
- Sample transaksi dengan berbagai payment methods
- Status: completed, pending, cancelled

## 🎯 Roadmap

### Phase 1 - Core Features ✅
- [x] Authentication system
- [x] Dashboard with statistics
- [x] Menu management
- [x] Table management  
- [x] Order management
- [x] Transaction processing

### Phase 2 - Advanced Features 🚧
- [ ] POS Interface lengkap
- [ ] Receipt printing
- [ ] Inventory management
- [ ] Reports & analytics
- [ ] Multi-user support

### Phase 3 - Integration 📅
- [ ] Backend API integration
- [ ] Cloud synchronization
- [ ] Payment gateway integration
- [ ] Printer integration
- [ ] Barcode/QR scanner

## 🏢 Business Features

### 👥 User Roles
- **Admin**: Full access to all features
- **Cashier**: POS operations, orders, transactions

### 💰 Financial Management
- Real-time sales tracking
- Tax calculation (configurable rate)
- Multiple payment methods
- Daily/monthly reports

### 📊 Analytics
- Sales performance
- Popular menu items
- Table utilization
- Payment method breakdown

## 🎨 UI/UX Features

- **Modern Material Design 3**
- **Responsive tablet-optimized layout**
- **Intuitive navigation**
- **Real-time updates**
- **Dark/Light theme support**
- **Indonesian localization**

## 🔧 Configuration

### Tax Settings
Default tax rate: 10% (configurable in settings)

### Restaurant Info
Customizable restaurant information, address, contact details

### Receipt Settings
Configurable receipt header, footer, and format

## 🧪 Testing

```bash
# Run tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 📦 Build

```bash
# Build APK
flutter build apk --release

# Build iOS
flutter build ios --release
```

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

Untuk support dan pertanyaan:
- Create an issue di repository ini
- Email: [your-email@domain.com]

## 🙏 Acknowledgments

- Flutter team untuk framework yang amazing
- Material Design team untuk design guidelines
- Provider package maintainers
- Indonesian Flutter community

---

**Dibuat dengan ❤️ untuk komunitas UMKM Indonesia**