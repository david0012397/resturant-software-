# Nodedr OrderRestro — Local Installation Guide

This restaurant management system & POS is installed completely on drive `E:\` with zero data stored on `C:\`.

## 🌐 Quick Access
- **Website URL:** [http://localhost:1995](http://localhost:1995)
- **API Documentation (Swagger):** [http://localhost:1995/api/docs](http://localhost:1995/api/docs)
- **Default Owner Login:**
  - **Email:** `owner@demo.local`
  - **Password:** `Password123!`
  - **Quick PIN:** `1234`

---

## 🚀 How to Start and Stop

### Start the Website
Double-click `E:\restaurant-pos\start-website.bat` or run in PowerShell:
```powershell
& "E:\restaurant-pos\start-website.ps1"
```
This automatically starts:
1. Portable PostgreSQL 16 server (`E:\pgsql`)
2. NestJS Backend API service (:4001)
3. Next.js Web Frontend (:1995)
4. Opens your default web browser to [http://localhost:1995](http://localhost:1995)

### Stop the Website
Double-click `E:\restaurant-pos\stop-website.bat` or run in PowerShell:
```powershell
& "E:\restaurant-pos\stop-website.ps1"
```

---

## 🍽️ Included Features & Routes
- **/dashboard** — Real-time restaurant analytics, sales & active order counters
- **/pos** — Point of Sale terminal with table selection, dine-in, takeaway, modifier items, discounts, tips, split bill, and UPI QR code payment
- **/tables** — Visual interactive floor designer, multi-floor plans, and table status
- **/kds** — Kitchen Display System with live preparation timers, station routing, and KOT management
- **/reservations** — Table bookings and customer waitlist
- **/menu** — Dishes, categories, modifier groups, combos, and seasonal menus
- **/inventory** — Ingredients, suppliers, recipe costing, purchase orders, transfers, and waste tracking
- **/customers** — CRM, loyalty points, memberships, and gift cards
- **/attendance** — Staff clock-in / clock-out tracking
- **/team** — Staff directory, roles, permissions, shift scheduling, and payroll
- **/accounting** — P&L reports, daily cash closing, expenses, and tax breakdown
- **/reports** — 18 comprehensive exportable reports (PDF, CSV, Excel)
- **/order/[qrToken]** — Customer QR code ordering on mobile devices
- **/kiosk/[token]** — Self-service ordering kiosk
- **/settings** — Multi-region tax (GST / VAT / Sales Tax), UPI IDs, backups, and security

---

## 📁 Storage Architecture (100% on Drive E:\)
- **Repository & Code:** `E:\restaurant-pos`
- **PostgreSQL Database Engine:** `E:\pgsql`
- **Database Data:** `E:\restaurant-pos\db_data`
- **Uploaded Photos & Media:** `E:\restaurant-pos\uploads`
- **Package Manager Caches:** `E:\pnpm-store`, `E:\npm-cache`, `E:\npm-global`
- **Temporary Files:** `E:\restaurant-pos\temp`
