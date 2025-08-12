<a href="https://buymeacoffee.com/abdullaherturk" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

[![made-for-windows](https://img.shields.io/badge/Made%20for-Windows-00A4E3.svg?style=flat&logo=microsoft)](https://www.microsoft.com/)
[![Open Source?](https://img.shields.io/badge/Open%20source%3F-Of%20course%21%20%E2%9D%A4-009e0a.svg?style=flat)](https://github.com/abdullah-erturk/pmas/)
[![Stable?](https://img.shields.io/badge/Release-v4%2E0%2E0%20%7C%20Stable-009e0a.svg?style=flat)](https://github.com/abdullah-erturk/pmas/releases)

## 🛠️ PMAS - PowerShell Multi Activation System v5 (formerly TSF Activation)

![sample](https://raw.githubusercontent.com/abdullah-erturk/pmas/refs/heads/main/preview.jpg)

<details>
<summary><strong>Türkçe Tanıtım</strong></summary>

## Teşekkür
* Projede kullanılan LibTSforge.dll dosyasını geliştiren [MASSGRAVE](https://github.com/massgravel/TSforge) ekibine çok teşekkürler 🎉
* PowerShell betiğini hazırlamamda bana ilham veren (MDL) **Dark Vador**'a özel teşekkür 🎉

# 🔐 PMAS v5 [Powershell Multi Activation System]

> Bu gelişmiş PowerShell scripti, Windows ve Office ürünlerini lisanslamak için tasarlanmış esnek ve modüler bir çözümdür. TSF yöntemi için Windows ve Office lisanslamasında `LibTSforge.dll` adlı özel bir .NET kütüphanesini bellekten çalıştırır. Ayrıca HWID ve Ohook aktivasyon yöntemlerini de destekleyen full paket bir aktivasyon aracıdır.

Powershell komut satırı üzerinden çalıştırmak için:
1.   **PowerShell Açın**  
	Bunu yapmak için Windows tuşu + X'e basın, ardından PowerShell veya Terminal'i seçin.

2.   **Aşağıdaki kodu kopyalayıp yapıştırın ve Enter tuşuna basın.**  
```
irm tinyurl.com/getpmas | iex
```
---

## 🚀 Özellikler
- **Tam Otomatik Aktivasyon**  
- **GUI destekli sezgisel arayüz (PowerShell tabanlı menü - TSF)**
- **Base64 üzerinden gömülü script çözme (decode)**
- **İnternet bağlantısı kontrolü ve hata toleransı**
- **Yalnızca Windows 10/11 ve Server 2016+ destekli**

---

## 🖥️ Desteklenen Ürünler

### Windows:
- Windows 10 (tüm sürümler)
- Windows 11 (tüm sürümler)
- Windows Server 2016 / 2019 / 2022 / 2025

### Office:
- Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365

---

⛔ Desteklenmeyen sistemler:
* Windows 7 / 8 / 8.1 (resmî destek sona erdi, PowerShell ve .NET sürümleri yetersiz olabilir)
* Windows XP / Vista (PowerShell 5.1 çalıştırılamaz)
* ARM tabanlı Windows sürümleri (DLL yüklemesi başarısız olabilir)
* Bu sürümlerde bazı Powershell kodları desteklenmediği için betik dosyası hata verebilir.
---

## 🔐 Aktivasyon Yöntemleri ve Açıklamaları

### 1️⃣ TSF Aktivasyon
Bu yöntem telefonla etkinleştirilebilen Windows ve Office ürünlerini MAK-RETAIL-OEM yöntemiyle kalıcı olarak etkinleştirir. 
Kullanım esnasında internet bağlantısı yoksa KMS Lisans yöntemiyle lisans ataması gerçekleştirir ve süresi 4000 yılı aşkındır.
> 📶 **TSF yöntemi internet gerektirir.**
> 📶 **TSF-KMS4k yöntemi internetsiz çalışabilir.**
---

### 2️⃣ HWID / KMS38 Aktivasyon
**(Donanım tabanlı dijital lisanslama)**  
HWID (Hardware ID) yöntemi Microsoft’un dijital lisans sistemini taklit eder. Tek seferlik aktivasyon sonrasında Microsoft hesabıyla eşleştiğinde kalıcı olur. KMS38 ise KMS lisansını 2038 yılına kadar uzatır.  
> 🌐 **HWID yöntemi internet gerektirir.**
> 🌐 **KMS38 yöntemi internetsiz çalışabilir.**

---

### 3️⃣ Ohook Aktivasyon (Office)
Ohook yöntemi bir dll dosyasının manipülasyonu ile Office sürümünü kalıcı olacak şekilde abonelikle etkinleştirilmiş gibi gösterir.
> 📴 **Ohook yöntemi internetsiz çalışabilir.**

---

### 4️⃣ Aktivasyon Kontrolü
Yüklü Windows ve Office ürünlerinin lisans durumunu detaylı olarak raporlar.  
KMS bağlantı, kalan süre, sürüm tipi ve lisans durumu gibi bilgiler sağlar.

---

## ⚙️ Sistem Gereksinimleri

- **İşletim Sistemi:** Sadece Windows 10, Windows 11 veya Windows Server 2016 ve üzeri
- **Mimari:** Yalnızca 64-bit desteklenir
- **Yönetici Yetkisi:** Gerekli
- **PowerShell:** v5.1 veya üzeri

---

## 📦 Kurulum ve Kullanım

1. PMAS v5 script dosyasını indirin.
2. Sağ tıklayıp **"Yönetici olarak çalıştırın"**.
3. Açılan PowerShell menüsünden dilediğiniz aktivasyon modunu seçin:
    - `1` - TSF
    - `2` - HWID/KMS38
    - `3` - Ohook
    - `4` - Aktivasyon Kontrolü
    - `5` - Çıkış

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

# 🔐 PMAS v5 [Powershell Multi Activation System]

> This advanced PowerShell script is a flexible and modular solution designed for licensing Windows and Office products. It runs a custom .NET library called "LibTSforge.dll" from memory for the TSF method of licensing Windows and Office. It's a full-service activation tool that also supports HWID and Ohook activation methods.

To run via powershell command line:
1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press Enter.**  
```
irm tinyurl.com/getpmas | iex
```
---

## 🚀 Features

- **Fully automated activation**
- **GUI-assisted interactive PowerShell menu (TSF)**
- **Base64 embedded script decoding**
- **Internet connection check & fallback mechanisms**
- **Supports only Windows 10/11 and Server 2016+**

---

## 🖥️ Supported Products

### Windows:
- Windows 10 (all editions)
- Windows 11 (all editions)
- Windows Server 2016 / 2019 / 2022 / 2025

### Office:
- Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365

---

⛔ Unsupported Systems:

* Windows 7 / 8 / 8.1 (official support ended; PowerShell and .NET versions may be insufficient)
* Windows XP / Vista (PowerShell 5.1 cannot run)
* ARM-based Windows versions (DLL loading may fail)

The script may throw errors on these systems due to lack of PowerShell feature support.
---

## 🔐 Activation Methods Explained

### 1️⃣ TSF Activation
This method permanently activates Windows and Office products that can be activated by phone using the MAK-RETAIL-OEM method.

If there is no internet connection during use, the license is assigned using the KMS License method, and its validity period is over 4000 years.
> 📶 **The TSF method requires an internet connection.**
> 📶 **The TSF-KMS4k method can work without an internet connection.**
---

### 2️⃣ HWID / KMS38 Activation
**(Hardware-Based Digital Licensing)**
The HWID (Hardware ID) method mimics Microsoft's digital license system. After a one-time activation, it becomes permanent when it matches a Microsoft account. KMS38, on the other hand, extends the KMS license until 2038.
> 🌐 **The HWID method requires an internet connection.**
> 🌐 **The KMS38 method can work without an internet connection.**

---

### 3️⃣ Ohook Activation (Office)
The Ohook method manipulates a DLL file to make the Office version appear permanently activated through a subscription.
> 📴 **The Ohook method can work without an internet connection.**

---

### 4️⃣ Activation Check  
Displays current activation status for installed Windows and Office products — including channel type, license status, and remaining grace periods.

---

## ⚙️ System Requirements

- **Operating System:** Windows 10, 11, or Server 2016 and above
- **Architecture:** 64-bit only
- **Admin Rights:** Required
- **PowerShell:** v5.1 or newer

---

## 📦 How to Use

1. Download the PMAS v5 script.
2. Right-click and select **"Run as Administrator"**.
3. Use the interactive PowerShell menu to choose:
    - `1` - TSF
    - `2` - HWID/KMS38
    - `3` - Ohook
    - `4` - Activation Check
    - `5` - Exit

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
