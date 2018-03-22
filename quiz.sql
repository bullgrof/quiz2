CREATE TABLE employes(
    id NUMBER(5) NOT NULL PRIMARY KEY,
    manager_id NUMBER(5),
    date_of_joining DATE NOT NULL,
    full_name VARCHAR2(255),
    FOREIGN KEY (manager_id)
    REFERENCES employes(id)
);


CREATE TABLE projects(
    id NUMBER(5) NOT NULL PRIMARY KEY,
    code VARCHAR2(255) NOT NULL,
    manager_id NUMBER(5) NOT NULL,
    budget NUMBER(10,2) NOT NULL,
    date_of_beginning DATE,
    date_of_ending DATE,
    FOREIGN KEY (manager_id)
    REFERENCES employes (id)
);




CREATE TABLE salaries(
    id NUMBER(5) NOT NULL PRIMARY KEY,
    employee_id NUMBER(5) NOT NULL,
    project_id NUMBER(5) NOT NULL,
    salary NUMBER(10,2),
    FOREIGN KEY (employee_id)
    REFERENCES employes (id),
    FOREIGN KEY (project_id)
    REFERENCES projects (id)
);




SELECT COUNT(id) as totalemployes FROM projects WHERE code ='48205501099';

SELECT  full_name FROM salaries  
INNER JOIN  employes ON employee_id = employes.ID
WHERE salary >=2500 AND salary <= 3000;

SELECT  COUNT(id) as total_employes, code FROM projects 
INNER JOIN employes  ON e.id = p.manager_id 
group BY(id);


SELECT full_name,s.salary FROM employes 
INNER JOIN PROJECTS ON manager_id = employes.ID
INNER JOIN salaries s ON project_id = projects.id
ASC(s.salary);




https://github.com/bullgrof/quiz2.git

