//
//  UserInfoView.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit

class UserInfoView: UIView {
    
    let nameTxtFld = UITextField()
    let emailTxtfld = UITextField()
    let mobileNumTxtFld = UITextField()
    let genderTxtFld = PickerViewTextField()

    let submitBtn = UIButton()
    
    var layoutDict = [String: AnyObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(Base view: UIView) {
        view.backgroundColor = .white
        
        self.nameTxtFld.placeholder = "User Name"
        self.nameTxtFld.layer.cornerRadius = 5
        self.nameTxtFld.layer.borderWidth = 1
        self.nameTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        self.nameTxtFld.backgroundColor = .lightGray
        self.nameTxtFld.font = UIFont.boldSystemFont(ofSize: 15)
        self.nameTxtFld.textAlignment = .center
        self.nameTxtFld.textColor = .black
        self.nameTxtFld.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["nameTxtFld"] = nameTxtFld
        view.addSubview(nameTxtFld)

        self.emailTxtfld.placeholder = "Email"
        self.emailTxtfld.layer.cornerRadius = 5
        self.emailTxtfld.layer.borderWidth = 1
        self.emailTxtfld.layer.borderColor = UIColor.lightGray.cgColor
        self.emailTxtfld.backgroundColor = .lightGray
        self.emailTxtfld.keyboardType = .emailAddress
        self.emailTxtfld.font = UIFont.boldSystemFont(ofSize: 15)
        self.emailTxtfld.textAlignment = .center
        self.emailTxtfld.textColor = .black
        self.emailTxtfld.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["emailTxtfld"] = emailTxtfld
        view.addSubview(emailTxtfld)
        
        self.mobileNumTxtFld.placeholder = "Mobile Number"
        self.mobileNumTxtFld.layer.cornerRadius = 5
        self.mobileNumTxtFld.layer.borderWidth = 1
        self.mobileNumTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        self.mobileNumTxtFld.backgroundColor = .lightGray
        self.mobileNumTxtFld.keyboardType = .numberPad
        self.mobileNumTxtFld.font = UIFont.boldSystemFont(ofSize: 15)
        self.mobileNumTxtFld.textAlignment = .center
        self.mobileNumTxtFld.textColor = .black
        self.mobileNumTxtFld.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["mobileNumTxtFld"] = mobileNumTxtFld
        view.addSubview(mobileNumTxtFld)
        
        self.genderTxtFld.placeholder = "Select Gender"
        self.genderTxtFld.layer.cornerRadius = 5
        self.genderTxtFld.layer.borderWidth = 1
        self.genderTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        self.genderTxtFld.backgroundColor = .lightGray
        self.genderTxtFld.font = UIFont.boldSystemFont(ofSize: 15)
        self.genderTxtFld.textAlignment = .center
        self.genderTxtFld.textColor = .black
        self.genderTxtFld.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["genderTxtFld"] = genderTxtFld
        view.addSubview(genderTxtFld)
        
        
        submitBtn.setTitle("Submit Data", for: .normal)
        submitBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        submitBtn.setTitleColor(UIColor.white, for: .normal)
        submitBtn.backgroundColor = UIColor.black
        submitBtn.layer.cornerRadius = 5
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["submitBtn"] = submitBtn
        view.addSubview(submitBtn)
        
        nameTxtFld.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[nameTxtFld(40)]-30-[emailTxtfld(40)]-30-[mobileNumTxtFld(40)]-30-[genderTxtFld(40)]", options: [.alignAllLeading,.alignAllTrailing], metrics: nil, views: layoutDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[genderTxtFld]-50-[submitBtn(30)]", options: [], metrics: nil, views: layoutDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[nameTxtFld]-20-|", options: [], metrics: nil, views: layoutDict))
        
        submitBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        submitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
}
