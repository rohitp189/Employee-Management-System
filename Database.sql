-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: employeedbms
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assigned_project`
--

DROP TABLE IF EXISTS `assigned_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_project` (
  `Emp_id` int NOT NULL,
  `Job_id` int NOT NULL,
  `Project_id` int NOT NULL,
  `Manager_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_project`
--

LOCK TABLES `assigned_project` WRITE;
/*!40000 ALTER TABLE `assigned_project` DISABLE KEYS */;
INSERT INTO `assigned_project` VALUES (1001,101,2001,101),(1002,102,2002,102),(1003,103,2003,103),(1004,104,2004,104),(1005,105,2005,105),(1006,106,2006,106),(1007,107,2007,107),(1008,108,2008,108),(1009,109,2009,109),(1010,110,2010,110),(1011,3,2011,107);
/*!40000 ALTER TABLE `assigned_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `Emp_id` int NOT NULL,
  `Date` date NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1001,'2024-09-01','Present'),(1002,'2024-09-01','Absent'),(1003,'2024-09-01','Present'),(1004,'2024-09-01','Present'),(1005,'2024-09-01','Absent'),(1006,'2024-09-01','Present'),(1007,'2024-09-01','Present'),(1008,'2024-09-01','Absent'),(1009,'2024-09-01','Present'),(1010,'2024-09-01','Present'),(1001,'2024-09-12','Present'),(1005,'2024-09-13','Absent'),(1002,'2024-09-09','Personal Leave'),(1003,'2024-09-20','Absent'),(1011,'2024-09-13','Present'),(1011,'2024-09-21','Present'),(1011,'2024-09-17','Absent'),(1011,'2024-09-25','Absent'),(1011,'2024-09-26','Present'),(1011,'2024-09-27','Personal Leave'),(1011,'2024-09-28','Personal Leave'),(1011,'2024-09-02','Medical Leave'),(1011,'2024-09-03','Business Trip'),(1011,'2024-09-13','Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dept_id` int NOT NULL,
  `Dept_name` varchar(255) NOT NULL,
  `Manager_id` int NOT NULL,
  PRIMARY KEY (`Dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'HR',101),(2,'Finance',102),(3,'IT',103),(4,'Marketing',104),(5,'Sales',105),(6,'Operations',106),(7,'R&D',107),(8,'Customer Service',108),(9,'Legal',109),(10,'Admin',110),(116,'Management',106);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Emp_id` int NOT NULL,
  `First_name` varchar(255) NOT NULL,
  `Last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `mb_number` varchar(15) NOT NULL,
  `Join_date` date NOT NULL,
  `Job_id` int NOT NULL,
  `Dept_id` int NOT NULL,
  `Salary` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1001,'John','Doe','john.doe@example.com','1990-01-01','Male','+911234567890','2024-01-01',101,1,60000.00),(1002,'Jane','Smith','jane.smith@example.com','1985-02-15','Female','+911234567891','2024-02-01',102,2,65000.00),(1003,'Alice','Johnson','alice.johnson@example.com','1992-03-20','Female','+911234567892','2024-03-01',103,3,70000.00),(1004,'Bob','Brown','bob.brown@example.com','1988-04-25','Male','+911234567893','2024-04-01',104,1,75000.00),(1005,'Charlie','Davis','charlie.davis@example.com','1991-05-30','Male','+911234567894','2024-05-01',105,2,80000.00),(1006,'Diana','Miller','diana.miller@example.com','1987-06-10','Female','+911234567895','2024-06-01',106,3,85000.00),(1007,'Eve','Wilson','eve.wilson@example.com','1993-07-15','Female','+911234567896','2024-07-01',107,1,90000.00),(1008,'Frank','Moore','frank.moore@example.com','1986-08-20','Male','+911234567897','2024-08-01',108,2,95000.00),(1009,'Grace','Taylor','grace.taylor@example.com','1994-09-25','Female','+911234567898','2024-09-01',109,3,100000.00),(1010,'Henry','Anderson','henry.anderson@example.com','1989-10-30','Male','+911234567899','2024-10-01',110,1,105000.00),(1011,'Yash','Jain','yash@gmail.com','1990-06-12','Male','+919007008080','2024-09-18',109,9,750000.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `Job_id` int NOT NULL,
  `Job_desig` varchar(255) NOT NULL,
  `Dept_id` int NOT NULL,
  PRIMARY KEY (`Job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (101,'Software Engineer',3),(102,'Accountant',2),(103,'HR Manager',1),(104,'Marketing Specialist',4),(105,'Sales Executive',5),(106,'Operations Manager',6),(107,'Research Scientist',7),(108,'Customer Service Rep',8),(109,'Legal Advisor',9),(110,'Administrative Assistant',10),(111,'Decorator',6);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `Manager_id` int NOT NULL,
  `Manager_name` varchar(255) NOT NULL,
  `Project_id` int NOT NULL,
  PRIMARY KEY (`Manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (101,'Alice White',2001),(102,'Bob Black',2002),(103,'Charlie Grey',2003),(104,'Diana Green',2004),(105,'Eve Brown',2005),(106,'Frank Blue',2006),(107,'Grace Pink',2007),(108,'Henry Purple',2008),(109,'Ivy Orange',2009),(110,'Jack Yellow',2010);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Project_id` int unsigned NOT NULL,
  `Project_name` varchar(255) NOT NULL,
  `Timespan` varchar(255) NOT NULL,
  `Budget` decimal(8,2) NOT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (2001,'Project Alpha','6 months',500000.00,'Created'),(2002,'Project Beta','12 months',750000.00,'Created'),(2003,'Project Gamma','8 months',600000.00,'Created'),(2004,'Project Delta','10 months',650000.00,'In Progress'),(2005,'Project Epsilon','4 months',300000.00,'In Progress'),(2006,'Project Zeta','9 months',700000.00,'Completed'),(2007,'Project Eta','5 months',350000.00,'In Progress'),(2008,'Project Theta','11 months',800000.00,'Completed'),(2009,'Project Iota','7 months',550000.00,'Completed'),(2010,'Project Kappa','6 months',400000.00,'On Hold'),(2011,'Python App','1 month',12000.00,'In Progress');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Login_type` int NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` VALUES (122,'rohitp','12qwert',1),(123,'hr1','123456',1),(124,'mr1','123456',2),(125,'emp1','123456',3),(126,'jdoe','password1',1),(127,'asmith','password2',2),(128,'bwhite','password3',3),(129,'cjones','password4',1),(130,'dgreen','password5',2),(131,'ewilliams','password6',3);
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14  1:24:04
