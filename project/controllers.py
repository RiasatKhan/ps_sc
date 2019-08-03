from connectSql import mysql
import random, string
def get_all_question_sets():
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from question_set")
    data=cursor.fetchall()
    return data


def get_question_set_by_id(question_set_id):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from question_set where id=%s",question_set_id)
    data=cursor.fetchall()
    return data


def get_questions(question_id):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from questions where set_id=%s",question_id)
    data=cursor.fetchall()
    return data

def get_answers_by_set_id(answer_id):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from answers where set_id=%s",answer_id)
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
    print("--------------------------------------------------------------------------------------------")
    print(data)
    print("--------------------------------------------------------------------------------------------")
    if(len(data)==1):
        print("--------------------------------------------------------------------------------------------")
        print(data[0][1])
        print("--------------------------------------------------------------------------------------------")
        x = ''.join(random.choices(string.ascii_letters + string.digits, k=16))
        cursor.execute("Insert into auth_log (user_id,token) values(%s,%s)",(data[0][1],x))
        conn.commit()
        cursor.execute("Select user_id,token from auth_log where token=%s",x)
        data=cursor.fetchall()
        print("--------------------------------------------------------------------------------------------")
        print(data)
        print("--------------------------------------------------------------------------------------------")
    return data

def insert_report_breakdown(user_id,question_set_id,question_id,answer_id):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Insert into report_breakdown (user_id,question_set_id,question_id,answer_id) values(%s,%s,%s,%s)",(user_id,question_set_id,question_id,answer_id))
    conn.commit()
    
def get_answer_value_by_id(answer_id):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select value from answers where id=%s",answer_id)
    data=cursor.fetchone()
    return data

def insert_report(user_id,question_set_id,score):
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Insert into report (user_id,question_set_id,score) values(%s,%s,%s)",(user_id,question_set_id,score))
    conn.commit()

def check_score(question_set_id,score):
    
    conn=mysql.connect()
    cursor=conn.cursor()
    cursor.execute("Select * from score where question_set_id=%s",question_set_id)
    data=cursor.fetchall()
    for i in data:
        if (score<=i[3] and score>=i[4]):
            return {"score":score,"assesment":i[2],"isAppointmentNeeded":i[5]}

