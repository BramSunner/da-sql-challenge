-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "emp" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title" CHARACTER(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" CHARACTER(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "title" (
    "title_id" CHARACTER(5)   NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "dept" (
    "dept_no" CHARACTER(5)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_dept" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_mgr" (
    "dept_no" CHARACTER(5)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_dept_mgr" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" CHARACTER(5)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "wage" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_wage" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "emp" ADD CONSTRAINT "fk_emp_emp_title" FOREIGN KEY("emp_title")
REFERENCES "title" ("title_id");

ALTER TABLE "dept_mgr" ADD CONSTRAINT "fk_dept_mgr_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept" ("dept_no");

ALTER TABLE "dept_mgr" ADD CONSTRAINT "fk_dept_mgr_emp_no" FOREIGN KEY("emp_no")
REFERENCES "emp" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "emp" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept" ("dept_no");

ALTER TABLE "wage" ADD CONSTRAINT "fk_wage_emp_no" FOREIGN KEY("emp_no")
REFERENCES "emp" ("emp_no");

