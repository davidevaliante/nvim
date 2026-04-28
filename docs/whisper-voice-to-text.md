# Voice-to-Text for Markdown Files

Speech-to-text functionality using **whisper.nvim** + **whisper.cpp**.

## Keybinding

- `<F5>` - Toggle recording (only in markdown files)

## Prerequisites

### 1. Install Dependencies

```bash
sudo apt install cmake build-essential libsdl2-dev
```

### 2. Build whisper.cpp

```bash
git clone https://github.com/ggerganov/whisper.cpp
cd whisper.cpp
mkdir -p build && cd build
cmake .. -DWHISPER_SDL2=ON
make -j$(nproc)
sudo cp bin/whisper-stream /usr/local/bin/
```

### 3. Download Model

```bash
cd ~/whisper.cpp
bash ./models/download-ggml-model.sh base.en
mkdir -p ~/.local/share/nvim/whisper/models
cp models/ggml-base.en.bin ~/.local/share/nvim/whisper/models/
```

## Usage

1. Open a markdown file (`.md`)
2. Press `<F5>` to start recording
3. Speak into your microphone
4. Press `<F5>` again to stop
5. Text appears at cursor position

You can also use `:WhisperToggle` command.

## Voice Commands

Prepend "markdown" or "mark down" to trigger formatting commands.

All these variations work:
- "markdown new line"
- "mark down new line"
- "Markdown New Line"
- "Mark Down New Line"
- "MARKDOWN NEW LINE"

### Newlines & Spacing

| Say | Result |
|-----|--------|
| "markdown new line" | newline |
| "markdown newline" | newline |
| "markdown new paragraph" | double newline |
| "markdown paragraph" | double newline |
| "markdown break" | double newline |

### Headers

| Say | Result |
|-----|--------|
| "markdown header 1" | `# ` |
| "markdown header 2" | `## ` |
| "markdown header 3" | `### ` |
| "markdown header 4" | `#### ` |
| "markdown h1" | `# ` |
| "markdown h2" | `## ` |
| "markdown h3" | `### ` |
| "markdown h4" | `#### ` |

### Lists

| Say | Result |
|-----|--------|
| "markdown bullet" | `- ` |
| "markdown bullet point" | `- ` |
| "markdown list item" | `- ` |
| "markdown dash" | `- ` |
| "markdown numbered" | `1. ` |
| "markdown number 1" | `1. ` |
| "markdown number 2" | `2. ` |
| "markdown number 3" | `3. ` |

### Text Formatting

| Say | Result |
|-----|--------|
| "markdown bold" | `**` |
| "markdown italic" | `_` |
| "markdown code" | `` ` `` |
| "markdown code block" | ```` ``` ```` |
| "markdown end code" | ```` ``` ```` |

### Other Elements

| Say | Result |
|-----|--------|
| "markdown quote" | `> ` |
| "markdown link" | `[` |
| "markdown checkbox" | `- [ ] ` |
| "markdown checked" | `- [x] ` |
| "markdown horizontal rule" | `---` |
| "markdown hr" | `---` |

## Example Dictation

**Say:** "Meeting notes markdown new line markdown header 2 Action Items markdown new line markdown bullet Review the proposal markdown bullet Send follow-up email"

**Result:**
```markdown
Meeting notes
## Action Items
- Review the proposal
- Send follow-up email
```

## Lualine Status

The status bar shows recording status when active:
- "🎤 Loading..." - Model loading
- "🎤 Recording" - Actively recording
- "🎤 Processing..." - Transcribing audio

## Troubleshooting

### Check binary
```bash
which whisper-stream
```

### Check model
```bash
ls ~/.local/share/nvim/whisper/models/
```

### Health check
```vim
:checkhealth whisper
```

### Manual test
```vim
:WhisperToggle
```

## Configuration

Settings in `lua/custom/plugins/whisper-settings.lua`:

| Option | Default | Description |
|--------|---------|-------------|
| `model` | `base.en` | Model size (tiny.en, base.en, small.en, medium.en) |
| `threads` | `4` | CPU threads |
| `step_ms` | `5000` | Process audio every N ms |
| `length_ms` | `8000` | Audio buffer length |
| `vad_thold` | `0.6` | Voice activity threshold (0.0-1.0) |
| `keybind` | `<F5>` | Toggle key |

## Files

- `lua/custom/plugins/whisper-settings.lua` - Plugin config & voice commands
- `lua/custom/plugins/lualine.lua` - Status bar integration
