

import UIKit
import SVProgressHUD

class ActualizarViewController: UIViewController, UITextFieldDelegate {

    
    var cultivo:Cultivo?
    
    @IBOutlet weak var nombreView: UIView!
    @IBOutlet weak var tempMaxView: UIView!
    @IBOutlet weak var temMinView: UIView!
    @IBOutlet weak var fechaInicialView: UIView!
    @IBOutlet weak var fechaFinalView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var activeButton: UIButton!
    
    
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
            let cultivo = Cultivo(id: self.cultivo?.id, nombre: nombre, temperaturaMax: tempMax, temperaturaMin: tempMin, fechaInicial: fechaInicial, fechaFinal: fechaFinal, active:false)
            SVProgressHUD.show()
            RestApi.sharedInstance.updateCultivo(cultivo: cultivo) { (success, message, error) in
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
    
    
    @IBAction func activeButtonPressed(_ sender: Any) {
        
        
        let refreshAlert = UIAlertController(title: "Confirmación", message: "Está seguro que desea activar el cultivo?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            SVProgressHUD.show()
            RestApi.sharedInstance.activeCultivo(cultivo: self.cultivo) { (message, error) in
                
                SVProgressHUD.dismiss()
                if(error == nil){
                    if(message != nil){
                        Utils.showBasicAlert(title: "Información", message: message, view: self)
                    }
                    else{
                        Utils.showCustomAlert(error: error, view: self)
                    }
                }
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        self.present(refreshAlert, animated: true, completion: nil)
        
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

    
    func initView(){
        self.nombreView.asRounded(Constants.RADIUS_BUTTON)
        self.tempMaxView.asRounded(Constants.RADIUS_BUTTON)
        self.temMinView.asRounded(Constants.RADIUS_BUTTON)
        self.fechaInicialView.asRounded(Constants.RADIUS_BUTTON)
        self.fechaFinalView.asRounded(Constants.RADIUS_BUTTON)
        self.saveButton.asRounded(Constants.RADIUS_BUTTON)
        self.activeButton.asRounded(Constants.RADIUS_BUTTON)
        fechaInicialPickerView.datePickerMode = UIDatePickerMode.date
        fechaInicialPickerView.addTarget(self, action: #selector(NuevoCultivoViewController.InicialPickerValueChanged), for: UIControlEvents.valueChanged)
        
        fechaFinalPickerView.datePickerMode = UIDatePickerMode.date
        fechaFinalPickerView.addTarget(self, action: #selector(NuevoCultivoViewController.FinalPickerValueChanged), for: UIControlEvents.valueChanged)
        
        self.nombreTextField.text = self.cultivo?.nombre
        self.tempMaxTextField.text = "\(cultivo?.temperaturaMax ?? 0)"
        self.tempMinTextField.text = "\(cultivo?.temperaturaMin ?? 0)"
        self.fechaInicialTextField.text = cultivo?.fechaInicial?.stringDateToString()
        self.fechaFinalTextField.text = cultivo?.fechaFinal?.stringDateToString()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
