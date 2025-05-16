# TSF Activation


---

# 🔐 PowerShell License Activation Script

Bu gelişmiş PowerShell scripti, Windows ve Office ürünlerini lisanslamak için tasarlanmış esnek ve modüler bir çözümdür. Office lisanslamasında `LibTSforge.dll` adlı özel bir .NET kütüphanesini bellekten çalıştırır. GUI veya sessiz modda çalışabilir.

---

## 📌 Özellikler

- ✅ Windows ve Office ürünleri için lisans yönetimi
- ✅ `LibTSforge.dll` desteği ile ürün anahtarı üretimi
- ✅ Out-GridView ile kullanıcı dostu grafik seçim ekranı
- ✅ KMS, MAK, RETAIL, OEM, AVMA gibi lisans türleriyle uyumlu
- ✅ Yalnızca **gerçekten yüklü olan Windows** ürünlerini tespit eder
- ✅ Office için yalnızca **LibTSforge.dll’in desteklediği ürün türlerinden birer tanesini** lisanslar
- ✅ `-w` ve `-o` parametreleri ile otomatik mod desteği
- ✅ KMS ürünleri için sahte IP atayarak lisans uyarılarını engeller
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
* KMS IP'si gerekiyorsa bir kez rastgele atanır
* Ürünler lisanslanır

---

### 2. Yalnızca Windows Ürünlerini Lisansla

```powershell
.\Activate.ps1 -w
```

* Sadece yüklü ve lisanssız Windows ürünleri işlenir
* Office lisanslaması yapılmaz

---

### 3. Yalnızca Office (DLL destekli) Ürünlerini Lisansla

```powershell
.\Activate.ps1 -o
```

* `LibTSforge.dll` tarafından desteklenen Office ürün türlerinden
  yalnızca bilgisayarda **yüklü olanlara** karşılık gelen **birer tane** seçilir
* “PreviewVL” içeren sürümler dışlanır
* Gerekirse KMS IP’si atanır

---

## ⚙️ Teknik Detaylar

* `Set-RandomKMSAddress`: Out-GridView modunda sadece KMS kanalına sahip ürün seçilirse ve yalnızca bir kez çalışır.
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

## ⚠️ Gereksinimler

* **PowerShell 5.1 veya üzeri**
* **Yönetici olarak çalıştırılmalıdır**
* .NET Framework desteği (DLL çalıştırmak için)

---

## 📄 Lisans

Bu script yalnızca kişisel kullanım içindir. Microsoft ürünleri için lisanslama işlemleri, yürürlükteki kullanım şartlarına uygun olarak yapılmalıdır.

---

## 🧑‍💻 Katkı

Her türlü öneri ve geri bildirim için lütfen GitHub üzerinden katkıda bulunun.

---
