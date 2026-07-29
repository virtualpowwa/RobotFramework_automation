# Robot Framework Automation — Sauce Demo

Simple Robot Framework (SeleniumLibrary) suite covering login scenarios on https://www.saucedemo.com/.

## Setup

```bash
pip install -r requirements.txt
```

You also need a Chrome/Chromedriver on PATH (or install `webdriver-manager` if preferred).

## Run

```bash
robot tests/login.robot
```

This generates `log.html`, `report.html`, and `output.xml` with the results.

## Test coverage

- `tests/login.robot` — TC-001 (valid login), TC-002 (invalid password), TC-003 (locked-out user)

## python -m robot tests/login.robot