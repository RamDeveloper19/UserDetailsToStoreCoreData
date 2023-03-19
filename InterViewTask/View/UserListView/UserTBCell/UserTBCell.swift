//
//  UserTBCell.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit

class UserTBCell: UITableViewCell {
    
    var viewContent = UIView()
    var userNameLbl = UILabel()
    var userEmailLbl = UILabel()
    var usermobileLbl = UILabel()
    var userGenderLbl = UILabel()


    var layoutDict = [String:AnyObject]()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       setUpViews()
    }
  
    func setUpViews() {

        viewContent.layer.cornerRadius = 5
        viewContent.layer.borderColor = UIColor.red.cgColor
        viewContent.layer.borderWidth = 1
        viewContent.backgroundColor = .white
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["viewContent"] = viewContent
        self.addSubview(viewContent)
        
        userNameLbl.font = UIFont.boldSystemFont(ofSize: 15)
        userNameLbl.textAlignment = .center
        userNameLbl.textColor = .black
        userNameLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["userNameLbl"] = userNameLbl
        viewContent.addSubview(userNameLbl)
        
        userEmailLbl.font = UIFont.boldSystemFont(ofSize: 13)
        userEmailLbl.textAlignment = .center
        userEmailLbl.textColor = .black
        userEmailLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["userEmailLbl"] = userEmailLbl
        viewContent.addSubview(userEmailLbl)
        
        usermobileLbl.font = UIFont.boldSystemFont(ofSize: 13)
        usermobileLbl.textAlignment = .center
        usermobileLbl.textColor = .black
        usermobileLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["usermobileLbl"] = usermobileLbl
        viewContent.addSubview(usermobileLbl)
        
        userGenderLbl.font = UIFont.boldSystemFont(ofSize: 13)
        userGenderLbl.textAlignment = .center
        userGenderLbl.textColor = .black
        userGenderLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["userGenderLbl"] = userGenderLbl
        viewContent.addSubview(userGenderLbl)

        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[viewContent]-5-|", options: [], metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[viewContent]-20-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[userNameLbl(22)]-5-[userEmailLbl(22)]-5-[usermobileLbl(22)]-5-[userGenderLbl(22)]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[userNameLbl]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[userEmailLbl]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[usermobileLbl]-10-|", options: [], metrics: nil, views: layoutDict))
        viewContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(10)-[userGenderLbl]-10-|", options: [], metrics: nil, views: layoutDict))
    }

}
