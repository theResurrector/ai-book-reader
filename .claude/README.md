# Claude Code Project Configuration

This `.claude/` folder contains project-level configuration for Claude Code.

## Files

### `settings.json`
Main configuration file for Claude Code in this project. Includes:
- **permissions**: Define which tools Claude can use
- **hooks**: Automated commands and scripts that run on specific events
- **autoMemoryEnabled**: Enable/disable auto-memory for this project

### `keybindings.json`
Custom keyboard shortcuts for this project. You can override global keybindings here.

### `CLAUDE.md` (Optional)
Add a `CLAUDE.md` file at the project root to provide Claude with project-specific instructions and context. This is automatically loaded and helps Claude understand your project structure, conventions, and goals.

## Hooks

Hooks allow you to run scripts automatically on events:

- **SessionStart**: When Claude Code starts
- **UserPromptSubmit**: When you submit a prompt
- **PreToolUse**: Before Claude uses a tool
- **PostToolUse**: After Claude uses a tool
- **SessionEnd**: When Claude Code ends

Example hook (add to `settings.json`):
```json
"hooks": {
  "SessionStart": [
    {
      "type": "command",
      "command": "echo 'Session started'"
    }
  ]
}
```

## Skills

Place custom skill files in `.claude/skills/` to create project-specific commands.
Each skill file should be a YAML or JSON file with the skill definition.

## MCP Servers

Configure Model Context Protocol servers in `.mcp.json` at the project root to extend Claude's capabilities.

## Agents

Define custom agents in `.claude/agents/` directory for specialized workflows.

## Learn More

- [Claude Code Documentation](https://claude.ai/code)
- [Settings Reference](https://docs.anthropic.com/claude-code/settings)
- [Hooks Guide](https://docs.anthropic.com/claude-code/hooks)
