## Lab Guide: Deploy & Connect Azure SQL Database:


## 🎯 Overview:


This lab teaches students how to:

- Deploy an Azure SQL Database (PaaS).
- Configure network and firewall rules.
- Connect to the database from **Azure Data Studio** or **SQL Server Management Studio (SSMS)**.
- Create tables and run basic SQL queries.
- Explore features like performance insights, automatic tuning, and geo-replication.
- Clean up resources to avoid unwanted charges.

---

## 🛠️ Prerequisites:


Before starting, ensure you have:

- An active **Azure subscription**.
- Access to the **Azure Portal**.
- Installed **Azure Data Studio** or **SQL Server Management Studio (SSMS)** on your local machine.
- A stable internet connection.

---

## 📚 Lab Steps:


### Step 1: Create SQL Database

1. Sign in to the Azure Portal: `https://portal.azure.com`.
2. Search for **SQL Database**, then click **Create**.
3. Fill in the required details:

   | Field | Value / Example |
   |-------|------------------|
   | Subscription | *Select your Azure subscription* |
   | Resource Group | Create new: `SQLLab-RG` |
   | Database Name | `StudentDB` |
   | Server | Create new server: name: `studentserver123` (must be unique) |
   | Admin Login | `azureuser` |
   | Password | `Password@12345` |
   | Region | *Select the Azure region nearest to you* |
   | Compute + Storage | Basic / Standard (2 vCores) — suited for lab work |

4. Click **Review + Create**, verify the settings, then **Create**.

---

### Step 2: Configure Networking:


Once the database is deployed:

1. In the Azure Portal, navigate to your new SQL Database.
2. Go to the **Networking** tab (or section).
3. Enable **Public Endpoint** so that you can connect from your local machine.
4. Under **Firewall rules**:
   - Add a rule to allow your client IP address.
   - Also enable **“Allow Azure services and resources to access this server”** (so that Azure services can connect if needed).

---

### Step 3: Connect to Database:


Using **Azure Data Studio** or **SSMS**:

- **Server name**: `studentserver123.database.windows.net`
- **Login / Username**: `sqladmin`
- **Password**: `Password@12345`
- **Database**: `StudentDB`
- Connect using those credentials.

---

### Step 4: Run Basic SQL Queries

Once connected, try the following in a new query window:

```sql
-- Create Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Course NVARCHAR(50)
);

-- Insert Sample Data
INSERT INTO Students VALUES (1, 'Asha', 'Azure');
INSERT INTO Students VALUES (2, 'Ravi', 'DevOps');
INSERT INTO Students VALUES (3, 'John', 'AI/ML');

-- Retrieve Data
SELECT * FROM Students;
```

You should see the rows inserted, and the SELECT query returns them.

## Step 5: Explore Advanced Features:

In the Azure Portal, find Query Performance Insights for your SQL Database — observe usage metrics, resource consumption, query stats.

Enable Automatic tuning — let Azure suggest or apply optimizations for query performance.

Explore the Geo-Replication option to configure a secondary read-only replica in another region (if applicable).

## Images:

## 1. Azure Sql Server:

<img width="1917" height="912" alt="Image" src="https://github.com/user-attachments/assets/5b1723b3-6949-42a4-bb5d-19c8fcdbc334" />

## 2. Azure Database:

<img width="1915" height="912" alt="Image" src="https://github.com/user-attachments/assets/2b9e8a54-8352-4e6f-b3b0-03f1e1771ade" />

## 3. Connection Strings:

<img width="1913" height="907" alt="Image" src="https://github.com/user-attachments/assets/80d56576-94e3-4ec1-a843-ec15884917b3" />

## 4. Java JDBC Connection strings:

<img width="1907" height="913" alt="Image" src="https://github.com/user-attachments/assets/5e1b0bec-56cf-4371-9d38-f944013c9ec3" />

## 5. ODBC Connection Strings:

<img width="1917" height="890" alt="Image" src="https://github.com/user-attachments/assets/967856f4-c735-4d08-9019-7d779bfb1fe9" />

## 6. PHP Connection strings:

<img width="1916" height="907" alt="Image" src="https://github.com/user-attachments/assets/cd3b0b71-a8cc-47ae-b287-0331d596013f" />

## 7. GO Connection Strings:

<img width="1912" height="917" alt="Image" src="https://github.com/user-attachments/assets/f4feba2c-812e-4b6a-84e3-4973522e5d15" />

## 8. Azure Output:

<img width="1918" height="1017" alt="Image" src="https://github.com/user-attachments/assets/fb67550a-8795-4177-b697-23de33d33db9" />



## ⚠️ Clean Up:

To avoid unnecessary costs:

Delete the Resource Group SQLLab-RG. This will remove the SQL Database, server, and all associated resources.

## ✅ Learning Outcomes:

After completing this lab, students will have:

Deployed a managed Azure SQL Database.

Configured networking and firewall rules appropriately.

Connected to the database using local tools (Azure Data Studio / SSMS).

Created tables, inserted data, retrieved data using SQL queries.

Explored performance, tuning, and replication options.

Understood how to clean up resources to avoid ongoing charges.

## Author:

**Uday Sairam Kommineni**

**Azure cloud Practioner**

**Mail-ID:** saikommineni5@gmail.com

**Linkedin-URL:**  https://www.linkedin.com/in/uday-sai-ram-kommineni-uday-sai-ram/
