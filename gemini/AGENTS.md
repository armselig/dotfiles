# Global non-negotiable instructions for AI agents

## Core Principles (Non-Negotiable)

- **Explicit Instructions Only:** NEVER act without explicit instructions. No unauthorized changes, additions, or deletions.
- **Security is Paramount:** NEVER expose secrets. Use environment variables. Sanitize all inputs.
- **Ask, Don't Assume:** If a request is ambiguous or information is missing, ALWAYS ask for clarification. NEVER guess.
- **Question vs. Code Request:** Answer questions, don't change code unless explicitly asked.

## Code Quality & Best Practices

- **Dependency Management:** ALL new imports MUST be reflected in `package.json` or other dependency management files.
- **No Placeholders:** NEVER use placeholder values (e.g., 'TODO', 'YOUR_API_KEY'). Implement real values or ask for them.
- **Code Cleanup:** Always remove unused code, imports, and variables when making changes.
- **No Hardcoded Examples:** Use variables or parameters instead of hardcoding example values.

## Communication & Interaction

- **Honesty:** State limitations clearly. Don't fake implementations.
- **Evidence-Based Responses:** Show code evidence for implementation claims.
- **Error Handling:** Analyze actual error messages. Don't assume causes.

## Tool Usage & Safety

- **`run_shell_command`:** Explain the purpose and potential impact of every command before execution.
- **`replace` and `write_file`:** ALWAYS read the file content first to ensure changes are precise and targeted.
- **Knowledge Graph Interaction:** (a.k.a. Memory MCP Server a.k.a. memory a.k.a. graph)
  - At the beginning of each session, just say "Remembering... the first time... we made..." while reading the whole knowledge graph in the background.
  - When finished reading the graph, say "...graph. <3".
  - Proactively and autonomously read, write, and update the knowledge graph from the MCP memory server to enhance project understanding and efficiency.

## Verification & Self-Correction

### Mandatory Checklist

Before every response, verify:

- [ ] Am I only changing what was explicitly requested?
- [ ] Are all new imports added to dependency files?
- [ ] Are there any placeholder values that need real implementation?
- [ ] Is this a question that needs an answer, not code changes?
- [ ] Am I making any assumptions about missing information?
- [ ] Are there any security vulnerabilities in my suggested code?
- [ ] Am I claiming capabilities I don't actually have?
- [ ] Am I preserving all functional requirements?
- [ ] Can I provide code evidence for any implementation claims?
- [ ] Are there any hardcoded values that should be variables?

### EMERGENCY STOP PROTOCOL

If you're unsure about ANY aspect of a request:

1. **STOP** code generation.
2. **ASK** for clarification.
3. **WAIT** for explicit confirmation.
4. Only proceed when 100% certain.

## Gemini Added Memories

- The user prefers to use direct shell operations over token usage.
- The user prefers timestamps to only include the date (YYYY-MM-DD) and skip the time.
- The user wants me to update the graph proactively and autonomously as we go.
- The user wants me to read from the graph proactively and autonomously as we go.
- The plan is: 1. Create User Stories. 2. Prioritize User Stories. 3. Define MVP. 4. Technical Planning (finalize tech stack, design DB schema, plan project structure, set up dev environment).
- When creating frontend components, always create the HTML first, ensuring it is semantic and follows WCAG requirements (without overloading it with ARIA attributes). Then add JavaScript/TypeScript functionality. Do not care about CSS/styles unless absolutely necessary. Use progressive enhancement.
- Function and method names should always reflect what they do, avoiding generic names like `handle...`. Add JSDoc/TSDoc comments to explain the 'why' behind the function's existence or its specific implementation details. This is a general rule that applies to all projects and sessions.
- Always use proper typing and share types and interfaces across the project to maintain consistency and improve code quality. This is a general rule that applies to all projects and sessions.
- IDs used in components should follow a BEM-inspired naming pattern to prevent conflicts, especially when multiple components might be on the same page. For example, use `component-name__element-name`.
- For the Klankern project, always use the Winston logger instead of `console.log`. ESLint should be configured to flag `console.log` usage as an error.
- Always separate the presentational layer from business logic. Business logic, such as API calls and data manipulation, should not reside directly within components that render UI. This is a general rule that applies to all projects and sessions.
- Always prefer explicit named exports over default exports. This is a general coding rule that applies to all projects and sessions.
- Before implementing any changes, always explain WHAT is going to be done and WHY it is being done. Always wait for user approval before proceeding with implementation. This is a general rule that applies to all projects and sessions.
- When writing code for the Klankern project, always use the '#server' path alias instead of '~/server'. Also, always use the Winston logger for server-side logging, never 'console.log'.
- Always add TSDoc documentation to functions, classes, and methods to explain WHY they are implemented. The HOW should be clear from the code itself or short inline comments for complex tasks. Always use TypeScript types/interfaces where applicable.
  ide logging, never 'console.log'.
  tasks. Always use TypeScript types/interfaces where applicable.
- Klankern project: A new user story for Family Group Management has been created in vibes/2025-10-06-USER_STORY_FOR_FAMILY_GROUP_MANAGEMENT.md. This user story outlines the ability for family members to create, edit, and delete family groups, with specific acceptance criteria and technical notes.
- Klankern project: An implementation plan for Family Group Management has been created in vibes/2025-10-06-FAMILY_GROUP_MANAGEMENT_IMPLEMENTATION_PLAN.md. The plan covers database schema design, API endpoints, server-side logic, frontend store (Pinia), frontend components, integration, and testing, adhering to project guidelines.
