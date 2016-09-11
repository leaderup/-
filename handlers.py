from views import *
from interface import *
import os.path


TEMPLATE_PATH = os.path.join(os.path.dirname(__file__), "templates")

STATIC_PATH = os.path.join(os.path.dirname(__file__), "static")

HANDLERS = [(r'/', IndexHandler),
            (r'/poem', PoemPageHandler)]
			
HANDLERS += [(r'/show', ShowHandler)]

HANDLERS += [(r'/login', LoginHandler),
             (r'/register', RegisterHandler),
             (r'/display', DisplayHandler),
             (r'/question', QuestionHandler)]
