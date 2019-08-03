from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_restful import Resource, Api
from controllers import *
from response_models import *
app=Flask(__name__)
api=Api(app)
cors=CORS(app,supports_credentials=True)
app.config['CORS_HEADERS'] = 'Content-Type'




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
        print(result)
        result_set=[]
        for i in result:
            result_set.append(vars(Questions(i[0],i[1],i[2])))
        if len(result_set)>0:
            return jsonify({'result':result_set})
        else:
            return "Not Found",404


class Get_Answers(Resource):
    def get(self):
        args=request.args
        result=get_answers_by_set_id(args["set_id"])
        result_set=[]
        for i in result:
            result_set.append(vars(Answers(i[0],i[1],i[3])))
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
        score=0
        for i in inp["answers"]:
            question_id=i["question_id"]
            answer_id=i["answer_id"]
            insert_report_breakdown(user_id,question_set_id,question_id,answer_id)
            score=score+get_answer_value_by_id(answer_id)[0]
        insert_report(user_id,question_set_id,score)
        data=check_score(question_set_id,score)
        return jsonify(data)


# class Check_Result(Resource):
#     def get(self):


api.add_resource(Get_Question_Set,'/question-sets')
api.add_resource(Get_Questions,'/questions')
api.add_resource(Get_Answers,'/answers')
api.add_resource(Create_User,'/register')
api.add_resource(Login_User,'/login')
api.add_resource(Create_Report,'/submit-report')

if __name__=='__main__':
    app.run(debug=True)