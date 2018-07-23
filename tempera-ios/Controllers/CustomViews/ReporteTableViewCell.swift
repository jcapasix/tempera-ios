//
//  ReporteTableViewCell.swift
//  tempera-ios
//
//  Created by Jordan Capa on 22/07/18.
//  Copyright © 2018 Jose Rojas. All rights reserved.
//

import UIKit

class ReporteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var codigoLabel: UILabel!
    @IBOutlet weak var nombreCultivoLabel: UILabel!
    @IBOutlet weak var numeroAlertasLabel: UILabel!
    @IBOutlet weak var promedioTemperaturaLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func loadData(_ index:Int, _ reporte:Reporte){
        self.codigoLabel.text = "C \(index)"
        self.nombreCultivoLabel.text = "Nombre: \(String(describing: reporte.cultivo?.nombre! ?? ""))"
        self.numeroAlertasLabel.text = "Temperatura Máxima: \(String(describing: reporte.alertas!))"
        self.promedioTemperaturaLabel.text = "Temperatura Mínima: \(String(describing: reporte.temperatura!))"
    }

}
