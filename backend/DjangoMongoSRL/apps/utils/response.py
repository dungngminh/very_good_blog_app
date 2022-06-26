from sre_constants import SUCCESS
from rest_framework.response import Response

class ResponseMessage:
    LOGIN_SUCCESS = 'login_successfully'
    LOGIN_FAILED = 'authentication_failed'
    REGISTER_SUCCESS = 'successfully_registered'
    REGISTER_FAILED = 'register_failed'
    PASSWORD_NOT_MATCH = 'password_not_match'
    PASSWORD_CHANGED = 'password_changed_successfully'
    UNAUTHORIZED = 'permission_is_required'
    INTERNAL_SERVER_ERROR = 'internal_server_error'
    GET_BLOGS_SUCCESSFULLY = 'get_blog_successfully'
    GET_BLOG_SUCCESSFULLY = 'get_blog_succeed'
    SUCCESS = 'success'
    INVALID_DATA = 'invalid_data'
    DUPLICATED = 'duplicated'

class HttpResponse:
    @staticmethod
    def response(data, message, status):
        if type(data) is dict and 'message' not in data.keys():
            data['message'] = message 

        return Response(
            data,
            status,
        )