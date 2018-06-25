

import UIKit
import SVProgressHUD

class CultivosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cultivos:[Cultivo] = []
    
    var refreshControl = UIRefreshControl()
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "")
        self.refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)
        
        self.initview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.initview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cultivos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CultivoTableViewCell
        cell.loadData(self.cultivos[indexPath.row])
        return cell
     }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let editar = UITableViewRowAction(style: .normal, title: "Editar") { action, index in
            print("more button tapped")
            
            self.performSegue(withIdentifier: "showUpdateCultivo", sender: self.cultivos[editActionsForRowAt.row])
        }
        editar.backgroundColor = .blue
        
        
        let eliminar = UITableViewRowAction(style: .normal, title: "Eliminar") { action, index in
            
            let refreshAlert = UIAlertController(title: "Confirmación", message: "Está seguro que desea eliminar el cultivo?", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                SVProgressHUD.show()
                RestApi.sharedInstance.deleteCultivo(id: self.cultivos[editActionsForRowAt.row].id!, completion: { (success, message, error) in
                    SVProgressHUD.dismiss()
                    if(success)!{
                        Utils.showBasicAlert(title: "Información", message: message, view: self)
                        self.initview()
                    }
                    else{
                        Utils.showCustomAlert(error: error, view: self)
                    }
                    
                })
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            self.present(refreshAlert, animated: true, completion: nil)
        }
        eliminar.backgroundColor = .red
        
        return [eliminar, editar]
    }
    
    
    func initview(){
    
        SVProgressHUD.show()
        RestApi.sharedInstance.getCultivos { (cultivos, error) in
            SVProgressHUD.dismiss()
            self.refreshControl.endRefreshing()
            if(!(error != nil)){
                self.cultivos = cultivos!
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func refresh(sender: UIButton) {
        self.initview()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        
        if(segue.identifier == "showUpdateCultivo"){
            
            let cultivo = sender as! Cultivo
            
            let view = segue.destination as! ActualizarViewController
            view.cultivo = cultivo
        }
    }
    

}
