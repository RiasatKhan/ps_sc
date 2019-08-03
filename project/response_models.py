class Question_Set:
    def __init__(self,id,name):
        self.id=id
        self.name=name

class Questions:
    def __init__(self,question_id,question_set_id,question):
        self.question_id=question_id
        self.question_set_id=question_set_id
        self.question=question

class Answers:
    def __init__(self,answer_id,question_set_id,answer):
        self.answer_id=answer_id
        self.question_set_id=question_set_id
        self.answer=answer
class Credentials:
    def __init__(self,id,token):
        self.token=token
        self.user_id=id