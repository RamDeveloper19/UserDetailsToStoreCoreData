//
//  GoogleMapsView.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit
import GoogleMaps

class GoogleMapsView: UIView {

    let mapview = GMSMapView()

    var layoutDict = [String: AnyObject]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(Base baseView: UIView) {

        baseView.backgroundColor = .white
        
        if let styleURL = Bundle.main.url(forResource: "mapStyleUber", withExtension: "json") {
            self.mapview.mapStyle = try? GMSMapStyle(contentsOfFileURL: styleURL)
        }
        
        mapview.settings.myLocationButton = true
        mapview.isMyLocationEnabled = false
        layoutDict["mapview"] = mapview
        mapview.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(mapview)
        
        mapview.topAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mapview.bottomAnchor.constraint(equalTo: baseView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mapview]|", options: [], metrics: nil, views: layoutDict))
        
    }

}
