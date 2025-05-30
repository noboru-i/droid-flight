# Figma MCP Setup

This project is configured to use Figma Model Context Protocol (MCP) for AI-assisted design workflows.

## What is MCP?

Model Context Protocol (MCP) is an open standard that enables AI assistants to securely connect to external data sources and tools. The Figma MCP server allows Claude and other AI assistants to interact with Figma designs.

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

### 3. Install MCP Server

The Figma MCP server will be automatically installed when Claude Desktop connects. If you need to install it manually:

```bash
npm install -g @anthropic/figma-mcp
```

### 4. Configure Claude Desktop

The configuration is already set up in `.claude/claude_desktop_config.json`. Claude Desktop will automatically use this configuration when you open this project.

## Usage

Once configured, you can ask Claude to:

- Analyze Figma designs
- Extract design tokens (colors, typography, spacing)
- Generate Flutter code from Figma components
- Compare designs with current implementation
- Suggest improvements to match Figma designs

### Example Prompts

- "Analyze the app design in Figma and suggest improvements to our Flutter UI"
- "Extract the color palette from our Figma design file"
- "Generate Flutter code for the button components in our design system"
- "Compare our current app layout with the Figma mockups"

## Project Integration

This Flutter project (Droid Flight) is a beta app management tool. With Figma MCP, you can:

1. **Design Consistency**: Ensure the app matches Figma designs
2. **Component Generation**: Generate Flutter widgets from Figma components
3. **Design System**: Maintain consistency with the design system
4. **Rapid Prototyping**: Quickly implement new designs

## Files

- `mcp_config.json` - MCP server configuration
- `.claude/claude_desktop_config.json` - Claude Desktop configuration
- `.env.example` - Environment variables template
- `.env` - Your actual environment variables (gitignored)

## Troubleshooting

### Common Issues

1. **Token not working**: Ensure your Figma token has the correct permissions
2. **MCP server not starting**: Check that Node.js and npm are installed
3. **Environment variables not loaded**: Ensure `.env` file is in the project root

### Getting Help

- [Figma API Documentation](https://www.figma.com/developers/api)
- [MCP Specification](https://modelcontextprotocol.io/)
- [Claude Desktop Documentation](https://claude.ai/desktop)