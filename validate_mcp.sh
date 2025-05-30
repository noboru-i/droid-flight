#!/bin/bash

# Figma MCP Configuration Validator
echo "🔍 Validating Figma MCP Setup..."

# Check if configuration files exist
echo "📁 Checking configuration files..."

if [ -f "mcp_config.json" ]; then
    echo "✅ mcp_config.json found"
else
    echo "❌ mcp_config.json missing"
    exit 1
fi

if [ -f ".claude/claude_desktop_config.json" ]; then
    echo "✅ Claude Desktop config found"
else
    echo "❌ Claude Desktop config missing"
    exit 1
fi

if [ -f ".env.example" ]; then
    echo "✅ Environment template found"
else
    echo "❌ Environment template missing"
    exit 1
fi

# Validate JSON syntax
echo "🔧 Validating JSON syntax..."

if command -v node &> /dev/null; then
    if node -e "JSON.parse(require('fs').readFileSync('mcp_config.json', 'utf8'))" 2>/dev/null; then
        echo "✅ mcp_config.json is valid JSON"
    else
        echo "❌ mcp_config.json has invalid JSON syntax"
        exit 1
    fi

    if node -e "JSON.parse(require('fs').readFileSync('.claude/claude_desktop_config.json', 'utf8'))" 2>/dev/null; then
        echo "✅ Claude config is valid JSON"
    else
        echo "❌ Claude config has invalid JSON syntax"
        exit 1
    fi
else
    echo "⚠️  Node.js not found, skipping JSON validation"
fi

# Check environment setup
echo "🌍 Checking environment setup..."

if [ -f ".env" ]; then
    if grep -q "FIGMA_ACCESS_TOKEN" .env; then
        echo "✅ Environment file configured"
    else
        echo "⚠️  Environment file exists but FIGMA_ACCESS_TOKEN not set"
    fi
else
    echo "⚠️  No .env file found. Copy .env.example to .env and configure your tokens"
fi

echo ""
echo "🎉 MCP Configuration validation complete!"
echo ""
echo "Next steps:"
echo "1. Copy .env.example to .env"
echo "2. Add your Figma access token to .env"
echo "3. Install MCP server: npm install -g @anthropic/figma-mcp"
echo "4. Restart Claude Desktop if it's running"