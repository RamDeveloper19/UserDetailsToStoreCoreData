//
//  UserInfoVC.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit
import Alamofire

class UserInfoVC: UIViewController {

    var userView = UserInfoView()
    
    var givenUserData: UserData?
    var selectedIndex: Int?
    
    var savedData = [UserData]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "User Details"
        self.navigationController?.navigationBar.isHidden = false
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.savedData = LocalDataBase.shared.userData
        self.loadTextField()
    }
    
    func setupViews() {
        
        self.userView.setupViews(Base: self.view)
        self.setupTarget()
        self.pickerViewTools()
    }
    
    func setupTarget() {
        self.userView.genderTxtFld.itemList = ["Male","Female"]
        self.userView.submitBtn.addTarget(self, action: #selector(btnSubmitPressed(_ :)), for: .touchUpInside)
    }
    
    func loadTextField() {
        if self.givenUserData != nil {
            self.userView.nameTxtFld.text = givenUserData?.name
            self.userView.emailTxtfld.text = givenUserData?.email
            self.userView.mobileNumTxtFld.text = givenUserData?.mobile
            self.userView.genderTxtFld.text = givenUserData?.gender
        }
    }
}

extension UserInfoVC {
    
    @objc func btnSubmitPressed(_ sender: UIButton) {
        if self.userView.nameTxtFld.text == "" || !(self.userView.nameTxtFld.text?.isValidName ?? false) {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your name?")
        } else if self.userView.emailTxtfld.text == "" || !(self.userView.emailTxtfld.text?.isValidEmail ?? false) {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your Email")
        } else if self.userView.mobileNumTxtFld.text!.count > 10 || self.userView.mobileNumTxtFld.text!.count < 10  {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your valid Mobile Number?")
        }else if self.userView.genderTxtFld.text == ""  {
            self.showAlert(LocalDataBase.shared.appName, message: "Please Enter your Gender?")
        } else {
            self.updateUserDetailsInLocal()
        }
    }
    
    func updateUserDetailsInLocal() {
        var userDetails = [String: String]()
        userDetails["Name"] = self.userView.nameTxtFld.text
        userDetails["Email"] = self.userView.emailTxtfld.text
        userDetails["Mobile"] = self.userView.mobileNumTxtFld.text
        userDetails["Gender"] = self.userView.genderTxtFld.text
        
        if self.givenUserData != nil {
            guard let id = self.savedData[self.selectedIndex ?? 0].id else { return }
            userDetails["Id"] = "\(id)"
            LocalDataBase.shared.updateUserDetails([userDetails],index: id)
        } else {
            userDetails["Id"] = "\(self.savedData.count+1)"
            LocalDataBase.shared.storeUserDetails([userDetails], currentUser: nil)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
extension UserInfoVC {
    
    func pickerViewTools() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelTapped))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        userView.genderTxtFld.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        self.userView.genderTxtFld.resignFirstResponder()
    }

    @objc func cancelTapped() {
        self.userView.genderTxtFld.resignFirstResponder()
    }
}
