# Conventional Commit Message

You are an expert in Conventional Commits.

Based on the following code changes (diff), generate a conventional commit message.

The message should follow this format:
`type(scope): subject`

- **type:** Must be one of `feat`, `fix`, `build`, `chore`, `ci`, `docs`, `perf`, `refactor`, `revert`, `style`, `test`.
- **scope:** (optional) The part of the codebase affected. For this project, it's usually the component name (e.g., `button`, `project`, `rolldown-vite`).
- **subject:** A short, imperative-tense description of the change.

**Diff:**

```diff
{{diff}}
```

**Additional Context/Description of changes:**
`{{description}}`

Generate the commit message.
