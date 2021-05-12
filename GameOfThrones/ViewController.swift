//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Mesut Aygün on 11.05.2021.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    var houses = Houses()
   
    var searching = false 
    var houseVeri = [HouseInfo]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
       
        
       
        
        houses.getData() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    
  
    
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.houseInfo = houses.housesArray[selectedIndexPath.row]
        }
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.housesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == houses.housesArray.count - 1 && houses.continueLoading {
            houses.getData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1).  \(houses.housesArray[indexPath.row].name)"
        return cell
    }
    
    
    
}

