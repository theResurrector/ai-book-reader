#!/usr/bin/env bash
# Optional Stop hook: gentle nudge to keep the progress tracker current.
# This is deliberately minimal — a reading project has little to automate
# deterministically. Delete this hook and its settings.json entry if you
# do not want it.

echo "Reminder: if you finished a chapter, update the progress tracker in the active book's CLAUDE.md."
exit 0
