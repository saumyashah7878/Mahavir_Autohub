# AutoHub – Car Showroom Management System

A frontend web app for managing a car showroom business, built with plain **HTML, CSS and JavaScript** (no frameworks, no build step). It is designed to match the PostgreSQL schema in the DBMS project (`DBMS Projectsql.sql`) and is pre-loaded with the same sample data.

## Features

- **Dashboard** – total/available/sold cars, total revenue, outstanding payments, pending services, revenue by showroom, recent sales, upcoming service dates and balance per sale.
- **Full CRUD for all 8 tables** – Showrooms, Employees, Suppliers, Cars, Customers, Sales, Service, Payments. Each table supports search, click-to-sort columns, add, edit, delete and CSV export.
- **Reports** – the SQL queries from the project (sold/available cars, employees with showrooms, customer purchases, revenue by payment status, pending sales, service history, completed payments, suppliers with cars, and more), shown with their SQL and exportable to CSV.
- **Responsive layout** – works on desktop and mobile (collapsible sidebar).

## Database logic mirrored in the UI

| SQL feature | Behaviour in the frontend |
|---|---|
| Trigger `trg_mark_car_sold` | Adding a sale marks the car as **Sold** |
| Trigger `service_status_trigger` | A new service job always starts as **Pending** |
| `UNIQUE (car_id)` on SALES | A car cannot be sold twice; the sale form lists only available cars |
| `UNIQUE` on `aadhaar_no`, `pan_no` | Duplicate customer IDs are rejected |
| `NOT NULL` columns | Required fields are validated in the form |
| Foreign keys | Dropdowns show names; records still referenced elsewhere cannot be deleted |
| Total amount | Auto-calculated as `price − discount + tax` |
| Payments | A sale becomes **Paid** once completed payments cover its total |

## Project Structure

```
.
├── index.html     # Page layout, sidebar, modal form
├── style.css      # Styling and responsive rules
├── app.js         # Schema config, seed data, CRUD, reports, business rules
├── README.md
└── DBMS Projectsql.sql   # PostgreSQL schema, data, queries, functions, triggers (backend)
```

## Getting Started

1. Put `index.html`, `style.css` and `app.js` in the same folder.
2. Open `index.html` in any modern browser (Chrome, Edge, Firefox, Safari).

No installation or server is required.

## How Data Is Stored

The app stores data in the browser's **localStorage**, seeded from the SQL sample data on first load. Changes persist across page reloads on the same browser.

- Use **Reset demo data** (bottom of the sidebar) to restore the original sample data.
- One extra car (Toyota Innova, *Available*) is included in the seed data, since all five original cars are already marked Sold and a new sale could not otherwise be tested.

## Connecting to the Real PostgreSQL Backend

Browsers cannot talk to PostgreSQL directly, so a small API layer is needed:

1. Create a server (e.g. Node.js + Express with `pg`, or Python Flask) exposing REST endpoints such as `GET/POST/PUT/DELETE /api/cars`, one set per table.
2. In `app.js`, replace the localStorage logic (`DB`, `save()`) with `fetch()` calls to those endpoints.
3. Optionally move the business rules (marking cars sold, payment settlement) to the database triggers/procedures already written in the SQL file, and remove them from the frontend.

## Database Schema Overview

`SHOWROOM` → `EMPLOYEE`, `CAR` · `SUPPLIER` → `CAR` · `CUSTOMER` → `SALES`, `SERVICE` · `EMPLOYEE` → `SALES` · `CAR` → `SALES`, `SERVICE` · `SALES` → `PAYMENT`

## Known Notes

- Query #1 in the SQL file is commented "Display available cars" but filters `status = 'Sold'`. The Reports page provides both a **Sold cars** and an **Available cars** tab.
- Data is local to one browser; clearing site data removes it.

## Tech Stack

- HTML5, CSS3 (CSS variables, grid/flexbox)
- Vanilla JavaScript (ES6+)
- PostgreSQL (PL/pgSQL functions, procedures, triggers, cursors) for the backend design

## License

For educational use as a DBMS course project.
