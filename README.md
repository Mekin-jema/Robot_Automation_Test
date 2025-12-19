# 🤖 Robot Framework - Complete Learning Guide & Project

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

> **A comprehensive guide to Robot Framework with practical examples and industry best practices**

---

## 📚 Table of Contents

1. [What is Robot Framework?](#what-is-robot-framework)
2. [Project Structure](#project-structure)
3. [Common Keywords Reference](#common-keywords-reference)
4. [Setup & Installation](#setup--installation)
5. [Running Tests](#running-tests)
6. [Best Practices](#best-practices)
7. [Advanced Topics](#advanced-topics)

---

## 🎯 What is Robot Framework?

**Robot Framework** is a generic open-source automation framework for:
- ✅ **Acceptance Testing**
- ✅ **Test-Driven Development (TDD)**
- ✅ **Robotic Process Automation (RPA)**

### Key Features:
- 📝 **Keyword-driven** - easy to read and write
- 🔧 **Extensible** - supports Python, Java libraries
- 📊 **Rich reporting** - HTML reports with logs
- 🌐 **Cross-platform** - Windows, Linux, macOS
- 🎨 **Human-readable** - non-programmers can write tests

---

## 📁 Project Structure

```
robot-login-project/
│
├── tests/                      # Test case files
│   └── login_tests.robot
│
├── resources/                  # Reusable components
│   ├── keywords.robot         # Custom keywords
│   └── variables.robot        # Variables & configurations
│
├── results/                    # Generated reports (ignored in git)
│   ├── log.html
│   ├── report.html
│   └── output.xml
│
├── .gitignore                 # Git ignore file
├── requirements.txt           # Python dependencies
└── README.md                  # This file
```

### 📂 Folder Purposes:

| Folder | Purpose |
|--------|---------|
| `tests/` | Contains all test case files (`.robot`) |
| `resources/` | Reusable keywords, variables, and page objects |
| `results/` | Auto-generated test reports and logs |

---

## 🔑 Common Keywords Reference

### 🌐 Browser & Navigation

| Keyword | Description | Example |
|---------|-------------|---------|
| `Open Browser` | Opens a new browser | `Open Browser  ${URL}  chrome` |
| `Close Browser` | Closes the current browser | `Close Browser` |
| `Go To` | Navigates to URL | `Go To  https://example.com` |
| `Maximize Browser Window` | Maximizes browser | `Maximize Browser Window` |
| `Set Selenium Speed` | Sets delay between commands | `Set Selenium Speed  0.5s` |
| `Get Location` | Returns current URL | `${url}=  Get Location` |
| `Reload Page` | Refreshes the page | `Reload Page` |

### ⌨️ Element Interaction

| Keyword | Description | Example |
|---------|-------------|---------|
| `Input Text` | Enters text in field | `Input Text  id=username  john_doe` |
| `Click Button` | Clicks a button | `Click Button  id=login-button` |
| `Click Element` | Clicks any element | `Click Element  xpath=//a[@href='/']` |
| `Clear Element Text` | Clears input field | `Clear Element Text  id=search` |
| `Press Keys` | Sends keyboard keys | `Press Keys  id=search  ENTER` |
| `Select From List By Value` | Selects dropdown option | `Select From List By Value  id=country  US` |
| `Select Checkbox` | Checks a checkbox | `Select Checkbox  id=terms` |
| `Double Click Element` | Double clicks element | `Double Click Element  id=file` |

### ⏳ Waiting & Validation

| Keyword | Description | Example |
|---------|-------------|---------|
| `Wait Until Element Is Visible` | Waits for element to appear | `Wait Until Element Is Visible  id=result  10s` |
| `Wait Until Page Contains` | Waits for text on page | `Wait Until Page Contains  Success  5s` |
| `Wait Until Page Contains Element` | Waits for element | `Wait Until Page Contains Element  xpath=//div[@class='alert']` |
| `Element Should Be Visible` | Asserts element is visible | `Element Should Be Visible  id=welcome` |
| `Element Text Should Be` | Verifies element text | `Element Text Should Be  id=title  Dashboard` |
| `Page Should Contain` | Checks page contains text | `Page Should Contain  Welcome` |
| `Page Should Contain Element` | Checks element exists | `Page Should Contain Element  id=logout` |
| `Element Should Not Be Visible` | Asserts element hidden | `Element Should Not Be Visible  id=error` |

### 📸 Screenshots & Debugging

| Keyword | Description | Example |
|---------|-------------|---------|
| `Capture Page Screenshot` | Takes screenshot | `Capture Page Screenshot  results/test.png` |
| `Log` | Logs message | `Log  Test started` |
| `Log To Console` | Prints to console | `Log To Console  Debug info` |
| `Get Text` | Gets element text | `${text}=  Get Text  id=message` |
| `Get Title` | Gets page title | `${title}=  Get Title` |

### 🎮 Test Control

| Keyword | Description | Example |
|---------|-------------|---------|
| `Run Keyword If` | Conditional execution | `Run Keyword If  ${status}  Log  Passed` |
| `Run Keyword And Continue On Failure` | Continue on error | `Run Keyword And Continue On Failure  Click Button  id=optional` |
| `Should Be Equal` | Asserts equality | `Should Be Equal  ${actual}  ${expected}` |
| `Should Contain` | Asserts contains | `Should Contain  ${text}  Error` |
| `Should Be True` | Asserts boolean | `Should Be True  ${flag}` |
| `Sleep` | Pauses execution | `Sleep  2s` |

---

## 🚀 Setup & Installation

### Prerequisites:
- ✅ Python 3.7+ installed
- ✅ pip (Python package manager)
- ✅ Chrome or Firefox browser

### Step 1: Install Robot Framework

```bash
pip install robotframework
```

### Step 2: Install SeleniumLibrary

```bash
pip install robotframework-seleniumlibrary
```

### Step 3: Install WebDriver

**For Chrome:**
```bash
pip install webdriver-manager
```

**Or download manually:**
- [ChromeDriver](https://chromedriver.chromium.org/)
- [GeckoDriver (Firefox)](https://github.com/mozilla/geckodriver/releases)

### Step 4: Verify Installation

```bash
robot --version
```

Expected output:
```
Robot Framework 6.1.1 (Python 3.11.0 on win32)
```

---

## ▶️ Running Tests

### Basic Execution

```bash
# Run all tests
robot tests/

# Run specific test file
robot tests/login_tests.robot

# Run with output directory
robot -d results tests/

# Run specific test case
robot -t "Valid Login Test" tests/login_tests.robot
```

### Advanced Options

```bash
# Run with log level
robot --loglevel DEBUG tests/

# Run with variables
robot --variable BROWSER:firefox tests/

# Run with tags
robot --include smoke tests/

# Generate report only
robot --rerunfailed results/output.xml tests/
```

### View Results

After running tests, open these files in browser:
- 📊 `results/report.html` - High-level test report
- 📝 `results/log.html` - Detailed execution log
- 📄 `results/output.xml` - Machine-readable output

---

## ✨ Best Practices

### 1️⃣ **Separation of Concerns**
```robot
✅ GOOD: Use separate files for variables, keywords, tests
❌ BAD: Mix everything in one file
```

### 2️⃣ **Reusable Keywords**
```robot
✅ GOOD: Create custom keywords for repeated actions
*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text     id=user  ${username}
    Input Text     id=pass  ${password}
    Click Button   id=login
```

### 3️⃣ **Descriptive Names**
```robot
✅ GOOD: Valid Login With Correct Credentials
❌ BAD: Test1
```

### 4️⃣ **Use Variables**
```robot
✅ GOOD: ${URL}  https://example.com
❌ BAD: Hardcoded URLs in test cases
```

### 5️⃣ **Proper Documentation**
```robot
*** Test Cases ***
Valid Login Test
    [Documentation]  Verifies user can login with valid credentials
    [Tags]  smoke  login  critical
```

### 6️⃣ **Teardown Usage**
```robot
*** Settings ***
Test Teardown    Close Browser

# Or per test
*** Test Cases ***
My Test
    [Teardown]    Close Browser
```

### 7️⃣ **Explicit Waits**
```robot
✅ GOOD: Wait Until Element Is Visible  id=result  10s
❌ BAD: Sleep  5s
```

---

## 🎓 Advanced Topics

### 1. **Page Object Model (POM)**

Create page-specific keyword files:

```robot
# resources/pages/login_page.robot
*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Click Login Button
    Click Button    id=login-button
```

### 2. **Data-Driven Testing**

```robot
*** Test Cases ***
Login With Multiple Users
    [Template]    Login With Credentials
    standard_user       secret_sauce        # Valid
    locked_out_user     secret_sauce        # Locked
    invalid_user        wrong_password      # Invalid
```

### 3. **Tags for Test Organization**

```robot
*** Test Cases ***
Critical Login Test
    [Tags]    smoke  critical
    Open Login Page
    Login With Valid Credentials

Optional Feature Test
    [Tags]    optional  ui
    Verify Footer Links
```

Run specific tags:
```bash
robot --include smoke tests/
robot --exclude optional tests/
```

### 4. **Variables from Files**

**variables.py:**
```python
URL = "https://www.saucedemo.com/"
VALID_USER = "standard_user"
```

**In test:**
```robot
*** Settings ***
Variables    variables.py
```

### 5. **Custom Python Libraries**

**custom_library.py:**
```python
class CustomLibrary:
    def generate_random_email(self):
        import random
        return f"user{random.randint(1000,9999)}@test.com"
```

**Usage:**
```robot
*** Settings ***
Library    custom_library.py

*** Test Cases ***
Register User
    ${email}=    Generate Random Email
    Input Text    id=email    ${email}
```

---

## 📈 This Project

This project demonstrates:

✅ **Clean structure** - Separation of variables, keywords, tests  
✅ **Reusability** - Custom keywords used across tests  
✅ **Best practices** - Documentation, tags, teardowns  
✅ **Real-world scenario** - Login functionality testing  
✅ **Industry standard** - Used in professional QA teams  

---

## 🎯 Test Scenarios Covered

| Test Case | Description | Expected Result |
|-----------|-------------|-----------------|
| Valid Login | Login with correct credentials | User redirected to inventory page |
| Invalid Login | Login with wrong credentials | Error message displayed |
| Empty Credentials | Submit without username/password | Error message displayed |
| Locked Out User | Login with locked account | Error message displayed |

---

## 🔗 Useful Resources

- 📖 [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- 📚 [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- 💬 [Robot Framework Forum](https://forum.robotframework.org/)
- 🎥 [Robot Framework YouTube Channel](https://www.youtube.com/@RobotFramework)
- 🐙 [Robot Framework GitHub](https://github.com/robotframework/robotframework)

---

## 🤝 Contributing

Want to improve this project? Here's how:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**QA Engineer Learning Robot Framework**

🌟 **Next Steps:**
- ✅ Page Object Model (POM) implementation
- ✅ Playwright integration
- ✅ CI/CD with GitHub Actions
- ✅ API testing with RequestsLibrary
- ✅ Database testing

---

## 🎉 Happy Testing!

*Remember: Good tests are maintainable, readable, and reliable!*

---

**Made with ❤️ and Robot Framework**
