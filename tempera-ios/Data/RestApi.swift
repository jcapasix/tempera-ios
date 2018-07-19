

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import ReachabilitySwift

public class RestApi: Repository{
    

    public static let sharedInstance = RestApi()
    
    var alamofireManager : Alamofire.SessionManager?
    //var alamofireManagerAuth : Alamofire.SessionManager?
    
    let reachability = Reachability()
    //var requestAlamo:Alamofire.DataRequest?
    
    typealias VerifyResponse = (_ succeeded: Bool)->Void
    
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]

    private init() {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 5
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)

    }
    
    func login(username:String,
                      password:String,
                      completion:@escaping (_ status:Bool?, _ user: User?, _ error:ErrorEntity?) -> Void){

        var error:ErrorEntity?
        var user:User?

            let parameters : [ String : Any] = [
                "username" : username,
                "password" : password
            ]

            let url = ApiURL.URL_LOGIN
            print(url)

            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<LoginResponse>) in

                switch response.result {
                case .success:
                    
                    let data:LoginResponse = response.result.value!
                    
                    if(response.response?.statusCode == 200){
                        
                        if(data.success)!{
                            user = data.user
                            completion(true, user,error)
                        }
                        else{
                            error = data.error
                            completion(false, user,error)
                        }
                    }
                    
                case .failure( _):
                    completion(false, user,Errors.UPS)
                }
            }
    }
    
    func register(username:String, password:String, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void){
        var error:ErrorEntity?
        var message:String?
        
        
            let parameters : [ String : Any] = [
                "username" : username,
                "password" : password,
                "admin" : true
            ]
            
            let url = ApiURL.URL_REGISTER
            print(url)
            
            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<RegisterResponse>) in
                
                switch response.result {
                case .success:
                    
                    let data:RegisterResponse = response.result.value!
                    
                    if(data.success)!{
                        message = data.message
                        completion(true, message, error)
                    }
                    else{
                        error = data.error
                        completion(false, message,error)
                    }
                    
                case .failure( _):
                    completion(false, message,Errors.UPS)
                }
            }
        
    }

    func getCultivos(completion: @escaping ([Cultivo]?, ErrorEntity?) -> Void) {
        var error:ErrorEntity?
        var cultivos:[Cultivo]?
        
        
            let parameters : [ String : Any] = [
                "token" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjViMjBhZWUzZTBjNGY4MTZiYjUwYmJkNCIsInVzZXJuYW1lIjoiamNhcGFzaXgiLCJwYXNzd29yZCI6IjEyMzQ1NmEiLCJhZG1pbiI6dHJ1ZSwiX192IjowfSwiaWF0IjoxNTI4OTQ0MzMxfQ.23-SsVNzhpeDKttDwoxFLJHevVUHOqZAibb9qyORH6o",
            ]
            
            let url = ApiURL.URL_GET_CULTIVOS
            print(url)
            
            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<CultivoResponse>) in
                
                switch response.result {
                case .success:
                    
                    let data:CultivoResponse = response.result.value!
                    
                    if(response.response?.statusCode == 200){
                        
                        if(data.success)!{
                            cultivos = data.cultivos
                            completion(cultivos, error)
                        }
                        else{
                            error = Errors.UPS
                            completion(cultivos, error)
                        }
                    }
                    
                case .failure( _):
                    completion(cultivos,Errors.UPS)
                }
            }

    }
    
    
    func createCultivo(cultivo:Cultivo, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void){
        var error:ErrorEntity?
        var message:String?

            
            let parameters: Parameters = [
                "cultivo": [
                    "nombre": cultivo.nombre ?? "",
                    "temperaturaMax":cultivo.temperaturaMax ?? 0,
                    "temperaturaMin":cultivo.temperaturaMin ?? 0,
                    "fechaInicial":cultivo.fechaInicial ?? "",
                    "fechaFinal":cultivo.fechaFinal ?? ""
                ]
            ]
            
            let url = ApiURL.URL_CREATE_CULTIVO
            print(url)
            
            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<CreateResponse>) in
                
                switch response.result {
                case .success:
                    
                    let data:CreateResponse = response.result.value!
                    
                    if(data.success)!{
                        message = data.message
                        completion(true, message, error)
                    }
                    else{
                        error = data.error
                        completion(false, message,error)
                    }
                    
                case .failure( _):
                    completion(false, message,Errors.UPS)
                }
            }

    }

    
    func deleteCultivo(id:String, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void){
        var error:ErrorEntity?
        var message:String?
        
        
            let parameters: Parameters = [
                "id": id
            ]
            
            let url = ApiURL.URL_DELETE_CULTIVO
            print(url)
            
            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<CreateResponse>) in
                
                switch response.result {
                case .success:
                    
                    let data:CreateResponse = response.result.value!
                    
                    if(data.success)!{
                        message = data.message
                        completion(true, message, error)
                    }
                    else{
                        error = data.error
                        completion(false, message,error)
                    }
                    
                case .failure( _):
                    completion(false, message,Errors.UPS)
                }
            }
    }
    
    
    func updateCultivo(cultivo:Cultivo, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void){
        var error:ErrorEntity?
        var message:String?
            
            let parameters: Parameters = [
            
                "cultivo": [
                    "_id":cultivo.id ?? "",
                    "nombre": cultivo.nombre ?? "",
                    "temperaturaMax":cultivo.temperaturaMax ?? 0,
                    "temperaturaMin":cultivo.temperaturaMin ?? 0,
                    "fechaInicial":cultivo.fechaInicial ?? "",
                    "fechaFinal":cultivo.fechaFinal ?? ""
                ]
            ]
            
            let url = ApiURL.URL_UPDATE_CULTIVO
            print(url)
            
            self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<CreateResponse>) in
                
                switch response.result {
                case .success:
                    
                    let data:CreateResponse = response.result.value!
                    
                    if(data.success)!{
                        message = data.message
                        completion(true, message, error)
                    }
                    else{
                        error = data.error
                        completion(false, message,error)
                    }
                    
                case .failure( _):
                    completion(false, message,Errors.UPS)
                }
            }
        
    }
    
    
    func getTemp(completion: @escaping (Temperatura?, Cultivo?, ErrorEntity?) -> Void) {
        var error:ErrorEntity?
        var temperatura:Temperatura?
        var cultivo:Cultivo?
        
        let url = ApiURL.URL_GET_TEM
        print(url)
        
        self.alamofireManager?.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<TemperaturaResponse>) in
            
            switch response.result {
            case .success:
                
                let data:TemperaturaResponse = response.result.value!
                
                if(response.response?.statusCode == 200){
                    
                    if(data.success)!{
                        temperatura = data.temperatura!
                        cultivo = data.cultivo!
                        completion(temperatura, cultivo, error)
                    }
                    else{
                        error = Errors.UPS
                        completion(temperatura, cultivo, error)
                    }
                }
                
            case .failure( _):
                completion(temperatura, cultivo, Errors.UPS)
            }
        }
        
    }
    
    func activeCultivo(cultivo:Cultivo?, completion: @escaping (String?, ErrorEntity?) -> Void){
        
        var error:ErrorEntity?
        var message:String?
        
        let url = ApiURL.URL_ACTIVE_CULTIVO
        print(url)
        
        let parameters : [ String : Any] = [
            "id" : cultivo?.id ?? ""
            ]
        
        print(parameters)
        
        self.alamofireManager?.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<BasicResponse>) in
            
            switch response.result {
            case .success:
                
                let data:BasicResponse = response.result.value!
                
                if(response.response?.statusCode == 200){
                    
                    if(data.success)!{
                        message = data.message
                        completion(message, error)
                    }
                    else{
                        error = Errors.UPS
                        completion(message, error)
                    }
                }
                
            case .failure( _):
                completion(message, Errors.UPS)
            }
        }
    }
    
    
    public func isThereNetworkConnection()->Bool{
        var isConnected:Bool
        isConnected = (self.reachability?.isReachable)!
        return isConnected
    }

}
