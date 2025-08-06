# Recipe App

A beautiful Flutter recipe application converted from Figma design to native Dart code. This app showcases a clean, modern UI for browsing and discovering recipes.

## Features

- **Modern UI Design**: Pixel-perfect implementation of Figma design
- **Recipe Discovery**: Browse through various recipe categories
- **Search Functionality**: Find recipes quickly with the search bar
- **Category Filtering**: Filter recipes by cuisine type (Indian, Italian, Asian, etc.)
- **Recipe Cards**: Beautiful cards showing recipe images, ratings, and cooking time
- **New Recipes Section**: Horizontal scroll list of latest recipes with author information
- **Custom Navigation**: Bottom navigation with floating action button

## Screenshots

The app implements the following design sections:
- Header with personalized greeting and profile avatar
- Search bar with filter functionality
- Category selection tabs
- Horizontal scrollable recipe cards with ratings
- New recipes section with author details
- Custom bottom navigation bar

## Design Features

- **Color Scheme**:
  - Primary: `#129575` (Green)
  - Secondary: `#FFCE80` (Orange)
  - Text: `#484848` (Dark Gray)
  - Placeholder: `#A9A9A9` (Light Gray)

- **Typography**: Poppins font family with various weights
- **Layout**: Responsive design with proper spacing and padding
- **Images**: Network images with error handling and placeholders
- **Interactions**: Category selection, navigation, and smooth scrolling

## Getting Started

### Prerequisites

- Flutter SDK (3.6.0 or higher)
- Dart SDK
- Android Studio / VS Code
- An Android device or emulator

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd recipe_apps
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── screens/
│   ├── home_screen.dart   # Main recipe home screen
│   ├── splash_screen.dart # Splash screen
│   ├���─ signin_screen.dart # Sign in screen
│   └── signup_screen.dart # Sign up screen
fonts/
├── Poppins-Regular.ttf    # Poppins font file
```

## Development

The app is built using:
- **Flutter**: UI framework
- **Dart**: Programming language
- **Material Design**: UI components
- **Custom Widgets**: For specific design elements

### Key Components

1. **HomeScreen**: Main screen containing all recipe functionality
2. **Category Filter**: Horizontal scrollable category buttons
3. **Recipe Cards**: Custom cards with images, ratings, and details
4. **New Recipes**: Horizontal list with author information
5. **Bottom Navigation**: Custom navigation bar with floating button

## Design Conversion

This app was converted from a Figma design to Flutter code, maintaining:
- Exact color specifications
- Proper typography and spacing
- Image placement and sizing
- Interactive elements and states
- Responsive layout principles

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).
# recipe_apps
