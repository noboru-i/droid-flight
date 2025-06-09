# Figma Integration for VS Code

This project is configured to integrate with Figma for design-development workflows in VS Code.

## What is Figma Integration?

This setup provides enhanced VS Code support for working with Figma designs, enabling better design-development consistency for the Droid Flight Flutter project.

## Setup Instructions

### 1. Get Figma Access Token

1. Go to [Figma Developer Settings](https://www.figma.com/developers/api#access-tokens)
2. Generate a new access token
3. Copy the token

### 2. Configure Environment

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Add your Figma access token to `.env`:
   ```
   FIGMA_ACCESS_TOKEN=your_actual_token_here
   ```

### 3. VS Code Setup

The project includes VS Code-specific configurations:

- **Extensions**: Recommended extensions are configured in `.vscode/extensions.json`
- **Settings**: JSON file associations and other settings are in `.vscode/settings.json`

Open the project in VS Code to automatically benefit from these configurations.

## Usage

With VS Code and Figma integration, you can:

- Use Figma designs as reference while developing Flutter UI
- Maintain design consistency through proper environment setup
- Access Figma tokens and design specifications
- Ensure UI implementation matches Figma designs

### Development Workflow

1. **Design Reference**: Keep Figma designs open alongside VS Code
2. **Token Access**: Use environment variables to access Figma API when needed
3. **Consistency Checks**: Compare implementation with Figma designs
4. **Component Development**: Build Flutter widgets that match Figma components

## Project Integration

This Flutter project (Droid Flight) is a beta app management tool. With Figma integration, you can:

1. **Design Consistency**: Ensure the app matches Figma designs
2. **Component Development**: Build Flutter widgets that align with Figma components
3. **Design System**: Maintain consistency with the design system
4. **Rapid Development**: Access design specifications directly in VS Code

## Files

- `.env.example` - Environment variables template
- `.env` - Your actual environment variables (gitignored)
- `.vscode/settings.json` - VS Code specific settings
- `.vscode/extensions.json` - Recommended VS Code extensions

## Troubleshooting

### Common Issues

1. **Token not working**: Ensure your Figma token has the correct permissions
2. **Environment variables not loaded**: Ensure `.env` file is in the project root
3. **VS Code extensions not loading**: Check that recommended extensions are installed

### Getting Help

- [Figma API Documentation](https://www.figma.com/developers/api)
- [VS Code Flutter Documentation](https://docs.flutter.dev/development/tools/vs-code)