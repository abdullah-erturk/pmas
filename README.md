# TSF Activation

## Teşekkürler

- Bu proje için ilham kaynağı olan [MASSGRAVE](https://github.com/massgravel/TSforge) ekibine çok teşekkürler 🎉

- PowerShell betiğini hazırlamamda bana ilham veren (MDL) **Dark Vador**'a özel teşekkür 🎉

---

# 🔐 PowerShell License Activation Script

Bu gelişmiş PowerShell scripti, Windows ve Office ürünlerini lisanslamak için tasarlanmış esnek ve modüler bir çözümdür. Office lisanslamasında `LibTSforge.dll` adlı özel bir .NET kütüphanesini bellekten çalıştırır. GUI veya sessiz modda çalışabilir.

---

## 📌 Özellikler

- ✅ Windows ve Office ürünleri için lisans yönetimi
- ✅ `LibTSforge.dll` desteği ile ürün anahtarı üretimi
- ✅ Out-GridView ile kullanıcı dostu grafik seçim ekranı
- ✅ KMS, MAK, RETAIL, OEM, AVMA gibi lisans türleriyle uyumlu
- ✅ Office için yalnızca **LibTSforge.dll’in desteklediği ürün türlerinden birer tanesini** lisanslar (sessiz modda)
- ✅ `-w` ve `-o` parametreleri ile otomatik mod desteği
- ✅ KMS ürünleri için sahte IP adresi atayarak 'Office Genunine Banner' lisans uyarılarını engeller
- ✅ Lisanslı ürünlerde işlem yapmadan önce kullanıcı onayı ister
- ✅ Base64 + GZIP ile script içine gömülü DLL dosyası

---

## 🚀 Kullanım Şekilleri

### 1. Grafiksel (Out-GridView) Mod – Parametresiz

```powershell
.\Activate.ps1
````

* Yüklü Windows ve Office ürünleri listelenir
* Kullanıcı seçim yapar
* KMS IP adresi gerekiyorsa bir kez rastgele atanır
* Ürünler lisanslanır
* KMS Lisans sadece bu modda kullanıcı tercihine göre yapılır ve KMS lisans süresi 4000 yılı aşkındır

---

### 2. Yalnızca Windows Ürünlerini Lisansla

```powershell
.\Activate.ps1 -w
```

* Sadece Windows ürünü işlenir, Office lisanslaması yapılmaz
* Zerocid yöntemiyle kalıcı lisans uygulanır

---

### 3. Yalnızca Office (DLL destekli) Ürünlerini Lisansla

```powershell
.\Activate.ps1 -o
```

* Sadece Office ürünü işlenir, Windows lisanslaması yapılmaz
* `LibTSforge.dll` tarafından desteklenen Office ürün türlerinden
  yalnızca bilgisayarda **yüklü olanlara** karşılık gelen **birer tane** seçilir
* Zerocid yöntemiyle kalıcı lisans uygulanır

### 4. Windows + Office (DLL destekli) Ürünlerini Lisansla

```powershell
.\Activate.ps1 -w -o
```

* Windows ve Office ürünleri aynı anda işlenir
* Zerocid yöntemiyle kalıcı lisans uygulanır
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

## 🔐 DLL Destekli Office Ürünleri

Aşağıdaki Office türleri desteklenmektedir (örnek):

* ProPlus2016, ProPlus2019, ProPlus2021
* ProjectPro2019, ProjectStd2019
* VisioPro2021, VisioStd2021

> DLL yalnızca desteklediği Office ürünleri için anahtar üretebilir. Yüklü olmayan türler göz ardı edilir.

---

✅ Uyumlu Windows Sürümleri
🎯 Desteklenen platformlar:
Windows 10 
Windows 11
Windows Server 2016 ve üstü

Betik, KMS/Mak/Retail türlerini desteklediğinden bu sürümlerin tümüyle uyumludur. Ayrıca AVMA destekli Windows Server sürümleri için de uygundur.

⚠️ Çalışması için gereken sistem özellikleri:
PowerShell 5.1 veya üzeri (Windows 10 ile birlikte yerleşik gelir)

.NET Framework 4.x (Varsayılan olarak Windows 10/11’de mevcuttur)

Yönetici olarak çalıştırılmalıdır (KMS IP adres ataması ve ürün lisanslama işlemleri için)

64-bit işletim sistemi önerilir (özellikle bellek içi DLL yüklemesi açısından)

⛔ Desteklenmeyen sistemler:
Windows 7 / 8 / 8.1 (resmî destek sona erdi, PowerShell ve .NET sürümleri yetersiz olabilir)

Windows XP / Vista (PowerShell 5.1 çalıştırılamaz)

ARM tabanlı Windows sürümleri (DLL yüklemesi başarısız olabilir)


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
