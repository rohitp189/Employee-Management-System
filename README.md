
# Employee Management System (EMS)

This project is a **Web-based Employee Management System (EMS)** developed using **Streamlit** and **MySQL**. It provides a user-friendly interface for HRs, Managers, and Employees to manage and interact with various functionalities related to employees, departments, projects, and attendance.

## Features

### 1. **HR Role**
- **Add Employee**: HR can add new employees to the system.
- **Add Department**: Add and manage departments.
- **Add Job**: Manage job roles across departments.
- **View All Departments**: List of all departments.
- **View Employee Attendance**: Monitor attendance records.
- **View All Employees**: Access a list of all employees with detailed information.

### 2. **Manager Role**
- **Add Project**: Create and manage new projects.
- **Assign Project**: Assign projects to employees.
- **View Assigned Projects**: Overview of all assigned projects with status.
- **Set Project Status**: Update project progress with different statuses like "In Progress", "Completed", etc.

### 3. **Employee Role**
- **View Projects**: Employees can view projects assigned to them.
- **Mark Attendance**: Mark daily attendance with various statuses (e.g., Present, Absent, Leave).
- **View Attendance**: Access personal attendance history.

## Installation and Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/EmployeeDBMS.git
   ```
2. Navigate to the project directory:
   ```bash
   cd EmployeeDBMS
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Set up MySQL and import the necessary database schema:
   ```sql
   CREATE DATABASE EmployeeDBMS;
   -- Import the SQL schema from the `db_schema.sql` file.
   ```
5. Run the application:
   ```bash
   streamlit run app.py
   ```

## Database Schema

The application uses a MySQL database to manage employee, department, project, and attendance data. Key tables include:

- **Employee**: Stores employee details such as name, email, date of birth, etc.
- **Department**: Stores department information.
- **Job**: Stores job role information.
- **Project**: Stores project details and status.
- **Attendance**: Tracks employee attendance.
- **UserLogin**: Authentication data for HRs, Managers, and Employees.

## How It Works

Upon logging in, users are redirected to their respective dashboards based on their role (HR, Manager, Employee). Each role has access to specific features such as adding new employees, assigning projects, marking attendance, or viewing attendance history. The system allows for real-time data entry and retrieval from the MySQL database.

## Tech Stack

- **Frontend**: [Streamlit](https://streamlit.io/)
- **Backend**: [MySQL](https://www.mysql.com/)
- **Python Libraries**: Pandas, MySQL Connector, etc.

## Project Structure

```
📦EmployeeDBMS
 ┣ 📂images
 ┣ 📂videos
 ┣ 📜app.py
 ┣ 📜db_schema.sql
 ┣ 📜requirements.txt
 ┗ 📜README.md
```

## License

This project is licensed under the [MIT License](LICENSE).
