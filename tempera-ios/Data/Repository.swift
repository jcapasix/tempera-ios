

import Foundation


protocol Repository{
    
    func login(username:String, password:String, completion:@escaping (_ status:Bool?, _ user: User?, _ error:ErrorEntity?) -> Void)
    
    func register(username:String, password:String, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    func getCultivos(completion:@escaping (_  cultivos:[Cultivo]?, _ error:ErrorEntity?) -> Void)
    
    func createCultivo(cultivo:Cultivo, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    func deleteCultivo(id:String, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    func updateCultivo(cultivo:Cultivo, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    func getTemp(completion: @escaping (Temperatura?, Cultivo?, ErrorEntity?) -> Void)
    
    func activeCultivo(cultivo:Cultivo?, completion: @escaping (String?, ErrorEntity?) -> Void)
    
    func getReportes(completion:@escaping (_  reportes:[Reporte]?, _ error:ErrorEntity?) -> Void)
    
    func createReporte(cultivo:String, temp:String, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
}
