# Notification Counter App
A Flutter project implementing a clean-architecture-based notification counter with smooth animations. The counter badge animates when notifications are added, ensuring a responsive and visually engaging user experience. Built with **Riverpod** for scalable state management and following **Clean Architecture** principles for maintainability.

## Tech Stack

- **Flutter**: Cross-platform mobile development framework.  
- **Dart**: Optimized language for building fast, multi-platform apps.  
- **Riverpod**: For state management and dependency injection.  
- **Clean Architecture**: Layered approach ensuring separation of concerns and scalability.  
##  Project Strucutre
```

notification_counter/
├── .dart_tool/
├── .idea/
├── android/
├── assets/
│   ├── fonts
│   ├── icons
│   ├── images
├── build/
├── ios/
├── lib/
│   ├── core/
│   │   ├── helpers/
│   │   ├── routing/
│   │   ├── theming/
│   │   ├── widgets/
│   ├── features/
│   │   ├── notifications/
├── main.dart
├── my_app.dart
├── test/
├── .flutter-plugins
├── .flutter-plugins-dependencies
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── devtools_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── README.md

```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:

    ```bash
    git clone <[repository-url](https://github.com/YousefHanafy-SW-ENG/notification_counter.git)>
    ```

2. Navigate to the project directory:

    ```bash
    cd notification_counter
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the application:

    ```bash
    flutter run
    ```
## Commit Message Format

To maintain a clear and consistent commit history, we follow a specific format:

```
<type>(<scope>): <description>
```

- **Type**: Purpose of the commit (e.g., `feat`, `fix`).
- **Scope**: Part of the system affected (optional).
- **Description**: Concise description of changes.

### Common Types and When to Use Them

- **feat**: Introduces a new feature to the codebase.
- **fix**: Fixes a bug.
- **docs**: Changes to documentation only.
- **style**: Formatting, missing semicolons, etc.; no change in the code logic.
- **refactor**: Refactoring code without changing its behavior or adding features.
- **perf**: Performance improvements.
- **test**: Adding or fixing tests.
- **chore**: Maintenance tasks that don't modify `src` or `test` files.

### Examples

- `feat(auth): Implement user authentication logic`
- `fix(header): Correct misaligned logo in the header`
- `docs(readme): Update installation instructions`
- `style: Apply code formatting to ContactForm component`
- `refactor: Simplify state management in the dashboard`    
    
