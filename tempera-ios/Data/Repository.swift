

import Foundation


protocol Repository{
    
    func login(username:String, password:String, completion:@escaping (_ status:Bool?, _ user: User?, _ error:ErrorEntity?) -> Void)
    
    func register(username:String, password:String, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    func getCultivos(completion:@escaping (_  cultivos:[Cultivo]?, _ error:ErrorEntity?) -> Void)
    
    func createCultivo(cultivo:Cultivo, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    func deleteCultivo(id:String, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    func updateCultivo(cultivo:Cultivo, completion:@escaping (_ status:Bool?, _ message: String?, _ error:ErrorEntity?) -> Void)
    
    
//    func getMessages(completion:@escaping (_  messages:[MessageEntity]?, _ error:ErrorEntity?) -> Void)
//    
//    func getApplications(completion:@escaping (_  applications:[ApplicationEntity]?, _ error:ErrorEntity?) -> Void)
//    
//    func getMeetings(completion:@escaping (_  meetings:[MeetingEntity]?, _ error:ErrorEntity?) -> Void)
}
