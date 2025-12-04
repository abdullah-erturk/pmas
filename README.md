<a href="https://buymeacoffee.com/abdullaherturk" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

[![made-for-windows](https://img.shields.io/badge/Made%20for-Windows-00A4E3.svg?style=flat&logo=microsoft)](https://www.microsoft.com/)
[![Open Source?](https://img.shields.io/badge/Open%20source%3F-Of%20course%21%20%E2%9D%A4-009e0a.svg?style=flat)](https://github.com/abdullah-erturk/pmas/)
[![Stable?](https://img.shields.io/badge/Release_Download_Link-v9%2E0%2E0%20%7C%20Stable-009e0a.svg?style=flat)](https://github.com/abdullah-erturk/pmas/releases)

## 🛠️ PMAS - PowerShell Multi Activation System v9

![sample](https://github.com/abdullah-erturk/pmas/blob/main/preview.jpg)

<details>
<summary><strong>Türkçe Tanıtım</strong></summary>

## Teşekkür
* Projede kullanılan LibTSforge.dll dosyasını geliştiren [MASSGRAVE](https://github.com/massgravel/TSforge) ekibine çok teşekkürler 🎉
* PowerShell betiğini hazırlamamda bana ilham veren (MDL) **Dark Vador**'a özel teşekkür 🎉

# 📝 PMAS v9 [Powershell Multi Activation System]

> Bu gelişmiş PowerShell scripti, Windows ve Office ürünlerini lisanslamak için tasarlanmış esnek ve modüler bir çözümdür. TSF yöntemi için Windows ve Office lisanslamasında `LibTSforge.dll` adlı özel bir .NET kütüphanesini bellekten çalıştırır. Ayrıca HWID, Ohook ve KMS Inject aktivasyon yöntemlerini de destekleyen full paket bir aktivasyon aracıdır.

## 🚀 Hızlı Başlangıç

PowerShell komut satırı üzerinden çalıştırmak için işletim sisteminize uygun komutu kullanın:

### Windows 7 (PowerShell 2.0):
```powershell
(New-Object Net.WebClient).DownloadString('https://erturk.netlify.app/run?ps=1') | iex
```

### Windows 8.1 ve Windows Server:
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm erturk.netlify.app/run | iex
```

### Windows 10 ve Windows 11:
```powershell
irm erturk.netlify.app/run | iex
```

### Nasıl Kullanılır?
1. **PowerShell Açın**  
   Windows tuşu + X'e basın, ardından PowerShell veya Terminal'i seçin.

2. **Yukarıdaki komutlardan işletim sisteminize uygun olanı kopyalayıp yapıştırın ve Enter tuşuna basın.**

---

## 🎯 Özellikler
- **Tam Otomatik Aktivasyon**  
- **GUI destekli sezgisel arayüz (PowerShell tabanlı menü - TSF)**
- **Base64 üzerinden gömülü script çözme (decode)**
- **İnternet bağlantısı kontrolü ve hata toleransı**
- **Windows 7/8/8.1 için otomatik KMS yönlendirmesi**
- **Windows 10/11 ve Server 2016+ için gelişmiş aktivasyon seçenekleri**
- **İşletim sistemine özel PowerShell komut desteği**

---

## 🖥️ Desteklenen Ürünler

### Windows:
- Windows 7 / 8.1 (KMS Inject ile)
- Windows 10 (tüm sürümler)
- Windows 11 (tüm sürümler)
- Windows Server 2016 / 2019 / 2022 / 2025

### Office:
- Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365

---

## 📋 Aktivasyon Yöntemleri ve Açıklamaları

### 1️⃣ TSF Aktivasyon
Bu yöntem telefonla etkinleştirilebilen Windows ve Office ürünlerini MAK-RETAIL-OEM yöntemiyle kalıcı olarak etkinleştirir. 
Kullanım esnasında internet bağlantısı yoksa KMS Lisans yöntemiyle lisans ataması gerçekleştirir ve süresi 4000 yılı aşkındır.
> 🔶 **TSF yöntemi internet gerektirir.**
> 🔶 **TSF-KMS4k yöntemi internetsiz çalışabilir.**

**Desteklenen Sistemler:** Windows 10 / 11 / Server 2016+

---

### 2️⃣ HWID Aktivasyon
**(Donanım tabanlı dijital lisanslama)**  
HWID (Hardware ID) yöntemi Microsoft'un dijital lisans sistemini taklit eder. Tek seferlik aktivasyon sonrasında Microsoft hesabıyla eşleştiğinde kalıcı olur.
> 🌐 **HWID yöntemi internet gerektirir.**

**Desteklenen Sistemler:** Windows 10 / 11

---

### 3️⃣ Ohook Aktivasyon (Office)
Ohook yöntemi bir dll dosyasının manipülasyonu ile Office sürümünü kalıcı olacak şekilde abonelikle etkinleştirilmiş gibi gösterir.
> 🔴 **Ohook yöntemi internetsiz çalışabilir.**

**Desteklenen Ürünler:** Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365 (Windows 10 ve üzeri)

---

### 4️⃣ HWID + Ohook Aktivasyon
Windows ve Office'i aynı anda aktive etmek için kombine yöntem. Tek seferde hem Windows hem Office lisanslaması yapar.
> 🌐 **HWID için internet gereklidir, Ohook internetsiz çalışabilir.**

**Desteklenen Sistemler:** Windows 10 / 11

---

### 5️⃣ KMS Inject Aktivasyon
KMS (Key Management Service) yöntemi, özellikle eski Windows sürümleri için tasarlanmış aktivasyon yöntemidir. 180 günlük lisanslama sağlar ve otomatik yenileme sistemi içerir.
> 🔴 **KMS Inject yöntemi internetsiz çalışabilir.**
> 📌 **Windows 7/8/8.1 sistemler otomatik olarak KMS menüsüne yönlendirilir.**

**Desteklenen Sistemler:** Windows 7 / 8.1 / 10 / 11 / Server 2016+

---

### 6️⃣ Ohook Aktivasyon Kaldır
Daha önce yüklenmiş Ohook aktivasyonunu sistemden tamamen kaldırır.

---

### 7️⃣ Aktivasyon Kontrolü
Yüklü Windows ve Office ürünlerinin lisans durumunu detaylı olarak raporlar.  
KMS bağlantı, kalan süre, sürüm tipi ve lisans durumu gibi bilgiler sağlar.

---

### 8️⃣ $OEM$ Klasörü Oluştur
Windows kurulumu sırasında otomatik aktivasyon için $OEM$ klasörü oluşturur. Bu özellik ile:
- **TSF $OEM$**: Windows kurulumu sonrası otomatik TSF aktivasyonu
- **HWID & Ohook $OEM$**: Windows kurulumu sonrası otomatik HWID ve Ohook aktivasyonu

> 💡 **$OEM$ klasörü sistemin kök dizinine (%systemdrive%\) oluşturulur ve kurulum medyasına kopyalanabilir.**

---

## ⚙️ Sistem Gereksinimleri

- **İşletim Sistemi:** Windows 7, 8.1, 10, 11 veya Windows Server 2016 ve üzeri
- **Mimari:** 64-bit (32-bit sistemler desteklenmez)
- **Yönetici Yetkisi:** Gerekli
- **PowerShell:** 
  - Windows 7: PowerShell 2.0 veya üzeri
  - Windows 8.1/Server: PowerShell 4.0 veya üzeri
  - Windows 10/11: PowerShell 5.1 veya üzeri

---

## 📦 Kurulum ve Kullanım

### Yöntem 1: PowerShell Komutu ile (Önerilen)
1. **PowerShell'i Yönetici olarak açın**
2. İşletim sisteminize uygun komutu kullanın (yukarıdaki "Hızlı Başlangıç" bölümüne bakın)

### Yöntem 2: Manuel Kurulum
1. PMAS script dosyasını indirin.
2. Sağ tıklayıp **"Yönetici olarak çalıştırın"**.
3. **Windows 7/8/8.1** kullanıyorsanız otomatik olarak KMS menüsüne yönlendirileceksiniz.
4. **Windows 10/11** kullanıyorsanız açılan PowerShell menüsünden dilediğiniz aktivasyon modunu seçin:
    - `1` - TSF Aktivasyon
    - `2` - HWID Aktivasyon
    - `3` - Ohook Aktivasyon [Office]
    - `4` - HWID + Ohook Aktivasyon
    - `5` - KMS Inject Aktivasyon
    - `6` - Ohook Aktivasyon Kaldır
    - `7` - Aktivasyon Kontrolü
    - `8` - $OEM$ Klasörü Oluştur
    - `9` - Çıkış

---

## 🔒 Güvenlik Özellikleri

PMAS v9, script bütünlüğünü korumak için SHA256 hash kontrolü içerir. Script değiştirildiğinde veya bozulduğunda çalışmaz ve kullanıcıyı uyarır.

---

## 🧪 Güvenlik Notu

Bu script, **ticari olmayan** amaçlarla eğitim, test ve bireysel kullanım için tasarlanmıştır. Lisans koşullarınıza uygun olarak kullanınız.  

---

## 🧬 Katkıda Bulun

İyileştirme önerileri, hata raporları ve katkılar için GitHub üzerinde pull request gönderebilir veya issue açabilirsiniz.

---

## 📜 Lisans

Bu script yalnızca kişisel kullanım ve eğitim içindir. Microsoft ürünleri için lisanslama işlemleri, yürürlükteki kullanım şartlarına uygun olarak yapılmalıdır.

</details>

---

<details>
<summary><strong>English Description</strong></summary>

## Thanks

* Huge thanks to the [MASSGRAVE](https://github.com/massgravel/TSforge) team for developing the `LibTSforge.dll` file used in this project 🎉
* Special thanks to **Dark Vador** (from MDL) for the inspiration in creating this PowerShell script 🎉

# 📝 PMAS v9 [Powershell Multi Activation System]

> This advanced PowerShell script is a flexible and modular solution designed for licensing Windows and Office products. It runs a custom .NET library called "LibTSforge.dll" from memory for the TSF method of licensing Windows and Office. It's a full-service activation tool that also supports HWID, Ohook, and KMS Inject activation methods.

## 🚀 Quick Start

Use the appropriate command for your operating system via PowerShell command line:

### Windows 7 (PowerShell 2.0):
```powershell
(New-Object Net.WebClient).DownloadString('https://erturk.netlify.app/run?ps=1') | iex
```

### Windows 8.1 and Windows Server:
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm erturk.netlify.app/run | iex
```

### Windows 10 and Windows 11:
```powershell
irm erturk.netlify.app/run | iex
```

### How to Use?
1. **Open PowerShell**  
   Press Windows key + X, then select PowerShell or Terminal.

2. **Copy and paste the appropriate command for your operating system and press Enter.**

---

## 🎯 Features

- **Fully automated activation**
- **GUI-assisted interactive PowerShell menu (TSF)**
- **Base64 embedded script decoding**
- **Internet connection check & fallback mechanisms**
- **Automatic KMS redirection for Windows 7/8/8.1**
- **Advanced activation options for Windows 10/11 and Server 2016+**
- **OS-specific PowerShell command support**

---

## 🖥️ Supported Products

### Windows:
- Windows 7 / 8.1 (via KMS Inject)
- Windows 10 (all editions)
- Windows 11 (all editions)
- Windows Server 2016 / 2019 / 2022 / 2025

### Office:
- Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365

---

## 📋 Activation Methods Explained

### 1️⃣ TSF Activation
This method permanently activates Windows and Office products that can be activated by phone using the MAK-RETAIL-OEM method.

If there is no internet connection during use, the license is assigned using the KMS License method, and its validity period is over 4000 years.
> 🔶 **The TSF method requires an internet connection.**
> 🔶 **The TSF-KMS4k method can work without an internet connection.**

**Supported Systems:** Windows 10 / 11 / Server 2016+

---

### 2️⃣ HWID Activation
**(Hardware-Based Digital Licensing)**
The HWID (Hardware ID) method mimics Microsoft's digital license system. After a one-time activation, it becomes permanent when it matches a Microsoft account.
> 🌐 **The HWID method requires an internet connection.**

**Supported Systems:** Windows 10 / 11

---

### 3️⃣ Ohook Activation (Office)
The Ohook method manipulates a DLL file to make the Office version appear permanently activated through a subscription.
> 🔴 **The Ohook method can work without an internet connection.**

**Supported Systems:** Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365 (Windows 10 and above)

---

### 4️⃣ HWID + Ohook Activation
Combined method to activate both Windows and Office at once. Provides both Windows and Office licensing in a single operation.
> 🌐 **Internet required for HWID, Ohook works offline.**

**Supported Systems:** Windows 10 / 11

---

### 5️⃣ KMS Inject Activation
KMS (Key Management Service) method is designed especially for older Windows versions. Provides 180-day licensing with automatic renewal system.
> 🔴 **KMS Inject method can work without internet.**
> 📌 **Windows 7/8/8.1 systems are automatically redirected to the KMS menu.**

**Supported Systems:** Windows 7 / 8.1 / 10 / 11 / Server 2016+

---

### 6️⃣ Remove Ohook Activation
Completely removes previously installed Ohook activation from the system.

---

### 7️⃣ Activation Check  
Displays current activation status for installed Windows and Office products — including channel type, license status, and remaining grace periods.

---

### 8️⃣ Create $OEM$ Folder
Creates $OEM$ folder for automatic activation during Windows installation. With this feature:
- **TSF $OEM$**: Automatic TSF activation after Windows installation
- **HWID & Ohook $OEM$**: Automatic HWID and Ohook activation after Windows installation

> 💡 **The $OEM$ folder is created in the system root directory (%systemdrive%\) and can be copied to installation media.**

---

## ⚙️ System Requirements

- **Operating System:** Windows 7, 8.1, 10, 11, or Server 2016 and above
- **Architecture:** 64-bit only (32-bit systems not supported)
- **Admin Rights:** Required
- **PowerShell:** 
  - Windows 7: PowerShell 2.0 or newer
  - Windows 8.1/Server: PowerShell 4.0 or newer
  - Windows 10/11: PowerShell 5.1 or newer

---

## 📦 How to Use

### Method 1: Using PowerShell Command (Recommended)
1. **Open PowerShell as Administrator**
2. Use the appropriate command for your operating system (see "Quick Start" section above)

### Method 2: Manual Installation
1. Download the PMAS script.
2. Right-click and select **"Run as Administrator"**.
3. If you're using **Windows 7/8/8.1**, you'll be automatically redirected to the KMS menu.
4. If you're using **Windows 10/11**, use the interactive PowerShell menu to choose:
    - `1` - TSF Activation
    - `2` - HWID Activation
    - `3` - Ohook Activation [Office]
    - `4` - HWID + Ohook Activation
    - `5` - KMS Inject Activation
    - `6` - Remove Ohook Activation
    - `7` - Activation Check
    - `8` - Create $OEM$ Folder
    - `9` - Exit

---

## 🔒 Security Features

PMAS v9 includes SHA256 hash verification to maintain script integrity. The script will not run if it has been modified or corrupted and will alert the user.

---

## 🧪 Safety Notice

This script is for **educational and personal use only**. Please ensure compliance with applicable licensing terms before use.

---

## 🧬 Contribute

Suggestions, improvements, and pull requests are welcome via GitHub.

---
## 📜 License

This script is for personal and educational use only. Activation of Microsoft products must be done in accordance with applicable license terms.

</details>



