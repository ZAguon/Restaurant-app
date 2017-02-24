//
//  Menu.swift
//  MyResturantApp
//
//  Created by Zachary Aguon on 2/13/17.
//  Copyright © 2017 Zachary Aguon. All rights reserved.
//

import UIKit
import Firebase

class Menu: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    
    var names = ["Corn soup", "Keleguan", "Red Rice and Spare RIbs",
                 "Shrimp Patties", "Titiyas"]
    
    var summary = ["Filled with coconut milk,chicken and corn.Top on steamy hot rice", "A pickling marinade of lemon juice, fresh coconut, green onions, salt and hot red chili peppers is used to marinate cooked chicken.", "Made with traditional red rice with marinated BBQ ribs", "An appetizer that consists of shrimp and vegetables; it is deep fried and very similar to a corn fritter.", "This is an island style totillas, we called it, Titiyas."]
    
    var images = [UIImage(named: "Corn soup"),UIImage(named: "Keleguan"),UIImage(named: "Red Rice and Spare RIbs"),UIImage(named: "Shrimp Patties"),UIImage(named: "Titiyas")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        CustomCell
        
        cell.Photo.image = images[indexPath.row]
        cell.name.text = names[indexPath.row]
        cell.Description.text = summary[indexPath.row]
        
        return cell
        
    }

  
}
