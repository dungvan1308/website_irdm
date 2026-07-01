# Project Structure

## Purpose

Define the repository structure and folder responsibilities for the IRDM project.

---

## Scope

Applies to the entire project repository.

---

## Repository Structure

```text
IRDM/

├── .github/
├── apps/
├── config/
├── docs/
├── locale/
├── media/
├── requirements/
├── scripts/
├── static/
├── templates/
├── tests/
├── manage.py
├── Dockerfile
├── docker-compose.yml
├── README.md
└── .env.example
```

---

## Folder Responsibilities

| Folder | Responsibility |
|----------|----------------|
| `.github` | GitHub Copilot, CI/CD, GitHub configuration |
| `apps` | Business applications |
| `config` | Django project configuration |
| `docs` | AI specifications and project documentation |
| `locale` | Translation files |
| `media` | User uploaded files |
| `requirements` | Python dependencies |
| `scripts` | Utility and deployment scripts |
| `static` | CSS, JavaScript, Fonts, Images |
| `templates` | Django templates |
| `tests` | Automated tests |

---

## Naming Convention

Folders

- snake_case

Python Modules

- snake_case

Classes

- PascalCase

Functions

- snake_case

Templates

- snake_case

URLs

- kebab-case

Constants

- UPPER_CASE

---

## Repository Principles

- Feature-based organization
- Business modules are isolated
- Shared code belongs to common modules
- Documentation separated from source code
- Static files separated from uploaded media
- Configuration separated from business logic

---

## AI Notes

Always

- Follow the repository structure.
- Reuse existing folders.
- Keep modules independent.
- Keep the repository organized.

Never

- Create arbitrary folders.
- Mix unrelated business domains.
- Store uploaded files inside `static`.
- Place business logic in configuration.

---

## Definition of Done

- Repository structure approved.
- Folder responsibilities approved.
- Naming conventions approved.
- Repository principles approved.