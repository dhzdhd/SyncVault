# Contributing to SyncVault

Thank you for your interest in contributing to SyncVault! This document provides guidelines and instructions for contributing to the project.

## Code of Conduct

- Be respectful and considerate in your interactions
- Focus on constructive feedback
- Help create a welcoming environment for all contributors

## Getting Started

### Prerequisites

- Flutter SDK >= 3.35.0
- Dart SDK >= 3.9.0
- Git
- A code editor (VS Code or Android Studio recommended)

### Development Setup

1. Fork the repository on GitHub

2. Clone your forked repository:
```bash
git clone --depth 1 https://github.com/<your_name>/SyncVault.git
cd SyncVault
```

3. Add upstream remote:
```bash
git remote add upstream https://github.com/dhzdhd/SyncVault
git remote -v  # Verify remotes
```

4. Install dependencies:
```bash
flutter pub get
```

5. Generate code (if needed):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

6. Run the app to verify setup:
```bash
flutter run
```

## Development Workflow

### 1. Keep Your Fork Updated

Always sync with the upstream repository before starting work:
```bash
git checkout master
git pull upstream master
git push origin master
```

### 2. Create a Feature Branch

Create a new branch for your work. Use descriptive names with appropriate prefixes:

- `feat/` or `feature/` - New features
- `fix/` or `bugfix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Test additions or changes
- `chore/` - Build process or auxiliary tool changes

Example:
```bash
git checkout -b feat/add-dropbox-support
```

### 3. Make Your Changes

- Write clean, readable code
- Follow existing code style and conventions
- Add comments for complex logic
- Update documentation as needed
- Add tests for new functionality

### 4. Code Quality

Before committing, ensure your code passes all checks:

```bash
# Format code
dart format .

# Analyze code
dart analyze

# Run tests
flutter test
```

### 5. Commit Your Changes

Write clear, concise commit messages following these guidelines:

- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit first line to 72 characters
- Reference issues and pull requests when relevant

Example:
```bash
git add .
git commit -m "feat: add Dropbox integration for file sync

- Implement Dropbox OAuth2 authentication
- Add file upload/download methods
- Update UI to show Dropbox as provider option

Fixes #123"
```

### 6. Push and Create Pull Request

```bash
git push -u origin feat/add-dropbox-support
```

Then on GitHub:
1. Navigate to your fork
2. Click "Compare & pull request"
3. Ensure you're comparing your feature branch to `upstream/master`
4. Fill in the PR template with:
   - Clear title summarizing the change
   - Description of what changed and why
   - Link to related issues
   - Screenshots for UI changes
   - Any breaking changes or migration notes

### 7. Code Review

- Respond to feedback constructively
- Make requested changes in new commits
- Once approved, a maintainer will merge your PR

## Coding Standards

### Dart/Flutter

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use single quotes for strings
- Prefer `const` constructors where possible
- Use meaningful variable and function names
- Keep functions small and focused on a single task

### Project-Specific Guidelines

- Use `fpdart` for functional error handling (Either, Option, TaskEither)
- Use `freezed` for immutable data classes
- Use `riverpod` for state management
- Log errors appropriately using the error logging system
- Add dartdoc comments to public APIs

### File Organization

- Place related files in appropriate directories under `lib/src/`
- Keep files focused on a single responsibility
- Use barrel files (index.dart) to simplify imports where appropriate

## Testing

- Write unit tests for business logic
- Write widget tests for UI components
- Ensure tests are deterministic and independent
- Place tests in the `test/` directory mirroring `lib/` structure

Example test file:
```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FeatureName Tests', () {
    test('should do something', () {
      // Arrange
      final input = 'test';
      
      // Act
      final result = processInput(input);
      
      // Assert
      expect(result, equals('expected'));
    });
  });
}
```

## Finding Issues to Work On

- Check the [issues page](https://github.com/dhzdhd/SyncVault/issues)
- Look for `good first issue` or `help wanted` labels
- Review [SUGGESTIONS.md](SUGGESTIONS.md) for improvement ideas
- Ask maintainers if you need clarification

## Reporting Bugs

When reporting bugs, include:
- Clear title and description
- Steps to reproduce
- Expected vs actual behavior
- Screenshots if applicable
- Platform and version information
- Error logs (check console output)

## Suggesting Features

When suggesting features:
- Check if it's already been suggested
- Explain the use case and benefits
- Consider implementation complexity
- Be open to discussion and alternatives

## Questions?

If you have questions:
- Check existing documentation
- Search closed issues for similar questions
- Open a new issue with the `question` label
- Be patient waiting for responses

## Recognition

Contributors will be acknowledged in:
- Git commit history
- Release notes
- Project README (for significant contributions)

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to SyncVault! 🎉
