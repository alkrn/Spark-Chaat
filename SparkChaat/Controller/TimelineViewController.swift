import AlamofireImage
import UIKit

class TimelineCell: UITableViewCell {
    @IBOutlet var imageUser: UIImageView!
    @IBOutlet var lblDisplayName: UILabel!
    @IBOutlet var lblAge: UILabel!
    
    func loadImage(path: String) {
        imageUser.af.setImage(withURL: URL(string: path)!)
    }
}

class TimelineViewController: UITableViewController {
    var items: [TimelineItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Timeline"
        ServerAPI.timeline { data, error in
            self.items = TimelineItem.decode(fromArray: data)
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell", for: indexPath) as! TimelineCell
        
        let data = items[indexPath.row]
        cell.lblDisplayName.text = data.displayName
        cell.lblAge.text = "\(data.age)"
        
        if let cropped = data.images.first?.cropped {
            cell.loadImage(path: cropped)
        }
        
       
        return cell
    }
}
