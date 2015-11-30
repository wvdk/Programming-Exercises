//
//  AlbumView.swift
//  BlueLibrarySwift
//
//  Created by Wesley Van der Klomp on 11/29/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class AlbumView: UIView {
    
    private var coverImage: UIImageView!
    private var indicator: UIActivityIndicatorView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(frame: CGRect, albumCover: String) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.blackColor()
        self.coverImage = UIImageView(frame: CGRect(x: 5, y: 5, width: frame.width - 10, height: frame.height - 10))
        self.addSubview(coverImage)
        self.indicator = UIActivityIndicatorView()
        self.indicator.center = self.center
        self.indicator.activityIndicatorViewStyle = .WhiteLarge
        self.indicator.startAnimating()
        self.addSubview(indicator)
    }
    
    func highlightAlbum(didHighlightView: Bool) {
        if didHighlightView == true {
            self.backgroundColor = UIColor.whiteColor()
        } else {
            self.backgroundColor = UIColor.blackColor()
        }
    }
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}