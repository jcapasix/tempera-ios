

import UIKit
import SVProgressHUD

class NuevoCultivoViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nombreView: UIView!
    @IBOutlet weak var tempMaxView: UIView!
    @IBOutlet weak var temMinView: UIView!
    @IBOutlet weak var fechaInicialView: UIView!
    @IBOutlet weak var fechaFinalView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var tempMaxTextField: UITextField!
    @IBOutlet weak var tempMinTextField: UITextField!
    @IBOutlet weak var fechaInicialTextField: UITextField!
    @IBOutlet weak var fechaFinalTextField: UITextField!
    
    let fechaInicialPickerView = UIDatePicker()
    let fechaFinalPickerView = UIDatePicker()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let nombre = nombreTextField.text
        let tempMax = Int(tempMaxTextField.text!)
        let tempMin = Int(tempMinTextField.text!)
        let fechaInicial = fechaInicialTextField.text
        let fechaFinal = fechaFinalTextField.text
        
        if((nombre?.isEmpty)! || (tempMaxTextField.text?.isEmpty)! || (tempMinTextField.text?.isEmpty)! || (fechaInicial?.isEmpty)! || (fechaFinal?.isEmpty)!){
            Utils.showBasicAlert(title: "Error", message: "Verifique que los campos no estén vacios", view: self)
        }
        else{
            let cultivo = Cultivo(id: "0", nombre: nombre, temperaturaMax: tempMax, temperaturaMin: tempMin, fechaInicial: fechaInicial, fechaFinal: fechaFinal, active: false)
            SVProgressHUD.show()
            RestApi.sharedInstance.createCultivo(cultivo: cultivo) { (success, message, error) in
                SVProgressHUD.dismiss()
                if(success)!{
                    print("Ok")
                    self.navigationController?.popViewController(animated: true)
                }
                else{
                    print("Error")
                }
            }
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case self.fechaInicialTextField:
            textField.inputView = fechaInicialPickerView
        case self.fechaFinalTextField:
            textField.inputView = fechaFinalPickerView
        default:break
            
        }
    }
    
    @objc func InicialPickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        self.fechaInicialTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func FinalPickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        self.fechaFinalTextField.text = dateFormatter.string(from: sender.date)
    }
    
    func initView(){
        self.nombreView.asRounded(Constants.RADIUS_BUTTON)
        self.tempMaxView.asRounded(Constants.RADIUS_BUTTON)
        self.temMinView.asRounded(Constants.RADIUS_BUTTON)
        self.fechaInicialView.asRounded(Constants.RADIUS_BUTTON)
        self.fechaFinalView.asRounded(Constants.RADIUS_BUTTON)
        self.saveButton.asRounded(Constants.RADIUS_BUTTON)
        
        fechaInicialPickerView.datePickerMode = UIDatePickerMode.date
        fechaInicialPickerView.addTarget(self, action: #selector(NuevoCultivoViewController.InicialPickerValueChanged), for: UIControlEvents.valueChanged)
        
        fechaFinalPickerView.datePickerMode = UIDatePickerMode.date
        fechaFinalPickerView.addTarget(self, action: #selector(NuevoCultivoViewController.FinalPickerValueChanged), for: UIControlEvents.valueChanged)
    }

}
