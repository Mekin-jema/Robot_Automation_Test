# Robot Framework: How Tests Run (End‑to‑End)

This guide explains, step by step, how your suite runs from the entry command (the "gateway") to browser automation and finally to the generated reports. It also maps which files and folders are used at each step and what outcomes to expect.

---

## 1) Gateway: How You Start a Run

Most common entry commands (from project root):

```bash
# Run the entire test suite
robot -d results tests/

# Run one suite
robot -d results tests/login_tests.robot

# Run one test case by name
robot -d results -t "Valid Login Test" tests/login_tests.robot

# Run by tag (e.g., only smoke)
robot -d results --include smoke tests/
```

- `robot` is the CLI entrypoint (gateway)
- `-d results` sets the output directory for reports, logs, and screenshots
- `tests/` tells Robot where to discover `.robot` test files

Files used:
- Suite files: [tests/login_tests.robot](../tests/login_tests.robot)
- Resources: [resources/variables.robot](../resources/variables.robot), [resources/keywords.robot](../resources/keywords.robot)
- Outputs written to: [results/](../results)

---

## 2) Discovery & Wiring: What Robot Loads First

When you run a command like `robot -d results tests/`, Robot Framework:

1. Discovers test suites in the `tests/` folder (all `.robot` files).
2. Loads each suite’s `*** Settings ***` and resolves `Resource` imports.
   - In [tests/login_tests.robot](../tests/login_tests.robot):
     - `Resource  ../resources/variables.robot`
     - `Resource  ../resources/keywords.robot`
3. Loads libraries declared in resources.
   - In [resources/keywords.robot](../resources/keywords.robot):
     - `Library  SeleniumLibrary`
4. Evaluates suite metadata, `Suite Setup`, `Suite Teardown`, and default `Test Setup`/`Test Teardown`.
   - Suite logs start/end to console (see `Suite Setup`/`Suite Teardown`).
   - `Test Teardown  Close Browser Session` ensures screenshots + cleanup.

At this point, Robot has:
- All variables from [resources/variables.robot](../resources/variables.robot): URLs, browser, credentials, timeouts, locators
- All custom keywords from [resources/keywords.robot](../resources/keywords.robot)
- SeleniumLibrary ready to drive a real browser

---

## 3) Execution Lifecycle (Per Test Case)

For each test case in [tests/login_tests.robot](../tests/login_tests.robot):

1. Test begins (Robot logs start in `results/log.html`).
2. Steps call custom keywords from `resources/keywords.robot`.
3. Custom keywords call SeleniumLibrary keywords which operate the browser.
4. Explicit waits (e.g., `Wait Until Page Contains Element`) ensure the page state is ready before assertions.
5. On completion or failure, `Test Teardown` runs `Close Browser Session` to capture a screenshot and close the browser.

Files involved during execution:
- Test case definitions: [tests/login_tests.robot](../tests/login_tests.robot)
- Keywords & library import: [resources/keywords.robot](../resources/keywords.robot)
- Variables & locators: [resources/variables.robot](../resources/variables.robot)
- Browser driver resolved by Selenium (via installed `selenium` and optionally `webdriver-manager`)
- Artifacts written to: [results/](../results)

---

## 4) What Each Layer Does

- tests/ (the suite)
  - Declares documentation, tags, and which keywords to call (business-readable steps)
  - Example: `Valid Login Test`, `Invalid Login Test`, etc.

- resources/variables.robot
  - Centralizes config: `${URL}`, `${BROWSER}`
  - Manages credentials: `${VALID_USER}`, `${VALID_PASS}`, `${INVALID_USER}`, `${INVALID_PASS}`, `${LOCKED_USER}`
  - Standardizes timeouts: `${DEFAULT_TIMEOUT}`
  - Holds locators: `${LOGIN_USERNAME_FIELD}`, `${LOGIN_PASSWORD_FIELD}`, `${LOGIN_BUTTON}`, `${ERROR_MESSAGE}`, `${INVENTORY_LIST}`

- resources/keywords.robot
  - Reusable actions built on SeleniumLibrary (open page, login, verify outcomes, teardown)
  - Key keywords:
    - `Open Login Page`
    - `Login With Credentials  ${username}  ${password}`
    - `Verify Login Success` / `Verify Login Failure`
    - `Clear Login Fields`
    - `Close Browser Session` (screenshot + close)

- SeleniumLibrary
  - Translates Robot keywords into WebDriver commands (`Open Browser`, `Input Text`, `Click Button`, waits, assertions)

---

## 5) End-to-End Trace: "Valid Login Test"

Source: [tests/login_tests.robot](../tests/login_tests.robot)

Steps:
1. `Open Login Page`
   - Uses `${URL}`, `${BROWSER}` from [resources/variables.robot](../resources/variables.robot)
   - `Open Browser` to `https://www.saucedemo.com/`
   - `Maximize Browser Window`
   - `Title Should Be  Swag Labs` (quick sanity check)
2. `Login With Credentials  ${VALID_USER}  ${VALID_PASS}`
   - Uses locators `${LOGIN_USERNAME_FIELD}`, `${LOGIN_PASSWORD_FIELD}`, `${LOGIN_BUTTON}`
   - Enters credentials and clicks Login
3. `Verify Login Success`
   - `Wait Until Page Contains Element  ${INVENTORY_LIST}  timeout=${DEFAULT_TIMEOUT}`
   - `Location Should Contain  inventory.html`
   - `Page Should Contain Element  ${INVENTORY_LIST}`
4. `Test Teardown  Close Browser Session`
   - `Capture Page Screenshot` saved into `results/`
   - `Close Browser`

Expected outcome:
- Test status: PASS
- Browser navigates to inventory page
- Report and log updated in `results/`

---

## 6) Expected Outcomes (All Included Tests)

- Valid Login Test → User lands on inventory page (PASS)
- Invalid Login Test → Error banner visible (PASS if error shown)
- Empty Credentials Test → Error: "Username is required" (PASS if shown)
- Empty Username Test → Error for missing username (PASS if shown)
- Empty Password Test → Error for missing password (PASS if shown)
- Locked Out User Test → Error indicating locked user (PASS if shown)
- Clear Fields Functionality Test → After clearing, valid login works (PASS)
- Case Sensitive Username Test → Wrong case fails (PASS if failure shown)

All tests:
- Capture a screenshot on teardown
- Write execution to `results/log.html`
- Summarize in `results/report.html`

---

## 7) Outputs & Where to Find Them

After any run with `-d results`:
- Summary report: [results/report.html](../results/report.html)
- Detailed log: [results/log.html](../results/log.html)
- Machine-readable: [results/output.xml](../results/output.xml)
- Screenshots: stored under `results/` (auto-named by Robot/SeleniumLibrary)

Tip: Open `report.html` for quick pass/fail overview; open `log.html` to drill into each keyword step, arguments, timings, and screenshots.

---

## 8) Troubleshooting (Common for New Users)

- "No module named SeleniumLibrary"
  - Install dependencies in your environment:
    ```bash
    pip install -r requirements.txt
    ```
  - Verify `robot --version` prints a version.

- Browser driver issues
  - We installed `selenium` and `webdriver-manager`. Chrome/Edge should work without manual driver downloads.
  - Ensure Chrome is installed and up to date.

- One test fails randomly
  - Replace `Sleep` with explicit waits like `Wait Until Page Contains Element`.
  - Check the exact locator in [resources/variables.robot](../resources/variables.robot).

---

## 9) Mental Model (Call Sequence)

```
robot CLI → load tests/ → load resources/ → import SeleniumLibrary
→ run Test Case steps → call Custom Keywords → SeleniumLibrary actions
→ WebDriver → Browser → Website under test
→ Teardown (screenshot + close) → results/(report.html, log.html, output.xml)
```

That’s the full flow from the entry command to the final reports, with each file and folder’s role along the way.

---

## 10) Environment & Interpreter

- Interpreter: The run uses the Python environment configured for the workspace.
  - A virtual environment `.venv` is created and used so packages are isolated.
  - Dependencies come from [requirements.txt](../requirements.txt).
- Verify environment:
  ```bash
  robot --version
  python --version
  pip list | findstr robotframework
  ```
- If RobotCode extension in VS Code is used, it reads the same interpreter and provides inline run/debug.

---

## 11) CLI Flags Cheat Sheet (Most Useful)

- Output directory: `-d results` → puts logs/reports/screenshots in `results/`
- Select test cases:
  - By name: `-t "Valid Login Test"`
  - By tags: `--include smoke` or `--exclude validation`
- Log level: `--loglevel INFO|DEBUG|TRACE`
- Variables at runtime:
  - `--variable BROWSER:firefox`
  - `--variable URL:https://example.com`
- Rerun failures:
  - First run writes `results/output.xml`
  - Rerun only failed: `robot --rerunfailed results/output.xml tests/`
w
---

## 12) Reports Anatomy

- [results/report.html](../results/report.html):
  - High-level summary (PASS/FAIL), suite hierarchy, durations, tags.
- [results/log.html](../results/log.html):
  - Step-by-step timeline of every keyword call, args, screenshots.
  - Expand a test → see the exact keyword invocations and assertions.
- [results/output.xml](../results/output.xml):
  - Machine-readable data (useful for CI pipelines or reruns).

Tip: Start with `report.html` to see the overview, then drill into `log.html` for details.

---

## 13) Screenshots & Artifacts

- Screenshots are taken in `Close Browser Session` and stored in `results/`.
- You can capture additional screenshots anywhere via `Capture Page Screenshot`.
- Other artifacts (e.g., custom logs) should also be saved under `results/`.

---

## 14) Variables: Where They Come From & Overrides

- Default values live in [resources/variables.robot](../resources/variables.robot).
- Override at runtime using CLI:
  ```bash
  robot -d results --variable BROWSER:firefox tests/
  robot -d results --variable URL:https://www.saucedemo.com/ tests/
  ```
- Why override? To test across browsers or environments without changing files.

---

## 15) Tags: Selecting What to Run

- Tags are defined per test (e.g., `smoke`, `critical`, `negative`).
- Run only smoke:
  ```bash
  robot -d results --include smoke tests/
  ```
- Exclude a category:
  ```bash
  robot -d results --exclude validation tests/
  ```

---

## 16) Running in VS Code (RobotCode Extension)

- The RobotCode extension adds:
  - Inline run buttons in `.robot` files
  - Syntax highlighting, completion, navigation
  - Test explorer for selecting tests/tags
- It uses the workspace interpreter (the `.venv` created for this project).
- If a run fails to find `SeleniumLibrary`, ensure the correct interpreter is selected in VS Code.

---

## 17) CI Example (Optional)

Here’s a minimal GitHub Actions workflow that installs deps and runs the suite:

```yaml
name: Robot Tests
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
      - name: Run Robot tests
        run: |
          robot -d results tests/
      - name: Upload results
        uses: actions/upload-artifact@v4
        with:
          name: robot-results
          path: results
```

---

## 18) Locator Strategies (Stability Tips)

- Prefer stable attributes: `data-test` or unique `id`.
- Avoid brittle XPaths; if using XPath, keep them short and robust.
- Keep all locators centralized in [resources/variables.robot](../resources/variables.robot) for easy maintenance.

---

## 19) Page Object Option (Scaling Up)

- As projects grow, split `resources/keywords.robot` into page-specific files under `resources/pages/`.
- Each page file holds actions for that page only; tests then compose page actions.
- Benefits: Clear boundaries, easier maintenance, fewer locator collisions.

---

## 20) Glossary

- Suite: A `.robot` file (or folder) containing tests.
- Keyword: An executable step (built-in, library, or custom).
- Resource: A `.robot` file imported for variables/keywords.
- Library: A Python/Java package providing keywords (e.g., SeleniumLibrary).
- Teardown: Steps run after a test or suite completes.
- Tag: A label to group or select tests for execution.

