

import UIKit
import SVProgressHUD


class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var repeatPasswordView: UIView!
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        let repeatPassword = self.repeatPasswordTextField.text
        
        if((username?.isEmpty)! || (password?.isEmpty)! || (repeatPassword?.isEmpty)!){
            Utils.showBasicAlert(title: "Error", message: "Verifique que los campos no estén vacios", view: self)
        }
        else{
            
            if(password == repeatPassword){
                SVProgressHUD.show()
                RestApi.sharedInstance.register(username: username!, password: password!) { (success, message, error) in
                    SVProgressHUD.dismiss()
                    if(success)!{
                        //Utils.showBasicAlert(title: "Información", message: message, view: self)
                        
                        let refreshAlert = UIAlertController(title: "Información", message: message, preferredStyle: UIAlertControllerStyle.alert)
                        
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                            
                            self.dismiss(animated: true, completion: nil)
                        }))
                        
                        
                        self.present(refreshAlert, animated: true, completion: nil)
                        
                    }
                    else{
                        Utils.showCustomAlert(error: error, view: self)
                    }
                }
            }
            else{
                Utils.showBasicAlert(title: "Error", message: "Las contraseñas no coinciden", view: self)
            }
        }
        
    }

    // MARK: - Own Methods
    
    func initView(){
        self.registerButton.asRounded(Constants.RADIUS_BUTTON)
        self.usernameView.asRounded(Constants.RADIUS_BUTTON)
        self.passwordView.asRounded(Constants.RADIUS_BUTTON)
        self.repeatPasswordView.asRounded(Constants.RADIUS_BUTTON)
    }

}
