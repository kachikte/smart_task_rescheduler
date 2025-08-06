# Smart Task Rescheduler

A modern Task Management App with AI features built with Flutter. This app allows users to manage tasks and projects efficiently while integrating AI features to improve productivity and user experience.

## Features

### Core Features
- **Authentication**: Email & password login and registration with input validation
- **Project Management**: Create, edit, and delete projects with color coding
- **Task Management**: Create, edit, and delete tasks with priorities and due dates
- **Offline Support**: All data is persisted locally using Hive database
- **Mock API Integration**: Simulated backend calls with loading states and error handling

### AI Integration
- **AI Task Assistant**: Generate tasks based on natural language prompts
- **Smart Task Rescheduler**: AI-powered suggestions for rescheduling overdue tasks
- **Sample Prompts**: Pre-built prompts for common use cases

### Additional Features
- **Modern UI**: Material 3 design with light/dark theme support
- **State Management**: Riverpod for efficient state management
- **Responsive Design**: Works on various screen sizes
- **Real-time Updates**: Automatic UI updates when data changes

## Current Status

This is a **work-in-progress** implementation. The current version includes:

✅ **Completed:**
- Basic app structure and architecture
- Authentication UI (login screen)
- Modern Material 3 theme with light/dark mode
- Form validation and error handling
- Responsive design
- Unit tests for core functionality

🔄 **In Progress:**
- State management with Riverpod
- Local data persistence with Hive
- Project and task management screens
- AI integration features

📋 **Planned:**
- Complete authentication flow
- Project creation and management
- Task creation and management
- AI assistant integration
- Push notifications
- Advanced features

## Architecture

The app follows a clean architecture pattern with the following layers:

```
lib/
├── core/                    # Core business logic
│   ├── models/             # Data models (User, Project, Task)
│   ├── services/           # Business services (Auth, Storage, AI)
│   └── utils/              # Utility functions
├── features/               # Feature modules
│   ├── auth/               # Authentication feature
│   ├── projects/           # Project management feature
│   ├── tasks/              # Task management feature
│   └── ai_assistant/       # AI integration feature
└── shared/                 # Shared components
    ├── constants/          # App constants
    ├── theme/              # Theme configuration
    └── widgets/            # Reusable widgets
```

### State Management
- **Riverpod**: Used for state management with providers
- **Hive**: Local database for offline data persistence
- **SharedPreferences**: For storing authentication tokens

### Key Technologies
- **Flutter 3.x**: Cross-platform UI framework
- **Riverpod**: State management solution
- **Hive**: NoSQL database for local storage
- **OpenAI API**: AI task generation (with mock fallback)

## Setup Instructions

### Prerequisites
- Flutter SDK 3.x or higher
- Dart SDK 3.x or higher
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd smart_task_rescheduler
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   - Copy the `.env` file and update it with your API keys:
   ```bash
   cp .env.example .env
   ```
   - Update the `.env` file with your OpenAI API key:
   ```
   OPENAI_API_KEY=your_openai_api_key_here
   ```

4. **Generate code (if needed)**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

#### OpenAI API Setup (Optional)
1. Get an API key from [OpenAI](https://platform.openai.com/)
2. Add it to your `.env` file
3. The app will use mock responses if no API key is provided

#### Mock Mode
The app works completely offline with mock data. No API key is required for basic functionality.

## Usage Guide

### Current Features
1. **Login Screen**: Enter email and password to sign in
2. **Form Validation**: Real-time validation of input fields
3. **Theme Support**: Automatic light/dark theme switching
4. **Responsive Design**: Works on various screen sizes

### Planned Features
- **Registration**: Create new user accounts
- **Dashboard**: Overview of projects and tasks
- **Project Management**: Create and manage projects
- **Task Management**: Create, edit, and complete tasks
- **AI Assistant**: Generate tasks using natural language

## Development

### Code Generation
The app uses code generation for:
- Hive adapters (database models)
- JSON serialization
- Riverpod providers

Run code generation when you modify models:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Testing
Run tests with:
```bash
flutter test
```

### Building for Production
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## Project Structure

### Models
- **User**: Authentication and user profile data
- **Project**: Project information with color coding
- **Task**: Task details with priority and due date

### Services
- **AuthService**: Handles authentication and user management
- **StorageService**: Manages local data persistence
- **AIService**: Handles AI task generation and rescheduling

### Providers
- **AuthNotifier**: Manages authentication state
- **ProjectsNotifier**: Manages project data
- **TasksNotifier**: Manages task data
- **AIServiceNotifier**: Manages AI service state

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the repository
- Check the documentation
- Review the code comments

## Roadmap

- [x] Basic app structure and authentication UI
- [x] Material 3 theme with light/dark mode
- [x] Form validation and error handling
- [x] Unit tests
- [ ] Complete authentication flow
- [ ] Project management screens
- [ ] Task management screens
- [ ] AI assistant integration
- [ ] Push notifications for due tasks
- [ ] Team collaboration features
- [ ] Advanced AI features
- [ ] Calendar integration
- [ ] Export/import functionality
- [ ] Mobile app store deployment
