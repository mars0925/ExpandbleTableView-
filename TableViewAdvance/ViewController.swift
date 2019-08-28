//
//  ViewController.swift
//  TableViewAdvance
//
//  Created by Mars on 2019/8/28.
//  Copyright © 2019 drs24. All rights reserved.
//

import UIKit

struct CellData {
    var isOpen:Bool//是否展開
    var sectionTitle:String//資料標頭
    var sectionData:[String]//資料內容
}



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*如果要展開的話回傳總個數*/
        if tableViewData[section].isOpen == true {
            return tableViewData[section].sectionData.count + 1 //多標頭
        }
            /*只顯示標頭一列*/
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*點擊標題在更新展開狀態*/
        if indexPath.row == 0 {
            /*點擊後更改展開的狀態*/
            if tableViewData[indexPath.section].isOpen == true {
                tableViewData[indexPath.section].isOpen = false
                let indexSet = IndexSet(integer: indexPath.section)//此組重新顯示資料
                tableView.reloadSections(indexSet, with: .automatic)
                
            }else{
                tableViewData[indexPath.section].isOpen = true
                let indexSet = IndexSet(integer: indexPath.section)//此組重新顯示資料
                tableView.reloadSections(indexSet, with: .automatic)
            }
        }else{
            //TODO else
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*標題*/
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionTitle
            
            return cell
        }
            /*items*/
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            
            return cell
        }
    }
    
    
    var tableViewData = [CellData]()
    
    @IBOutlet weak var mytableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData = [CellData(isOpen: false, sectionTitle: "Animals", sectionData: ["Cat","Dog","Rabbit"])
            ,CellData(isOpen: false, sectionTitle: "Colors", sectionData: ["Red","Green","Blue"]),
             CellData(isOpen: false, sectionTitle: "Number", sectionData: ["1","2","3","4","5","6","7"])]
    }
}

