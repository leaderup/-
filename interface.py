#coding:utf-8

import tornado.web

class BaseHandler(tornado.web.RequestHandler):
    @property
    def db(self):
        return self.application.db

    def get_one_poem(self, ids):
        return self.db.get("SELECT * FROM authors WHERE id = %s", int(ids))

    def get_all(self):
        return self.db.query("select * from authors")
    
    def loginRecord(self, user, passwd):
        # 记录用户名与密码
        sql = "REPLACE INTO `user`(`username`,`passwd`) VALUE('%s', '%s')" % (user, passwd)
        return self.db.execute(sql)
    
    def userRegister(self, mail, user, passwd):
        retinfo = {
            "status": False,
            "info": ""
        }
        # 查所有数据
        sql = "select * from user"
        result = self.db.query(sql)
        isRegister = False
        maxUid = 1
        for userinfo in result:
            maxUid = max(userinfo['uid'], maxUid)
            if user == userinfo['username']:
                isRegister = True
        
        if isRegister:
            retinfo['status'] = True
            retinfo['info'] = "user:<i>%s</i> is register" % user
            return retinfo
        
        maxUid = maxUid + 1
        # 记录用户名与密码、邮箱
        sql = "INSERT INTO `user`(`email`, `username`,`passwd`) VALUE('%s', '%s', '%s')" % (mail, user, passwd)
        ret = self.db.execute(sql)
        if ret:
            retinfo['status'] = True
            retinfo['info'] = "Register Success, Congratulations!"
        return retinfo 
    
    def insertQuestion(self, title, detail):
        # 记录问题与详细说明
        sql = "insert INTO `question_list`(`question`,`detail`) VALUE('%s', '%s')" % (title, detail)
        return self.db.execute(sql)
    
    def getAllQuestion(self):
        # 记录问题与详细说明
        sql = "SELECT * FROM `question_list`"
        return self.db.query(sql)
    
    def getAllQuestionAndAnswer(self, qid):
        # 记录问题与详细说明
        sql = "SELECT * FROM `question_list` LEFT JOIN `anwser` ON question_list.`pid` = anwser.`qid` WHERE question_list.`pid`=%s" % qid
        return self.db.query(sql)
    
    def insertComment(self, qid, comment):
        sql = "INSERT INTO `anwser`(`qid`, `anwser`) VALUES('%s', '%s')" % (qid, comment)
        return self.db.execute(sql)


class LoginHandler(BaseHandler):
    # 登录接口
    def get(self):
        self.render('login.html')

    def post(self):
        user = self.get_argument('username')
        password = self.get_argument('password')
        self.loginRecord(user, password)
        #self.render('display.html', username=user)
        self.username = user
        self.redirect('display', permanent=False, status=302)

class RegisterHandler(BaseHandler):
    # 注册接口
    def get(self):
        self.render('register.html')

    def post(self):
        mail = self.get_argument('email')
        user = self.get_argument('username')
        password = self.get_argument('password')
        info = "mail: %s,user: %s, password: %s" % (mail, user, password)
        print info
        retinfo = self.userRegister(mail, user, password)
        info = retinfo['info']
        self.write(info)

class DisplayHandler(BaseHandler):
    # 注册接口
    def get(self):
        allQuestion =  self.getAllQuestion()
        self.render('display.html', allQuestion=allQuestion) 

    def post(self):
        action = self.get_argument('action')
        if action == 'add':
            self.addQuestion()
        elif action == 'list':
            pass
        self.redirect('display', permanent=False, status=302)
        
    def addQuestion(self):
        title = self.get_argument('theme');
        detail = self.get_argument('detail');
        self.insertQuestion(title, detail)

class QuestionHandler(BaseHandler):
    # 问题列表展示接口
    def get(self):
        qid = self.get_argument('qid')
        allRecord = self.getAllQuestionAndAnswer(qid)
        if allRecord:
            self.render('question.html', allRecord=allRecord, firstRecord=allRecord[0])

    def post(self):
        action = self.get_argument('action')
        if action == 'addComment':
            self.addComment()
        elif action == 'list':
            pass
        qid = self.get_argument('questionId')
        self.redirect('question?qid=%s' % qid, permanent=False, status=302)
        
    def addComment(self):
        qid = self.get_argument('questionId')
        comment = self.get_argument('comment')
        self.insertComment(qid, comment)
