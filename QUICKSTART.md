# 🚀 Quick Start Guide

## Running Your Tests

### Option 1: Run all tests
```bash
robot -d results tests/
```

### Option 2: Run specific test
```bash
robot -d results -t "Valid Login Test" tests/login_tests.robot
```

### Option 3: Run by tags
```bash
# Run only smoke tests
robot -d results --include smoke tests/

# Run all except validation tests
robot -d results --exclude validation tests/
```

## View Results

After running tests, open in your browser:
- 📊 [results/report.html](results/report.html) - Test summary
- 📝 [results/log.html](results/log.html) - Detailed logs

## Project Structure

```
QA test/
├── tests/                    # Your test cases
│   └── login_tests.robot
├── resources/               # Reusable components
│   ├── keywords.robot      # Custom keywords
│   └── variables.robot     # Variables & configs
├── results/                # Test reports (auto-generated)
├── requirements.txt        # Python dependencies
└── README.md              # Full documentation
```

## Need Help?

Check the main [README.md](README.md) for:
- Complete keyword reference
- Setup instructions
- Best practices
- Advanced topics

---

**Happy Testing! 🎉**
