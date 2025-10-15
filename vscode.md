
# Make `cmd+N` to start new terminal tab in terminal (just like iTerm2 and similar)

- Cmd+P: `> Open Keyboard Shortcuts (JSON)`
- Add the following content
```json
    {
        "key": "cmd+n",
        "command": "workbench.action.terminal.new",
        "when": "terminalFocus"
    }
```

Prompt: `in vscode, I want to create a new terminal tab when press cmd+N when focus in terminal tab`

Link: https://x.com/i/grok/share/swP2NIQecRAGAy2IoS6zLdHee