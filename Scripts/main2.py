import streamlit as st
import mysql.connector
import pandas as pd

st.set_page_config(page_title="Employee Management System", page_icon="X:/Projects/SQL/EmployeeDBMS/logo3.png")

st.markdown(
    """
    <style>
    .stApp {
        background-color: #5C42FF;
    }
    .video-container {
        border-radius: 15px;
        overflow: hidden;
        max-width: 100%;
        max-height: auto;
    }
    video {
        border-radius: 15px;
        max-width: 100%;
        max-height: auto;
    }
    </style>
    """,
    unsafe_allow_html=True
)

def get_db_connection():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="1290Zero",
        database="EmployeeDBMS"
    )
    return conn

def run_sql_command(sql):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(sql)
    conn.commit()
    cursor.close()
    conn.close()

if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
if 'user_role' not in st.session_state:
    st.session_state.user_role = None

choice = st.sidebar.selectbox("EMS", ("Home", "HR Login", "Manager Login", "Employee Login"))

if choice == "Home":
    st.image("X:/Projects/SQL/EmployeeDBMS/EMS.png")


    st.markdown('<div class="video-container">', unsafe_allow_html=True)
    st.video("X:/Projects/SQL/EmployeeDBMS/Employee.mp4")
    st.markdown('</div>', unsafe_allow_html=True)

    st.write("This is a Web Application developed by Rohit Pawra")

elif choice == "HR Login":
    st.header("HR Login")
    username = st.text_input("Enter HR Username")
    password = st.text_input("Enter HR Password", type="password")

    if st.button("Login"):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(f"SELECT 1 FROM UserLogin WHERE Username = '{username}' AND Password = '{password}' AND Login_type = 1")
        user_exists = cursor.fetchone()
        cursor.close()
        conn.close()

        if user_exists:
            st.session_state.logged_in = True
            st.session_state.user_role = 'HR'
            st.success("Logged in as HR")
        else:
            st.error("Invalid credentials or unauthorized access.")

    if st.session_state.logged_in and st.session_state.user_role == 'HR':
        hr_choice = st.selectbox("Select Action", ["None", "Add Employee", "Add Department", "Add Job", "View All Departments", "View Employee Attendance", "View All Employees"])

        if hr_choice == "Add Employee":
            st.subheader("Add Employee Details")
            with st.form(key='employee_form'):
                emp_id = st.text_input("Employee ID")
                first_name = st.text_input("First Name")
                last_name = st.text_input("Last Name")
                email = st.text_input("Email")
                dob = st.date_input("Date of Birth")
                gender = st.selectbox("Gender", ("Male", "Female"))
                mb_number = st.text_input("Mobile Number")
                join_date = st.date_input("Joining Date")
                job_id = st.text_input("Job ID")
                dept_id = st.text_input("Department ID")
                salary = st.text_input("Salary")
                submit = st.form_submit_button("Add Employee")

            if submit:
                sql = f"INSERT INTO Employee (Emp_id, First_name, Last_name, email, DOB, Gender, mb_number, Join_date, Job_id, Dept_id, Salary) VALUES ({emp_id}, '{first_name}', '{last_name}', '{email}', '{dob}', '{gender}', '{mb_number}', '{join_date}', {job_id}, {dept_id}, {salary})"
                run_sql_command(sql)
                st.success("Employee Added Successfully!")

        elif hr_choice == "Add Department":
            st.subheader("Add Department Details")
            with st.form(key='dept_form'):
                dept_id = st.text_input("Department ID")
                dept_name = st.text_input("Department Name")
                manager_id = st.text_input("Manager ID")
                submit_dept = st.form_submit_button("Add Department")

            if submit_dept:
                sql = f"INSERT INTO Department (Dept_id, Dept_name, Manager_id) VALUES ({dept_id}, '{dept_name}', {manager_id})"
                run_sql_command(sql)
                st.success("Department Added Successfully!")

        elif hr_choice == "Add Job":
            st.subheader("Add Job Details")
            with st.form(key='job_form'):
                job_id = st.text_input("Job ID")
                job_desig = st.text_input("Job Designation")
                dept_id = st.text_input("Department ID")
                submit_job = st.form_submit_button("Add Job")

            if submit_job:
                sql = f"INSERT INTO Job (Job_id, Job_desig, Dept_id) VALUES ({job_id}, '{job_desig}', {dept_id})"
                run_sql_command(sql)
                st.success("Job Added Successfully!")

        elif hr_choice == "View All Departments":
            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Department")
            departments = cursor.fetchall()
            cursor.close()
            conn.close()

            st.subheader("Departments")
            df = pd.DataFrame(departments, columns=["Dept ID", "Dept Name", "Manager ID"])
            st.dataframe(df)

        elif hr_choice == "View Employee Attendance":
            emp_id = st.text_input("Enter Employee ID to View Attendance")
            if st.button("View Attendance"):
                conn = get_db_connection()
                cursor = conn.cursor()
                cursor.execute(f"SELECT * FROM Attendance WHERE Emp_id = {emp_id}")
                attendance = cursor.fetchall()
                cursor.close()
                conn.close()

                st.subheader("Attendance")
                df = pd.DataFrame(attendance, columns=["Emp ID", "Date", "Status"])
                st.dataframe(df)

        elif hr_choice == "View All Employees":
            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Employee")
            employees = cursor.fetchall()
            cursor.close()
            conn.close()

            st.subheader("All Employees")
            df = pd.DataFrame(employees, columns=["Emp ID", "First Name", "Last Name", "Email", "DOB", "Gender", "Mobile", "Join Date", "Job ID", "Dept ID", "Salary"])
            st.dataframe(df)

elif choice == "Manager Login":
    st.header("Manager Login")
    username = st.text_input("Enter Manager Username")
    password = st.text_input("Enter Manager Password", type="password")

    if st.button("Login"):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(f"SELECT 1 FROM UserLogin WHERE Username = '{username}' AND Password = '{password}' AND Login_type = 2")
        user_exists = cursor.fetchone()
        cursor.close()
        conn.close()

        if user_exists:
            st.session_state.logged_in = True
            st.session_state.user_role = 'Manager'
            st.success("Logged in as Manager")
        else:
            st.error("Invalid credentials or unauthorized access.")

    if st.session_state.logged_in and st.session_state.user_role == 'Manager':
        manager_choice = st.selectbox("Select Action", ["None", "Add Project", "Assign Project", "View All Assigned Projects", "Set Project Status"])

        if manager_choice == "Add Project":
            st.subheader("Add Project Details")
            with st.form(key='project_form'):
                project_id = st.text_input("Project ID")
                project_name = st.text_input("Project Name")
                timespan = st.text_input("Timespan")
                budget = st.text_input("Budget")
                submit_project = st.form_submit_button("Add Project")

            if submit_project:
                sql = f"INSERT INTO Project (Project_id, Project_name, Timespan, Budget, Status) VALUES ({project_id}, '{project_name}', '{timespan}', {budget}, 'Created')"
                run_sql_command(sql)
                st.success("Project Added Successfully!")

        elif manager_choice == "Assign Project":
            st.subheader("Assign Project to Employee")
            with st.form(key='assign_project_form'):
                emp_id = st.text_input("Employee ID")
                job_id = st.text_input("Job ID")
                project_id = st.text_input("Project ID")
                manager_id = st.text_input("Manager ID")
                submit_assign = st.form_submit_button("Assign Project")

            if submit_assign:
                sql = f"INSERT INTO Assigned_Project (Emp_id, Job_id, Project_id, Manager_id) VALUES ({emp_id}, {job_id}, {project_id}, {manager_id})"
                run_sql_command(sql)
                st.success("Project Assigned Successfully!")

        elif manager_choice == "View All Assigned Projects":
            conn = get_db_connection()
            cursor = conn.cursor()
            cursor.execute("""
                SELECT Assigned_Project.Emp_id, Assigned_Project.Project_id, Project.Project_name, Project.Timespan, Project.Budget, Project.Status
                FROM Assigned_Project
                JOIN Project ON Assigned_Project.Project_id = Project.Project_id
            """)
            projects = cursor.fetchall()
            cursor.close()
            conn.close()

            st.subheader("Assigned Projects")
            df = pd.DataFrame(projects, columns=["Employee ID", "Project ID", "Project Name", "Timespan", "Budget", "Status"])
            st.dataframe(df)

        elif manager_choice == "Set Project Status":
            st.subheader("Set Status of a Project")
            with st.form(key='set_project_status_form'):
                project_id = st.text_input("Project ID")
                status = st.selectbox("Status", ["Created", "In Progress", "Completed", "Delayed", "Cancelled", "On Hold"])
                submit_status = st.form_submit_button("Set Status")

            if submit_status:
                sql = f"UPDATE Project SET Status = '{status}' WHERE Project_id = {project_id}"
                run_sql_command(sql)
                st.success(f"Project {project_id} status updated to {status}!")

elif choice == "Employee Login":
    st.header("Employee Login")
    username = st.text_input("Enter Employee Username")
    password = st.text_input("Enter Employee Password", type="password")

    if st.button("Login"):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(f"SELECT 1 FROM UserLogin WHERE Username = '{username}' AND Password = '{password}' AND Login_type = 3")
        user_exists = cursor.fetchone()
        cursor.close()
        conn.close()

        if user_exists:
            st.session_state.logged_in = True
            st.session_state.user_role = 'Employee'
            st.success("Logged in as Employee")
        else:
            st.error("Invalid credentials or unauthorized access.")

    if st.session_state.logged_in and st.session_state.user_role == 'Employee':
        emp_choice = st.selectbox("Select Action", ["None", "View Projects", "Mark Attendance", "View Attendance"])

        if emp_choice == "View Projects":
            emp_id = st.text_input("Enter Employee ID to View Projects")
            if st.button("View Projects"):
                conn = get_db_connection()
                cursor = conn.cursor()
                cursor.execute(f"""
                    SELECT Project.Project_id, Project.Project_name, Project.Timespan, Project.Budget, Project.Status
                    FROM Assigned_Project
                    JOIN Project ON Assigned_Project.Project_id = Project.Project_id
                    WHERE Assigned_Project.Emp_id = {emp_id}
                """)
                projects = cursor.fetchall()
                cursor.close()
                conn.close()

                st.subheader("Assigned Projects")
                df = pd.DataFrame(projects, columns=["Project ID", "Project Name", "Timespan", "Budget", "Status"])
                st.dataframe(df)

        elif emp_choice == "Mark Attendance":
            st.subheader("Mark Attendance")
            with st.form(key='mark_attendance_form'):
                emp_id = st.text_input("Employee ID")
                date = st.date_input("Date")
                status = st.selectbox("Attendance Status", ["Present", "Absent", "Personal Leave", "Medical Leave", "Business Trip"])
                submit_attendance = st.form_submit_button("Mark Attendance")

            if submit_attendance:
                sql = f"INSERT INTO Attendance (Emp_id, Date, Status) VALUES ({emp_id}, '{date}', '{status}')"
                run_sql_command(sql)
                st.success("Attendance Marked Successfully!")

        elif emp_choice == "View Attendance":
            emp_id = st.text_input("Enter Employee ID to View Attendance")
            if st.button("View Attendance"):
                conn = get_db_connection()
                cursor = conn.cursor()
                cursor.execute(f"SELECT * FROM Attendance WHERE Emp_id = {emp_id}")
                attendance = cursor.fetchall()
                cursor.close()
                conn.close()

                st.subheader("Attendance")
                df = pd.DataFrame(attendance, columns=["Emp ID", "Date", "Status"])
                st.dataframe(df)
