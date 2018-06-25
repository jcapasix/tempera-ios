

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var ingresarButton: UIButton!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    
    // MARK: - Actions
    
    
    @IBAction func ingresarButtonPressed(_ sender: Any) {
        
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        
        if(!(username?.isEmpty)! && !(password?.isEmpty)!){
            
            SVProgressHUD.show()
            RestApi.sharedInstance.login(username: username!, password: password!) { (success, user, error) in
                SVProgressHUD.dismiss()
                if(success)!{
                    AuthManager.sharedInstance.login()
                    self.performSegue(withIdentifier: "showHome", sender: nil)
                }
                else{
                    Utils.showCustomAlert(error: error, view: self)
                }
            }
        }
        else{
            print("ingrese todos los datos")
        }
    }
    
    
    // MARK: - Own Methods
    
    func initView(){
        self.ingresarButton.asRounded(Constants.RADIUS_BUTTON)
        self.usernameView.asRounded(Constants.RADIUS_BUTTON)
        self.passwordView.asRounded(Constants.RADIUS_BUTTON)
        
        if AuthManager.sharedInstance.isLogin(){
            self.performSegue(withIdentifier: "showHome", sender: nil)
        }
    }
    
    

}
