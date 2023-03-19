//
//  UserListView.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit

class UserListView: UIView {
    
    let userTbl = UITableView()
    let dataNotAvailableLbl = UILabel()
    
    var layoutDict = [String: AnyObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(Base baseView: UIView) {
        baseView.backgroundColor = .white
        
        dataNotAvailableLbl.isHidden = true
        dataNotAvailableLbl.textColor = .black
        dataNotAvailableLbl.textAlignment = .center
        dataNotAvailableLbl.font = UIFont.boldSystemFont(ofSize: 16)
        dataNotAvailableLbl.text = "User Data Not Available!!!"
        dataNotAvailableLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["dataNotAvailableLbl"] = dataNotAvailableLbl
        baseView.addSubview(dataNotAvailableLbl)
        
        userTbl.isHidden = true
        userTbl.tableFooterView = UIView()
        userTbl.separatorStyle = .none
        userTbl.alwaysBounceVertical = false
        userTbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["userTbl"] = userTbl
        baseView.addSubview(userTbl)
        
        userTbl.topAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.topAnchor).isActive = true
        userTbl.bottomAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[userTbl]|", options: [], metrics: nil, views: layoutDict))
        
        dataNotAvailableLbl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[dataNotAvailableLbl]-20-|", options: [], metrics: nil, views: layoutDict))

        dataNotAvailableLbl.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        dataNotAvailableLbl.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
    }
    
}
