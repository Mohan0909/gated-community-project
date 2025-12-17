# Gated Community Management System

A web-based Java application designed to manage complaints and resident interactions within a gated community.  
The system enables residents to raise complaints (with image uploads) and allows administrators to track, update, and resolve issues efficiently.

---

## 🚀 Features

### 👤 Resident
- Resident registration and login
- Raise complaints
- Upload images related to complaints
- View complaint status
- Edit or cancel complaints
- View resolved complaints

### 🛠️ Admin
- Admin login
- View all resident complaints
- Update complaint status
- Manage community issues efficiently

---

## 🧰 Tech Stack

- **Backend:** Java, Servlets
- **ORM:** Hibernate
- **Frontend:** JSP, HTML, CSS
- **Database:** MySQL
- **Build Tool:** Maven
- **Server:** Apache Tomcat
- **IDE:** Eclipse

---

## 🖼️ Complaint Image Upload

Residents can upload images while raising complaints to provide better clarity of the issue.

### Implementation Details:
- Image upload handled using `multipart/form-data`
- Images stored on the server
- Image reference saved in the database
- Supported formats: JPG, PNG

This feature improves communication between residents and administrators and helps speed up issue resolution.

---

## 📁 Project Structure

```
src/
└── main/
├── java/
│ └── com/
│ ├── Dao/
│ ├── entity/
│ ├── servlets/
│ └── utils/
├── resources/
│ └── hibernate.cfg.xml
└── webapp/
├── WEB-INF/
│ │── web.xml
│ └── lib/
└── *.jsp
```

## ⚙️ Setup & Run Instructions

### 1️⃣ Prerequisites
- Java JDK 8 or higher
- Apache Tomcat 9+
- MySQL
- Maven
- Eclipse IDE

---

### 2️⃣ Clone the Repository

```bash
git clone https://github.com/Mohan0909/gated-community-project.git
```

