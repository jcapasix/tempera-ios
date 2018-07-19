

import UIKit

class CultivoTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var temperaturaMaxLabel: UILabel!
    @IBOutlet weak var temperaturaMinLabel: UILabel!
    @IBOutlet weak var fechaInicialLabel: UILabel!
    @IBOutlet weak var fechaFinalLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func loadData(_ cultivo:Cultivo){
        
        //self.cell = application
        
        self.nombreLabel.text = "Nombre: \(String(describing: cultivo.nombre!))"
        self.temperaturaMaxLabel.text = "Temperatura Máxima: \(String(describing: cultivo.temperaturaMax!))"
        self.temperaturaMinLabel.text = "Temperatura Mínima: \(String(describing: cultivo.temperaturaMin!))"
        
        self.fechaInicialLabel.text = "Fecha Inicial: " + (cultivo.fechaInicial?.stringDateToString())!
        
        self.fechaFinalLabel.text = "Fecha Final: " + (cultivo.fechaFinal?.stringDateToString())!
        
        var color:String?
        
        if cultivo.active!{
            color = "2196F3"
        }
        else{
            color = "FFC107"
        }
        self.activeLabel.backgroundColor = UIColor(hex: color!)
    
    }

}
