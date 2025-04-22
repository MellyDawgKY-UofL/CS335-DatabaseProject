
# CSE 335 Spring 2025 - Database Project Summary

## 📚 Database Setup: Structure & Logic

### ✅ Tables Created

1. **BookInfo**
   - Columns: `BookID (AUTO_INCREMENT PK)`, `Title`, `Authors`, `ISBN`, `PublisherID`, `language_code`, `num_pages`
   - Indexes:
     - `Authors` (non-clustered)
     - `language_code`
     - `PublisherID`
   - Foreign Key: `ISBN` → `PublisherData.ISBN`

2. **PublisherData**
   - Columns: `PublisherID (AUTO_INCREMENT PK)`, `Publisher`, `ISBN`, `ISBN13`, `PublicationDate`
   - Indexes:
     - `PublicationDate`
     - `ISBN13`
   - Foreign Key: `ISBN13` → `Reviews.ISBN13`

3. **Reviews**
   - Columns: `ReviewsID (AUTO_INCREMENT PK)`, `ISBN13`, `AvgRating`, `RatingsCount`, `TextReviewsCount`
   - Indexes:
     - `ratingsCount`
     - `avgRating`

4. **CombinedBookData (View)**
   - A view that joins `BookInfo`, `PublisherData`, and `Reviews` for simplified access to complete book records

---

### ✅ Insert Scripts

- Generated from cleaned, deduplicated CSVs
- Auto-generated IDs using `AUTO_INCREMENT`
- INSERT scripts excluded primary keys and relied on DB generation
- Foreign keys added **after** inserts

---

### 🧭 Execution Order

1. `Reviews`
2. `PublisherData`
3. `BookInfo`
4. `CombinedBookData` (view)

---

## ⚠️ Challenges During Setup

### 🔄 ID Conflicts
- Initially attempted manual `ID` insertion
- Resolved by switching to `AUTO_INCREMENT`

### 🔁 Foreign Key Conflicts
- Constraints blocked inserts until reordered
- FKs were dropped temporarily and re-added after inserts

### 🧼 Data Cleaning
- Removed duplicates, invalid dates, formatting issues
- Normalized publisher names

---

## ☕ Java App in Replit

### ✅ Final Design

- Java console app (Replit)
- Prompts for DB credentials
- Connects to AWS MySQL DB
- Queries `CombinedBookData` view
- Displays first 25 rows dynamically

### 🔧 Technical Setup

- `mysql-connector-j-8.0.33.jar`
- Manual `.replit` config for classpath
- JDBC driver loaded with `Class.forName(...)`

---

### 😤 Challenges in Replit

- Initial `.jar` was incorrect (v9+ incompatible)
- `.env` and Secrets not supported for Java
- Had to switch to `Scanner` input for secure credential handling

---

## 🔐 Security Decision: Prompt for Credentials

- Avoids `.env` or hardcoding passwords
- User enters DB user/pass at runtime
- Keeps project safe and shareable

---

## ✅ Final Result

- Secure Java console app
- Queries AWS-hosted MySQL database
- Uses normalized, indexed schema
- Displays clean data from a dynamic view
