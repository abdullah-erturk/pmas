

## Thanks

* Huge thanks to the [MASSGRAVE](https://github.com/massgravel/TSforge) team for developing the LibTSforge.dll file used in this project 🎉
* Special thanks to **Dark Vador** (from MDL) for the inspiration in creating this PowerShell script 🎉

---

# 🔐 PowerShell TSF Activation Script v3

This advanced PowerShell script is a flexible and modular solution designed to license Windows and Office products. 
It runs a custom .NET library called LibTSforge.dll directly from memory for Office licensing. It can operate in GUI or silent mode.

---

## 📌 Features

* ✅ License management for both Windows and Office products
* ✅ Product key generation with LibTSforge.dll support
* ✅ User-friendly graphical selection with Out-GridView
* ✅ Compatible with KMS, MAK, RETAIL, OEM, AVMA license types
* ✅ In unattended mode, only **one product of each Office type supported by LibTSforge.dll** is licensed
* ✅ Automatic mode support with -w and -o parameters
* ✅ Assigns fake, randomly generated IP for KMS products to suppress **Office Genuine Banner** warnings
* ✅ Asks for user confirmation before modifying licensed products
* ✅ DLL embedded in script using Base64 + GZIP
* ✅ Easy to use with the TSF Activation.bat file

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
* Permanent license applied using the Zerocid method

---

### 3. License Only Office (DLL-Supported) Products

* Only the Office product is processed, no Windows licensing
* One product of each type **supported by LibTSforge.dll** is selected, matching those **installed on the system**
* Permanent license applied using the Zerocid method

---

### 4. License Windows + Office (DLL-Supported) Products


* Both Windows and Office products are processed simultaneously
* Permanent license applied using the Zerocid method

---

## ⚙️ Technical Details

* Set-RandomKMSAddress: Runs only if a KMS channel product is selected in Out-GridView mode
* GetRandomKey: Generates a random license key specific to the Product ID
* Activate-License: Performs licensing by invoking the appropriate class based on product type
* LibTSforge.dll: Embedded in the script as Base64-GZIP and executed in memory
* Out-GridView interface is simplified and includes only ProductName, Description, and ID columns

---

## 📋 Example Out-GridView

The user-friendly selection window lists the products:


ProductName            Description           ID
------------           -----------           --
Windows 10 Pro         Windows KMS           0
Office ProPlus 2019    Office MAK            1
Project 2019 Standard  Office Retail         2


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

This script is for **personal and educational use only**. 
Licensing Microsoft products must be done in accordance with applicable terms of use.

---

## 🧑‍💻 Contributing

Please contribute via GitHub for any suggestions or feedback.


mephistooo2 | TNCTR.com