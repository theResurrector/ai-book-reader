---
description: Scaffold a new book folder from the template and fill in its starting context.
argument-hint: [book-title]
---

Set up a new book for study.

## Steps

1. Determine the book's folder name from `$ARGUMENTS` (slugify it: lowercase,
   spaces → hyphens, drop punctuation). If `$ARGUMENTS` is empty, ask for the title.

2. If `books/<slug>/` already exists, stop and tell me — do not overwrite.

3. Copy `books/_TEMPLATE/` to `books/<slug>/`, including the empty `source/` and
   `notes/` subfolders.

4. Open the new `books/<slug>/CLAUDE.md` and fill in what you can:
   - Replace `[Title]` and `[Field / topic]` using the title I gave you.
   - Leave the glossary, notation, progress tracker, and core-concepts sections as
     empty scaffolding for me to populate as we read.

5. Ask me three things to finish setup (one message, not one at a time):
   - The chapter list, so you can build the progress tracker
   - Any known key terms or notation to seed the glossary
   - Whether I have the first chapter ready to drop into `source/`

6. Confirm the folder is created and show me the path, then tell me I can start with
   `/next-chapter` once a chapter file is in `source/`.

## Rules
- Never overwrite an existing book folder.
- Do not invent book content — only scaffold structure and fill in what I provide.
- Keep the book's CLAUDE.md consistent with the format in `books/_TEMPLATE/CLAUDE.md`.
