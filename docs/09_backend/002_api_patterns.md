# API Patterns

## Purpose

Define API design principles and implementation standards for the IRDM Enterprise Website.

---

## Scope

Applies to

- Internal APIs
- HTMX Endpoints
- AJAX Endpoints
- Integration APIs
- Future Public APIs

---

## API Principles

- RESTful
- Resource-Oriented
- Stateless
- Secure
- Version Ready
- Consistent
- Reusable

---

## API Usage

Use APIs for

- HTMX interactions
- Search
- Filtering
- Autocomplete
- File Upload
- External Integration
- Future Mobile Applications

Do not build APIs for server-rendered pages.

---

## URL Convention

Examples

```text
/api/v1/solutions/
/api/v1/experts/
/api/v1/insights/
/api/v1/events/
/api/v1/resources/
```

Rules

- Use nouns.
- Use plural resource names.
- Keep URLs predictable.
- Use version prefix.

---

## HTTP Methods

| Method | Purpose |
|---------|----------|
| GET | Retrieve data |
| POST | Create data |
| PUT | Replace data |
| PATCH | Update data |
| DELETE | Delete data |

---

## Response Principles

Every response should be

- Consistent
- Predictable
- Machine-readable

Return

- Data
- Status
- Message (when appropriate)

---

## Validation

- Validate all input.
- Return meaningful validation errors.
- Never trust client-side validation.

---

## Error Handling

- Use appropriate HTTP status codes.
- Return consistent error responses.
- Do not expose internal system information.

---

## Authentication

Support

- Session Authentication
- Token Authentication (future)

Authorization follows the project RBAC model.

---

## Pagination

Use pagination for

- List APIs
- Search Results
- Large Datasets

Avoid returning excessive records.

---

## Security

- HTTPS only
- CSRF protection
- Input validation
- Output sanitization
- Permission checking

---

## Versioning

Future APIs should support versioning.

Example

```text
/api/v1/
/api/v2/
```

---

## AI Notes

Always

- Design RESTful APIs.
- Keep endpoints consistent.
- Validate input.
- Check permissions.
- Return predictable responses.

Never

- Expose internal implementation.
- Return sensitive information.
- Create duplicate endpoints.
- Bypass authentication or authorization.

---

## Definition of Done

- API principles approved.
- URL conventions approved.
- Validation strategy approved.
- Security rules approved.
- Versioning strategy approved.