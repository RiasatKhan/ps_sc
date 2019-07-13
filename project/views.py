from flask import Flask, request, jsonify
from flask_restful import Resource, Api
from controllers import *
from response_models import *
app=Flask(__name__)
api=Api(app)




class Get_Question_Set(Resource):
        def get(self):
            result=get_all_question_sets()
            result_set=[]
            for i in result:
                result_set.append(vars(Question_Set(i[0],i[1])))
            if len(result_set)>0:
                return jsonify({'result':result_set})
            else:
                return "Not Found",404
           



class Get_Questions(Resource):
    def get(self):
        args=request.args
        result=get_questions(args["set_id"])
        result_set=[]
        if len(result_set)>0:
            return jsonify({'result':result_set})
        else:
            return "Not Found",404


class Get_Answers(Resource):
    def get(self):
        args=request.args
        result=get_answers(args["set_id"])
        result_set=[]
        for i in result:
            result_set.append(vars(Answers(i[0],i[1],i[2],i[3])))
        if len(result_set)>0:
            return jsonify({'result':result_set})
        else:
            return "Not Found",404



class Create_User(Resource):
    def post(self):
        inp=request.get_json()
        insert_user(str(inp["name"]),str(inp["email"]),str(inp["password"]))
        
class Login_User(Resource):
    def post(self):
        inp=request.get_json()
        result=login_user(str(inp["email"]),str(inp["password"]))
        result_set=[]
        for i in result:
            result_set.append(vars(Credentials(i[0],i[1])))
        if len(result_set)>0:
            return jsonify({'result':result_set})
        else:
            return "email/password not found",401


class Create_Report(Resource):
    def post(self):
        inp=request.get_json()
        user_id=inp["user_id"]
        question_set_id=inp["question_set_id"]
        for i in inp["answers"]:
            question_id=i["question_id"]
            answer_id=i["answer_id"]
            insert_report(user_id,question_set_id,question_id,answer_id)



api.add_resource(Get_Question_Set,'/question-sets')
api.add_resource(Get_Questions,'/questions')
api.add_resource(Get_Answers,'/answers')
api.add_resource(Create_User,'/register')
api.add_resource(Login_User,'/login')
api.add_resource(Create_Report,'/submit')

if __name__=='__main__':
    app.run(debug=True)