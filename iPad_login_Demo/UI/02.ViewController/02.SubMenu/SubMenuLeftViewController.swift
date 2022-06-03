//
//  SubMenuLeftViewController.swift
//  iPad_login_Demo
//
//  Created by NECVN on 28/05/2022.
//

import UIKit

class SubMenuLeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var rightButtonView: UIStackView!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var leftTotalNumber: UILabel!
    @IBOutlet weak var leftTableView: UITableView!
    
    @IBOutlet weak var rightTotalNumber: UILabel!
    @IBOutlet weak var rightTableView: UITableView!
    var leftData = ["ダザト","ダザト","ダザト"]
    var rightData = ["010011","010","010071","016","017001","017","017021","064","064611","064","064681","90001","010011","010011","010011","010011","010011","010011","010011","010011","010011","010011","010011","010011"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElement()
        leftTableView.dataSource = self
        leftTableView.delegate = self
        
        rightTableView.delegate = self
        rightTableView.dataSource = self
        
        leftTableView.register(UINib(nibName: "SubMenuLeft_LeftCell", bundle: nil), forCellReuseIdentifier: "SubMenuLeft_LeftCell")
        rightTableView.register(UINib(nibName: "SubMenuLeft_RightCell", bundle: nil), forCellReuseIdentifier: "SubMenuLeft_RightCell")

    }
    
    func setUpElement(){
        Utilities.styleButton(reloadButton, 5)
        Utilities.styleLabel(leftTotalNumber, radius: 10)
        Utilities.styleView(rightButtonView, radius: 5)
        Utilities.styleLabel(rightTotalNumber, radius: 10)
        leftTotalNumber.text = String(leftData.count)
        rightTotalNumber.text = String(rightData.count)
        leftTableView.backgroundColor = .clear

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return leftData.count
        }
        else {
            return rightData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == leftTableView{
            let leftCell = tableView.dequeueReusableCell(withIdentifier: "SubMenuLeft_LeftCell", for: indexPath) as! SubMenuLeft_LeftCell
            leftCell.leftLabel.text = leftData[indexPath.row]
            Utilities.colorCell(cell: leftCell, index: indexPath.row)
            return leftCell
            
        }
        else{
            let rightCell = tableView.dequeueReusableCell(withIdentifier: "SubMenuLeft_RightCell", for: indexPath) as! SubMenuLeft_RightCell
            rightCell.rightLabel.text = rightData[indexPath.row]
            Utilities.colorCell(cell: rightCell, index: indexPath.row)
            return rightCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == leftTableView{
            let leftCell = tableView.cellForRow(at: indexPath) as! SubMenuLeft_LeftCell
            Utilities.formatCellBackroundOnClick(cell: leftCell)
            leftCell.leftLabel.textColor = .white
            
            
        }
        else{
            let rightCell = tableView.cellForRow(at: indexPath) as! SubMenuLeft_RightCell
            Utilities.formatCellBackroundOnClick(cell: rightCell)
            rightCell.rightLabel.textColor = .white
        }
         
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView == leftTableView{
            if let leftCell = tableView.cellForRow(at: indexPath) as? SubMenuLeft_LeftCell{
                leftCell.leftLabel.textColor = .black
                Utilities.colorCell(cell: leftCell, index: indexPath.row)
            }
        }
        else{
            if let rightCell = tableView.cellForRow(at: indexPath) as? SubMenuLeft_RightCell{
                rightCell.rightLabel.textColor = .black
                Utilities.colorCell(cell: rightCell, index: indexPath.row)
            }
        }
    }
    
}
