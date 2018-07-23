
import Foundation

class ApiURL{

    static let URL_LOGIN = AppEnvironment.configuration.serverURL + "/auth/login"
    static let URL_REGISTER = AppEnvironment.configuration.serverURL + "/auth/signup"
    
    static let URL_GET_CULTIVOS = AppEnvironment.configuration.serverURL + "/cultivos"
    static let URL_CREATE_CULTIVO = AppEnvironment.configuration.serverURL + "/cultivo"
    static let URL_DELETE_CULTIVO = AppEnvironment.configuration.serverURL + "/cultivos/delete"
    
    static let URL_UPDATE_CULTIVO = AppEnvironment.configuration.serverURL + "/cultivos/update"
    
    static let URL_GET_TEM = AppEnvironment.configuration.serverURL + "/temp"
    static let URL_ACTIVE_CULTIVO = AppEnvironment.configuration.serverURL + "/cultivos/active"
    static let URL_GET_REPORTES = AppEnvironment.configuration.serverURL + "/reportes"
}
