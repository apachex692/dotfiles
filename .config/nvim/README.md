# Neovim Configuration (_zero plugins_)

This is my Neovim configuration. I'm a minimalist, and hence I've written all the configurations _from scratch without any plugins._

## Features

1. Full LSP Support for:
   1. Python (with Ruff and Pyright)
   2. Go
   3. Support for Formatting HTML/CSS/JS/Markdown with Prettier
2. Easy Keyboard Bindings
3. Netrw and FZF Support

## Key-mappings

| Mode | Key           | Description                                              |
| ---- | ------------- | -------------------------------------------------------- |
| n    | `<leader>en`  | Open netrw file explorer.                                |
| n    | `<leader>ef`  | Launch FZF file search.                                  |
| n    | `<leader>r`   | Open a global substitution prompt.                       |
| n    | `<leader>bl`  | List open buffers.                                       |
| n    | `<Tab>`       | Switch to the next buffer.                               |
| n    | `<S-Tab>`     | Switch to the previous buffer.                           |
| n    | `<leader>bda` | Close all buffers using a helper.                        |
| n    | `<leader>bdo` | Close all buffers except the current one using a helper. |
| n    | `<leader>t`   | Open a new tab.                                          |
| n    | `<leader>td`  | Close the current tab.                                   |
| n    | `<leader>tp`  | Go to the previous tab.                                  |
| n    | `<leader>tn`  | Go to the next tab.                                      |
| n    | `<leader>h`   | Create a horizontal split.                               |
| n    | `<leader>v`   | Create a vertical split.                                 |
| n    | `<C-h>`       | Move focus to the left window.                           |
| n    | `<C-l>`       | Move focus to the right window.                          |
| n    | `<C-j>`       | Move focus to the window below.                          |
| n    | `<C-k>`       | Move focus to the window above.                          |
| n    | `<leader>qc`  | Close the quickfix list.                                 |
| n    | `<leader>lc`  | Close the location list.                                 |
| n    | `[d`          | Jump to the previous diagnostic.                         |
| n    | `]d`          | Jump to the next diagnostic.                             |
| n    | `<leader>dl`  | Add diagnostics to the location list.                    |
| n    | `<leader>f`   | Format the current buffer using LSP.                     |
| n    | `gd`          | Go to the definition.                                    |
| n    | `gD`          | Go to the declaration.                                   |
| n    | `go`          | Go to the type definition.                               |
| n    | `gr`          | Show references.                                         |
| n    | `gi`          | Go to the implementation.                                |
| n    | `gS`          | Search for symbols in the workspace.                     |
| n    | `K`           | Show hover information for the symbol.                   |
| n    | `<leader>fp`  | Format using Prettier via helper.                        |

---

## User Commands

### Global Commands

| Command       | Description                                  |
| ------------- | -------------------------------------------- |
| `:ApacheX692` | Display the Apache X692 ASCII splash screen. |

### LSP Commands

| Command                                   | Description                                     |
| ----------------------------------------- | ----------------------------------------------- |
| `:LspCapabilities`                        | List all capabilities of active LSP servers.    |
| `:LspInfo`                                | Show health information for LSP.                |
| `:LspEnable {lsp_name}`                   | Enable an LSP client by its name if configured. |
| `:PythonPyrightSetInterpreterPath {path}` | Set the interpreter path for Pyright.           |
| `:MarkdownShowToC`                        | Show the table of contents for Markdown.        |

---

## Auto-Commands

### Global Auto-commands

| Trigger    | Pattern(s)                   | Effect                                          |
| ---------- | ---------------------------- | ----------------------------------------------- |
| `FileType` | `yaml`, `lua`, `html`, `hcl` | Set indentation width to 2 spaces.              |
| `FileType` | `markdown`                   | Disable word wrapping.                          |
| `FileType` | `go`                         | Set indentation width to 4 spaces and use tabs. |

### LSP Auto-commands

| Trigger     | Pattern     | Effect                                    |
| ----------- | ----------- | ----------------------------------------- |
| `LspAttach` | All buffers | Invoke the autocomplete helper on attach. |

---

*Note: Resize key-mappings (`<C-H>`, `<C-L>`, etc.) are currently commented out due to conflict with window focus controls.*

This configuration offers a productive foundation for daily usage and development across languages.
