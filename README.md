# rubocop

Action to run rubocop with matchers on a repository

## Usage

```yaml
name: ci

on: [push, pull_request]

jobs:
  ci:

    runs-on: ubuntu-latest

    steps:
    - name: Check out code
      uses: actions/checkout@main
    - name: Run Chef Delivery
      uses: actionshub/rubocop@main
```
