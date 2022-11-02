//
//  HomeViewController.swift
//  WDTestApp
//
//  Created by sushil Chaudhary on 9/29/22.
//

import UIKit
import SDWebImage
class HomeViewController: UIViewController {
    //MARK: - iBOutlet
    //------------------
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK: - variables
    //------------------
    var viewModel = UserImageListViewModel()
    var recipeData = [Recipe]()
    
    //MARK: - lifeCycles
    //------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = "List"
        homeTableView.register(UINib(nibName:"listCell", bundle: nil), forCellReuseIdentifier:"listCell")
        homeTableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        imageListAPI()
    }
    
    //MARK: - iBACtion
    //------------------
    @IBAction func logOutBtn(_ sender: UIButton) {
        UserDefaults.standard.setValue(" ", forKey: "token")
        UserDefaults.standard.setValue(false, forKey: "Login")
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - function()
    //------------------
    func imageListAPI(){
        viewModel.UserListImageApi { (isSuccess, message) in
            if isSuccess{
                for indexx in 0...(((self.viewModel.model?.data.count)!)-1){
                    self.recipeData.append(contentsOf:(self.viewModel.model?.data[indexx].recipe)!)
                }
                self.homeTableView.reloadData()
                print("-------------API Has Been Succeed-----------")
            }else{
                print("-------------API Has not Been Succeed-----------")
            }
        }
    }
    
    //MARK: - @objc func()
    //------------------
}

    //MARK: - extension
    //------------------
extension HomeViewController:UITableViewDataSource{
    
    //Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = homeTableView.dequeueReusableCell(withIdentifier: "listCell") as! listCell
        listCell.innerView.layer.cornerRadius = 7
        listCell.cellImageView.sd_setImage(with: URL(string: "\(recipeData[indexPath.row].image)"))
        listCell.nameLbl.text = "Title: - \(recipeData[indexPath.row].title)"
        listCell.noOfDishesLbl.text = "No Of Dishes : - \(recipeData[indexPath.row].numberOfDishes)"
        listCell.idLbl.text = "ID : -\(recipeData[indexPath.row].id)"
        listCell.userIdLbl.text = "UserID : -\(recipeData[indexPath.row].userID)"
        return listCell
    }
}
