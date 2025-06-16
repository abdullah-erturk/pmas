<a href="https://buymeacoffee.com/abdullaherturk" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

![sample](https://github.com/abdullah-erturk/tsf_activation/blob/main/preview.jpg)

# Powershell TSF Activation

     Türkçe Açıklama

<details>

  ![sample](https://raw.githubusercontent.com/abdullah-erturk/tsf_activation/refs/heads/main/TR/aktivasyon_%C3%B6nizleme.jpg)
  
## Teşekkür

* Projede kullanılan LibTSforge.dll dosyasını geliştiren [MASSGRAVE](https://github.com/massgravel/TSforge) ekibine çok teşekkürler 🎉
* PowerShell betiğini hazırlamamda bana ilham veren (MDL) **Dark Vador**'a özel teşekkür 🎉

---

# 🔐 PowerShell TSF Activation Script

Bu gelişmiş PowerShell scripti, Windows ve Office ürünlerini lisanslamak için tasarlanmış esnek ve modüler bir çözümdür. Office lisanslamasında `LibTSforge.dll` adlı özel bir .NET kütüphanesini bellekten çalıştırır. GUI veya sessiz modda çalışabilir.

Powershell komut satırı üzerinden çalıştırmak için:
1.   **PowerShell Açın**  
	Bunu yapmak için Windows tuşu + X'e basın, ardından PowerShell veya Terminal'i seçin.

2.   **Aşağıdaki kodu kopyalayıp yapıştırın ve Enter tuşuna basın.**  
```
iwr cutt.ly/tsfget | iex
```
3.   **Internet Explorer motorunun olmadığı Windows sürümlerinde aşağıdaki kodu kopyalayıp yapıştırın ve Enter tuşuna basın.**  
```
iwr https://cutt.ly/tsfget -UseBasicParsing | iex
```
---

## 📌 Özellikler

- ✅ Windows ve Office ürünleri için lisans yönetimi
- ✅ `LibTSforge.dll` desteği ile ürün anahtarı üretimi
- ✅ Out-GridView ile kullanıcı dostu grafik seçim ekranı
- ✅ KMS, MAK, RETAIL, OEM, AVMA gibi lisans türleriyle uyumlu
- ✅ Office ürünleri için yalnızca **LibTSforge.dll’in desteklediği ürün türlerinden birer tanesini** lisanslar (sadece katılımsız modda)
- ✅ `-w` ve `-o` parametreleri ile otomatik mod desteği
- ✅ KMS ürünleri için sahte rastgele oluşturulmuş IP adresi atayarak **Office Genuine Banner** lisans uyarılarını engeller
- ✅ Lisanslı ürünlerde işlem yapmadan önce kullanıcı onayı ister
- ✅ Base64 + GZIP ile script içine gömülü DLL dosyası
- ✅ `TSF Activation.bat` dosyası ile kolay kullanım

---

## 🚀 Kullanım Şekilleri

### 1. Grafiksel (Out-GridView) Mod – Parametresiz

* Yüklü Windows ve Office ürünleri listelenir
* Kullanıcı seçim yapar
* KMS IP adresi gerekiyorsa bir kez rastgele atanır
* Ürünler lisanslanır
* KMS Lisans yöntemi sadece bu modda kullanıcı tercihine göre yapılır ve KMS lisans süresi 4000 yılı aşkındır

---

### 2. Yalnızca Windows Ürünlerini Lisansla

* Sadece Windows ürünü işlenir, Office lisanslaması yapılmaz
* StaticCID yöntemiyle kalıcı lisans uygulanır

---

### 3. Yalnızca Office (DLL destekli) Ürünlerini Lisansla

* Sadece Office ürünü işlenir, Windows lisanslaması yapılmaz
* `LibTSforge.dll` tarafından desteklenen Office ürün türlerinden
  yalnızca bilgisayarda **yüklü olanlara** karşılık gelen **birer tane** seçilir
* StaticCID yöntemiyle kalıcı lisans uygulanır

### 4. Windows + Office (DLL destekli) Ürünlerini Lisansla

* Windows ve Office ürünleri aynı anda işlenir
* StaticCID yöntemiyle kalıcı lisans uygulanır
---

## ⚙️ Teknik Detaylar

* `Set-RandomKMSAddress`: Out-GridView modunda sadece KMS kanalına sahip ürün seçilirse çalışır.
* `GetRandomKey`: Product ID’ye özel rastgele lisans anahtarı üretir.
* `Activate-License`: Ürün türüne göre ilgili sınıfı çağırarak lisanslama yapar.
* `LibTSforge.dll`: Script içinde Base64-GZIP kodlu olarak gömülüdür, bellekte çalıştırılır.
* Out-GridView görünümü sadeleştirilmiş olup `ProductName`, `Description`, `ID` sütunlarını içerir.

---

## 📋 Örnek Out-GridView

Kullanıcı dostu seçim ekranında ürünler listelenir:

```
ProductName            Description           ID
------------           -----------           --
Windows 10 Pro         Windows KMS           0
Office ProPlus 2019    Office MAK            1
Project 2019 Standard  Office Retail         2
```

Not: Görsel çizgiler PowerShell'deki varsayılan Out-GridView davranışı nedeniyle görünmez. Bu teknik olarak özelleştirilemez.

---

✅ Uyumlu Windows Sürümleri
🎯 Desteklenen platformlar:

* Windows 10
* Windows 11
* Windows Server 2016 and newer

Betik, KMS/Mak/Retail türlerini desteklediğinden bu sürümlerin tümüyle uyumludur. Ayrıca AVMA destekli Windows Server sürümleri için de uygundur.

⚠️ Çalışması için gereken sistem özellikleri:

* PowerShell 5.1 veya üzeri (Windows 10 ile birlikte yerleşik gelir)
* .NET Framework 4.x (Varsayılan olarak Windows 10/11’de mevcuttur)
* Yönetici olarak çalıştırılmalıdır (KMS IP adres ataması ve ürün lisanslama işlemleri için)
* 64-bit işletim sistemi önerilir (özellikle bellek içi DLL yüklemesi açısından)


⛔ Desteklenmeyen sistemler:

* Windows 7 / 8 / 8.1 (resmî destek sona erdi, PowerShell ve .NET sürümleri yetersiz olabilir)
* Windows XP / Vista (PowerShell 5.1 çalıştırılamaz)
* ARM tabanlı Windows sürümleri (DLL yüklemesi başarısız olabilir)
* Bu sürümlerde bazı Powershell kodları desteklenmediği için betik dosyası hata verebilir.

## ⚠️ Gereksinimler

* **PowerShell 5.1 veya üzeri**
* **Yönetici olarak çalıştırılmalıdır**
* .NET Framework desteği (DLL çalıştırmak için)

---

## 📄 Lisans

Bu script yalnızca kişisel kullanım ve eğitim içindir. Microsoft ürünleri için lisanslama işlemleri, yürürlükteki kullanım şartlarına uygun olarak yapılmalıdır.

---

## 🧑‍💻 Katkı

Her türlü öneri ve geri bildirim için lütfen GitHub üzerinden katkıda bulunun.

---
</details>

     English Explanation

<details>

![sample](https://raw.githubusercontent.com/abdullah-erturk/tsf_activation/refs/heads/main/ENG/activation_preview.jpg)

## Thanks

* Huge thanks to the [MASSGRAVE](https://github.com/massgravel/TSforge) team for developing the `LibTSforge.dll` file used in this project 🎉
* Special thanks to **Dark Vador** (from MDL) for the inspiration in creating this PowerShell script 🎉

---

# 🔐 PowerShell TSF Activation Script

This advanced PowerShell script is a flexible and modular solution designed to license Windows and Office products. It runs a custom .NET library called `LibTSforge.dll` directly from memory for Office licensing. It can operate in GUI or silent mode.

To run via powershell command line:
1.   **Open PowerShell**  
	To do that, press the Windows key + X, then select PowerShell or Terminal.

2.   **Copy and paste the code below, then press Enter.**  
```
iwr cutt.ly/tsfget | iex
```
3.   **On Windows versions without the Internet Explorer engine.**  
```
iwr https://cutt.ly/tsfget -UseBasicParsing | iex
```
---

## 📌 Features

* ✅ License management for both Windows and Office products
* ✅ Product key generation with `LibTSforge.dll` support
* ✅ User-friendly graphical selection with Out-GridView
* ✅ Compatible with KMS, MAK, RETAIL, OEM, AVMA license types
* ✅ In unattended mode, only **one product of each Office type supported by LibTSforge.dll** is licensed
* ✅ Automatic mode support with `-w` and `-o` parameters
* ✅ Assigns fake, randomly generated IP for KMS products to suppress **Office Genuine Banner** warnings
* ✅ Asks for user confirmation before modifying licensed products
* ✅ DLL embedded in script using Base64 + GZIP
* ✅ Easy to use with the `TSF Activation.bat` file

---

## 🚀 Usage Modes

### 1. Graphical (Out-GridView) Mode – No Parameters

* Lists installed Windows and Office products
* User selects the products
* If needed, a random KMS IP address is assigned once
* Products are licensed
* KMS license mode is available only in this mode based on user selection, and the KMS license duration exceeds the year 4000

---

### 2. License Only Windows Products

* Only the Windows product is processed, no Office licensing
* Permanent license applied using the StaticCID method

---

### 3. License Only Office (DLL-Supported) Products

* Only the Office product is processed, no Windows licensing
* One product of each type **supported by LibTSforge.dll** is selected, matching those **installed on the system**
* Permanent license applied using the StaticCID method

---

### 4. License Windows + Office (DLL-Supported) Products

* Both Windows and Office products are processed simultaneously
* Permanent license applied using the StaticCID method

---

## ⚙️ Technical Details

* `Set-RandomKMSAddress`: Runs only if a KMS channel product is selected in Out-GridView mode
* `GetRandomKey`: Generates a random license key specific to the Product ID
* `Activate-License`: Performs licensing by invoking the appropriate class based on product type
* `LibTSforge.dll`: Embedded in the script as Base64-GZIP and executed in memory
* Out-GridView interface is simplified and includes only `ProductName`, `Description`, and `ID` columns

---

## 📋 Example Out-GridView

The user-friendly selection window lists the products:

```
ProductName            Description           ID
------------           -----------           --
Windows 10 Pro         Windows KMS           0
Office ProPlus 2019    Office MAK            1
Project 2019 Standard  Office Retail         2
```

Note: Visual grid lines are not shown due to the default behavior of PowerShell's Out-GridView. This is technically not customizable.

---

✅ Supported Windows Versions
🎯 Supported platforms:

* Windows 10
* Windows 11
* Windows Server 2016 and newer

The script supports KMS/MAK/Retail types, so it's compatible with all of these versions. Also suitable for Windows Server editions that support AVMA.

⚠️ System Requirements:

* PowerShell 5.1 or higher (comes preinstalled with Windows 10)
* .NET Framework 4.x (available by default in Windows 10/11)
* Must be run as Administrator (for KMS IP assignment and product licensing)
* 64-bit OS is recommended (especially for in-memory DLL loading)

⛔ Unsupported Systems:

* Windows 7 / 8 / 8.1 (official support ended; PowerShell and .NET versions may be insufficient)
* Windows XP / Vista (PowerShell 5.1 cannot run)
* ARM-based Windows versions (DLL loading may fail)

The script may throw errors on these systems due to lack of PowerShell feature support.

---

## ⚠️ Requirements

* **PowerShell 5.1 or higher**
* **Must be run as Administrator**
* .NET Framework support (required to run the DLL)

---

## 📄 License

This script is for **personal and educational use only**. Licensing Microsoft products must be done in accordance with applicable terms of use.

---

## 🧑‍💻 Contributing

Please contribute via GitHub for any suggestions or feedback.

---
    
</details>
