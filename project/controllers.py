from connectSql import mysql

def get_all_question_sets():
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from question_set")
    data=cursor.fetchall()
    return data


def get_question_set_by_id(x):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from question_set where id=%s",x)
    data=cursor.fetchall()
    return data


def get_questions(x):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from questions where set_id=%s",x)
    data=cursor.fetchall()
    return data

def get_answers(x):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from answers where set_id=%s",x)
    data=cursor.fetchall()
    return data

def insert_user(name,email,password):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Insert into users (name,email,password) values(%s,%s,%s)",(name,email,password))
    conn.commit()

def login_user(email,password):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select name,id from users where email=%s and password=%s",(email,password))
    data=cursor.fetchall()
    return data

def insert_report(user_id,question_set_id,question_id,answer_id):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Insert into report_breakdown (user_id,question_set_id,question_id,answer_id) values(%s,%s,%s,%s)",(user_id,question_set_id,question_id,answer_id))
    conn.commit()