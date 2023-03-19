//
//  UserListVC.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit

class UserListVC: UIViewController {
    
    var userListView = UserListView()
    
    var savedData = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "User Data List"
        self.navigationController?.navigationBar.isHidden = false
        self.setupViews()
    }
    
    func setupViews() {
        
        self.userListView.setupViews(Base: self.view)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ADD", style: .done, target: self, action: #selector(AddUserInfoAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Maps", style: .done, target: self, action: #selector(mapNavigationAction))
        self.setupTarget()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        LocalDataBase.shared.fetchUserDetails()
//        self.DeleteAll()
        self.savedData = LocalDataBase.shared.userData
        if self.savedData.count > 0 {
            self.userListView.userTbl.isHidden = false
            self.userListView.dataNotAvailableLbl.isHidden = true
            self.userListView.userTbl.reloadData()
        } else {
            self.userListView.userTbl.isHidden = true
            self.userListView.dataNotAvailableLbl.isHidden = false
        }
    }

    func setupTarget() {
        self.userListView.userTbl.register(UserTBCell.self, forCellReuseIdentifier: "UserTBCell")
        self.userListView.userTbl.delegate = self
        self.userListView.userTbl.dataSource = self
    }
    
}
extension UserListVC {
    @objc func AddUserInfoAction(sender: UIBarButtonItem) {
        let vc = UserInfoVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func mapNavigationAction(sender: UIBarButtonItem) {
        let vc = GoogleMapsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func DeleteAll() {
        LocalDataBase.shared.deleteUserDetails()
    }
}
extension UserListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.savedData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTBCell") as? UserTBCell ?? UserTBCell()
        
        cell.selectionStyle = .none
        
        let user = self.savedData
        cell.userNameLbl.text = user[indexPath.row].name
        cell.userEmailLbl.text = user[indexPath.row].email
        cell.usermobileLbl.text = user[indexPath.row].mobile
        cell.userGenderLbl.text = user[indexPath.row].gender
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UserInfoVC()
        vc.givenUserData = self.savedData[indexPath.row]
        vc.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
