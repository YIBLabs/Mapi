//
//  MainVC.swift
//  Mapi
//
//  Created by Mavi on 13/11/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        loadJSON()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FlagCell {
            
            return cell
        }
        
        return UITableViewCell()
    }

    func loadJSON() {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            
            let url = URL(fileURLWithPath: path)
            
            do {
                let jsonData = try Data(contentsOf: url, options: .mappedIfSafe)
                
                if let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [Dictionary<String, String>] {
                    
                    for country in jsonResult {
                        
                        if let countryName = country["Name"], let countryCode = country["Code"] {
                            
                            print("\(countryName) \(countryCode)")
                        }
                    }
                }
            
                
            } catch {
                
                print("Error parsing JSON")
            }
        }
    }

}
