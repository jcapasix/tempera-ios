
import UIKit
import SVProgressHUD

class ReporteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var reportes:[Reporte] = []
    
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
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.reportes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReporteTableViewCell
        cell.loadData(indexPath.row, self.reportes[indexPath.row])
        return cell
    }
    
    
    func initview(){
        
        SVProgressHUD.show()
        RestApi.sharedInstance.getReportes { (reportes, error) in
            SVProgressHUD.dismiss()
            self.refreshControl.endRefreshing()
            if(!(error != nil)){
                self.reportes = reportes!
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func refresh(sender: UIButton) {
        self.initview()
    }
    

}
