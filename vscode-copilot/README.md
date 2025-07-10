# GitHub Copilot + Claude Configuration Guide

## 🎯 Overview

This document provides a comprehensive guide for configuring GitHub Copilot in VS Code with Claude Sonnet 3.5 for frontend development, including global prompts, custom commands, and optimization for your specific tech stack.

## 📋 Table of Contents

1. [Configuration Summary](#configuration-summary)
2. [Tech Stack Context](#tech-stack-context)
3. [Global Prompt Configuration](#global-prompt-configuration)
4. [Custom Slash Commands](#custom-slash-commands)
5. [Workflow Examples](#workflow-examples)
6. [Keyboard Shortcuts](#keyboard-shortcuts)
7. [Code Snippets](#code-snippets)
8. [Best Practices](#best-practices)
9. [Troubleshooting](#troubleshooting)
10. [Advanced Usage](#advanced-usage)

## 🔧 Configuration Summary

### Files Created/Modified

- **`.vscode/settings.json`** - Main configuration with global prompts and VS Code settings
- **`.vscode/copilot-commands.json`** - Custom command definitions (user-modified)
- **`.vscode/copilot-prompts.md`** - Prompt templates library (user-modified)
- **`.vscode/frontend-copilot.code-snippets`** - Custom code snippets with Copilot integration

### Key Features Configured

✅ **Claude Sonnet 3.5 (20241022)** - Latest model integration  
✅ **Global Frontend Expert Prompt** - Always active for all interactions  
✅ **Custom Slash Commands** - Specialized prompts for specific tasks  
✅ **Optimized File Associations** - Better context for your project types  
✅ **Enhanced IntelliSense** - Improved code completion and imports  
✅ **Auto-formatting Integration** - ESLint and Stylelint on save  
✅ **Custom Code Snippets** - Templates with built-in Copilot prompts  

## 🛠️ Tech Stack Context

Your configuration is optimized for:

### **Build Tools & Bundling**

- Webpack (with custom configurations)
- Babel (ES6+ transpilation)
- PostCSS (CSS processing)

### **Frontend Frameworks**

- Lit Web Components & Custom Elements
- Storybook (component development)
- Cypress (E2E testing)

### **Styling & CSS**

- Tailwind CSS (utility-first approach)
- SCSS/CSS3 (modern CSS features)
- Responsive design principles

### **Languages & Standards**

- JavaScript/TypeScript (ES6+)
- HTML5 (semantic markup)
- Modern web standards

### **Project Structure**

- Multi-project workspace
- Component-based architecture
- Enterprise/government applications

## 🎯 Global Prompt Configuration

The global prompt is automatically applied to all Copilot interactions and includes:

### **Technical Expertise**

- Senior frontend developer persona
- Modern web technologies specialization
- Enterprise-grade application experience

### **Coding Standards**

- Clean, maintainable code
- Semantic HTML and WCAG accessibility
- Modern JavaScript patterns
- Responsive design principles
- Performance optimization focus

### **Response Format**

- Complete, working code solutions
- Architectural decision explanations
- Performance optimization suggestions
- Accessibility considerations
- Cross-browser compatibility notes

## 📝 Custom Slash Commands

### **Component Development**

```bash
@copilot /component-analyze    # Analyze web component architecture
@copilot /generate-tests       # Create comprehensive test suites
@copilot /a11y-review         # Accessibility compliance check
```

### **Performance & Optimization**

```bash
@copilot /bundle-optimize      # Webpack bundle optimization
@copilot /performance-analyze  # Runtime performance analysis
```

### **Architecture & Planning**

```bash
@copilot /architecture-plan    # Design scalable component architecture
@copilot /migration-help       # Assist with upgrades and migrations
```

### **Development Support**

```bash
@copilot /debug-assist        # Debugging and troubleshooting
@copilot /code-review         # Comprehensive code review
@copilot /generate-docs       # Documentation generation
```

## 🚀 Workflow Examples

### **Component Development Workflow**

1. **Create Component**

   ```javascript
   // Use snippet: lit-component-copilot
   @copilot /component-analyze
   
   import { LitElement, html, css } from 'lit';
   // ... component code
   ```

2. **Architecture Review**

   ```bash
   @copilot /component-analyze
   
   Analyze this web component for:
   - Architecture and design patterns
   - Performance optimizations
   - Accessibility compliance
   ```

3. **Test Generation**

   ```bash
   @copilot /generate-tests
   
   Create comprehensive tests including:
   - Unit tests with modern frameworks
   - Cypress E2E tests
   - Accessibility testing
   ```

4. **Accessibility Check**

   ```bash
   @copilot /a11y-review
   
   Review for WCAG 2.1 AA compliance:
   - Semantic HTML structure
   - ARIA attributes
   - Keyboard navigation
   ```

### **Performance Optimization Workflow**

1. **Bundle Analysis**

   ```bash
   @copilot /bundle-optimize
   
   Review Webpack configuration for:
   - Bundle size reduction
   - Code splitting strategies
   - Tree shaking effectiveness
   ```

2. **Runtime Performance**

   ```bash
   @copilot /performance-analyze
   
   Analyze performance aspects:
   - Component rendering optimization
   - Memory usage patterns
   - CSS performance with Tailwind
   ```

### **Code Quality Workflow**

1. **Code Review**

   ```bash
   @copilot /code-review
   
   Comprehensive review focusing on:
   - Code quality and maintainability
   - Security considerations
   - Performance implications
   ```

2. **Debugging**

   ```bash
   @copilot /debug-assist
   
   Help debug by:
   - Analyzing error messages
   - Suggesting debugging strategies
   - Creating reproduction cases
   ```

## ⌨️ Keyboard Shortcuts

### **Quick Access Shortcuts**

- `Cmd+Shift+C, Cmd+A` - Open Copilot Chat
- `Cmd+Shift+C, Cmd+R` - Explain selected code
- `Cmd+Shift+C, Cmd+T` - Generate tests
- `Cmd+Shift+C, Cmd+F` - Fix issues
- `Cmd+Shift+C, Cmd+O` - Optimize code
- `Cmd+Shift+C, Cmd+D` - Generate documentation

### **Usage Pattern**

1. Press `Cmd+Shift+C` to start Copilot command
2. Press second key combination for specific action
3. Copilot will analyze context and provide assistance

## 📄 Code Snippets

### **Available Snippets**

#### **`lit-component-copilot`**

Creates a Lit component with built-in Copilot analysis prompt

```javascript
@copilot /component-analyze

import { LitElement, html, css } from 'lit';
// ... full component template
```

#### **`copilot-test`**

Generates test structure with Copilot test generation prompt

```javascript
@copilot /generate-tests

describe('ComponentName', () => {
  // ... test template
});
```

#### **`copilot-perf`**

Performance analysis request template

```javascript
@copilot /performance-analyze

// Performance considerations for component/feature
```

#### **`copilot-a11y`**

Accessibility review request template

```javascript
@copilot /a11y-review

// Accessibility review needed for:
```

#### **`webpack-copilot`**

Webpack configuration with optimization prompt

```javascript
@copilot /bundle-optimize

// Webpack configuration for project
module.exports = {
  // Configuration here
};
```

## 📚 Best Practices

### **Effective Prompt Usage**

1. **Be Specific**
   - Include relevant context about your component/feature
   - Mention specific technologies in use
   - Provide error messages or code snippets

2. **Use Custom Commands**
   - Leverage specialized prompts for better results
   - Combine multiple commands for comprehensive analysis
   - Reference your project structure and constraints

3. **Iterate and Refine**
   - Ask follow-up questions for clarification
   - Request specific examples or alternatives
   - Validate suggestions against your requirements

### **Code Quality Guidelines**

1. **Always Consider**
   - Accessibility from the start
   - Performance implications
   - Browser compatibility
   - Maintainability and documentation

2. **Test-Driven Development**
   - Generate tests alongside components
   - Include accessibility testing
   - Create E2E test scenarios

3. **Performance-First Approach**
   - Optimize bundle size during development
   - Monitor component rendering performance
   - Implement lazy loading where appropriate

## 🔍 Troubleshooting

### **Common Issues**

#### **Copilot Not Using Global Prompt**

- **Solution**: Restart VS Code to reload settings
- **Check**: Ensure `github.copilot.chat.experimental.instructions` is set correctly

#### **Model Not Available**

- **Solution**: Verify your GitHub Copilot subscription supports Claude models
- **Check**: Update model identifier in settings if needed

#### **Commands Not Working**

- **Solution**: Ensure commands are properly formatted with `@copilot /command`
- **Check**: Verify VS Code has latest GitHub Copilot extension

#### **IntelliSense Issues**

- **Solution**: Run `TypeScript: Restart TS Server` command
- **Check**: Ensure project dependencies are installed

### **Debug Steps**

1. **Check Extension Status**

   ```bash
   code --list-extensions | grep copilot
   ```

2. **Verify Settings**
   - Open VS Code settings
   - Search for "copilot"
   - Confirm model and instructions are set

3. **Test Basic Functionality**
   - Open Copilot Chat
   - Ask a simple question
   - Verify response includes context from global prompt

## 🚀 Advanced Usage

### **Multi-Project Workspace Optimization**

1. **Project-Specific Context**

   ```bash
   @copilot I'm working on the interactive-map project. 
   This uses Leaflet for mapping functionality.
   /component-analyze
   ```

2. **Cross-Project Consistency**

   ```bash
   @copilot Ensure this component follows the same patterns 
   as the webpack-web-components library.
   /architecture-plan
   ```

### **Integration with Development Tools**

1. **Storybook Integration**

   ```bash
   @copilot Create Storybook stories for this component
   including all property variations and interaction states.
   /generate-docs
   ```

2. **Cypress Testing**

   ```bash
   @copilot Generate Cypress E2E tests for this user flow
   considering our multi-step form interactions.
   /generate-tests
   ```

### **Performance Monitoring**

1. **Bundle Analysis**

   ```bash
   @copilot Analyze webpack-bundle-analyzer output
   and suggest optimizations for our current bundle size.
   /bundle-optimize
   ```

2. **Runtime Monitoring**

   ```bash
   @copilot Help implement performance monitoring
   for this component using web vitals metrics.
   /performance-analyze
   ```

## 📊 Configuration Details

### **VS Code Settings Applied**

```json
{
  "github.copilot.chat.experimental.model": "claude-3-5-sonnet-20241022",
  "github.copilot.chat.experimental.instructions": "// Global frontend expert prompt",
  "github.copilot.editor.enableAutoCompletions": true,
  "github.copilot.chat.useProjectTemplates": true,
  "github.copilot.chat.experimental.contextSelection": "auto"
}
```

### **File Associations**

```json
{
  "files.associations": {
    "*.stories.js": "javascript",
    "*.config.js": "javascript",
    "*.spec.js": "javascript",
    "webpack.*.js": "javascript"
  }
}
```

### **Enhanced IntelliSense**

```json
{
  "typescript.preferences.includePackageJsonAutoImports": "auto",
  "typescript.suggest.autoImports": true,
  "javascript.suggest.autoImports": true
}
```

## 📝 Notes

- **Model Updates**: GitHub Copilot model identifiers may change. Check VS Code settings for latest available models.
- **Feature Availability**: Some experimental features may require VS Code Insiders or specific extension versions.
- **Performance**: Large prompts may affect response time. Optimize prompts for your specific use cases.
- **Customization**: All configurations can be modified to match your specific development preferences and requirements.

## 🎯 Quick Reference

### **Essential Commands**

- `@copilot /component-analyze` - Component review
- `@copilot /generate-tests` - Test creation
- `@copilot /a11y-review` - Accessibility check
- `@copilot /bundle-optimize` - Performance optimization
- `@copilot /debug-assist` - Debugging help

### **File Locations**

- Settings: `.vscode/settings.json`
- Prompts: `.vscode/copilot-prompts.md`
- Snippets: `.vscode/frontend-copilot.code-snippets`

### **Key Shortcuts**

- `Cmd+Shift+C` + second key for quick commands
- Use tab completion for snippet insertion
- Reference prompt templates for complex requests

---

*This configuration optimizes GitHub Copilot for modern frontend development with your specific tech stack and coding standards. Regular updates and refinements will help maintain optimal performance and relevance.*
