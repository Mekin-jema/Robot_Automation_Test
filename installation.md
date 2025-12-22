# Installation Guide for Robot Framework in Visual Studio Code

## Overview

This guide explains how to set up **Robot Framework** in **Visual Studio Code (VS Code)**. Robot Framework is an open-source automation framework used for acceptance testing and robotic process automation (RPA).

---

## Prerequisites

Before starting, make sure the following tools are installed on your system:

* **Python** (version 3.6 or higher)
* **Visual Studio Code**
* **Git** (optional, for version control)

---

## Step 1: Install Required VS Code Extensions

To improve development and execution of Robot Framework tests, install these VS Code extensions:

* **Robot Framework Language Server**
* **Python**
* **Robocorp Code**
* **Robot Framework Formatter**
* **RobotCode-Robot Framework Support**
* **Even Better TOML**
* **Material Icon**
* **Live Server**


These extensions provide syntax highlighting, auto-completion, linting, and test execution support.

---

## Step 2: Create a Requirements File

1. In your project root directory, create a file named `requirements.txt`.
2. Add the following dependencies:

```plaintext
robotframework==6.1.1
robotframework-seleniumlibrary==6.1.3
selenium==4.15.2
webdriver-manager==4.0.1
robotframework-datadriver==1.6.0
```

---

## Step 3: Set Up a Virtual Environment

1. Open a terminal in your project directory and create a virtual environment:

```bash
python -m venv venv
```

2. Activate the virtual environment:

* **Windows**

```bash
.\venv\Scripts\activate
```

* **macOS / Linux**

```bash
source venv/bin/activate
```

---

## Step 4: Install Required Packages

With the virtual environment activated, install all dependencies:

```bash
pip install -r requirements.txt
```

> **Note:** In most cases, VS Code will automatically prompt you to select a Python interpreter and install dependencies from the `requirements.txt` file. You can simply accept the recommendations provided by the VS Code extensions.

---

## Step 5: Create Robot Framework Files

Create test files using the `.robot` extension. You can organize your tests and resources into folders based on your project structure.

Example:

```
project/
├── tests/
│   └── login_test.robot
├── resources/
│   └── keywords.robot
└── requirements.txt
```

---

## Conclusion

You are now ready to write and execute Robot Framework tests using Visual Studio Code. For advanced usage and best practices, refer to the official **Robot Framework documentation**:

👉 [https://robotframework.org/](https://robotframework.org/)

