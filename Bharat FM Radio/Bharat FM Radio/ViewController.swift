//
//  ViewController.swift
//  Bharat FM Radio
//
//  Created by RAMDHAN CHOUDHARY on 10/08/19.
//  Copyright © 2019 RDC Innovations Pvt Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fmListTableView: UITableView!
    var fmListArry:[String] = ["Bhart FM Radio", "Vividh Bharti", "All India Radio" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        transparentNavigationBar()
    }
    
    func transparentNavigationBar()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fmListArry.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.fmListTableView.dequeueReusableCell(withIdentifier: "FMListCell") as UITableViewCell?)!
        cell.selectionStyle = .none
        cell.textLabel?.text = self.fmListArry[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(22))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Play FM Radio")
        performSegue(withIdentifier: "showPlayerViewController", sender: self)
    }
    
    
    

    
}

