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
        self.nombreCultivoLabel.text = "Nombre Cultivo: \(String(describing: reporte.cultivo?.nombre! ?? ""))"
        self.numeroAlertasLabel.text = "Número de Alertas: \(String(describing: reporte.alertas!))"
        self.promedioTemperaturaLabel.text = "Temperatura Promedio: \(String(describing: reporte.temperatura!))"
    }

}
