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
iwr cutt.ly/tsf-ohook | iex
```
**On Windows versions without the Internet Explorer engine.**  
```
iwr cutt.ly/tsf-ohook -UseBasicParsing | iex
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