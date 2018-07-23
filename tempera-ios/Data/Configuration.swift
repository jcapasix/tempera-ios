
import Foundation
import Alamofire

enum Enviroment: String{
    case PROD
    case DEV
}

public protocol Configuration {
    /// URL of the REST server
    static var serverURL: String { get }
    static var environment: String { get }

}

public struct ProductionConfig: Configuration {
    public static let serverURL         = "http://192.168.88.136:3000/api"
    public static let environment       = Enviroment.PROD.rawValue
}

public struct DevelopConfig: Configuration {
    public static let serverURL         = "http://192.168.88.136:3000/api"
    public static let environment       = Enviroment.DEV.rawValue
}

class AppEnvironment{
    
    static var configuration:Configuration.Type{
        #if DEVELOPMENT
        return DevelopConfig.self
        #else
        return ProductionConfig.self
        #endif
    }
    //static var headers:Headers?
}
