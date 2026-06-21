---
name: chapter-breakdown
description: Use when the user provides a book chapter or section to study. Produces a structured deep-reading breakdown following the concept → equations → figures → connections format. Trigger whenever a chapter PDF or text is pasted, or when the user says "break down", "explain this chapter", or runs /next-chapter.
---

# Chapter Breakdown

Read the entire provided chapter before writing anything. Then produce a breakdown
in exactly this structure.

## 1. Concept Summary
Explain what the chapter is about in plain language a beginner can follow. Name the
core idea and why it matters within the book's larger argument.

## 2. Key Equations
For every equation in the chapter:
- State it and name each variable
- Explain what it computes and when it is used
- Work a numerical example, using the book's own numbers when available

## 3. Figures Explained
For every figure, chart, diagram, and table:
- Describe axes, series, legends, and what is plotted
- Interpret what the figure demonstrates
- Note any asymmetry, skew, trend, or feature the text highlights
If a figure is referenced but not visible, flag it and reason from the surrounding text.

## 4. Connections
Link this chapter's concepts back to earlier chapters and to the book's glossary.
Show how the new material feeds into what comes next.

## Constraints
- Sole source of truth is the provided text. No outside knowledge unless asked.
- Use the book's own terminology and notation throughout.
- Save the finished breakdown to the active book's `notes/` folder.
- Remind the user to update the book's progress tracker afterward.
