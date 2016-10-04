//
//  UIView+Init.swift
//  iOS-Swift-Base-MVVM
//
//  Created by Daniel Yanuar Sebastian on 10/4/16.
//  Copyright © 2016 Daniel Yanuar Sebastian. All rights reserved.
//

import UIKit

extension UIView {
  //MARK: Public Static Function
  static func getViewFromNib(bundle bdl: Bundle? = nil) -> UIView? {
    return self.getViewFromNib(bundle: bdl, nibName: nil, tag: -1)
  }
  
  static func getViewFromNib(bundle bdl: Bundle? = nil, nibName strNibName: String? = nil, tag intTag: Int) -> UIView? {
    let nib: UINib
    
    let bdlSelected: Bundle
    
    if let _bdl = bdl {
      bdlSelected = _bdl
    } else {
      bdlSelected = Bundle(for: self.classForCoder())
    }
    
    if let strNibName = strNibName {
      nib = UINib(nibName: strNibName, bundle: bdlSelected)
    } else {
      nib = UINib(nibName: String(describing: self.classForCoder()), bundle: bdlSelected)
    }
    
    let arrObj: [Any]  = nib.instantiate(withOwner: nil, options: nil)
    
    var vwSelected: UIView?
    
    if let arrVw: [UIView] = arrObj as? [UIView] {
      for vw in arrVw {
        if intTag == -1 {
          if vw.isKind(of: self.classForCoder()) {
            vwSelected = vw
            
            break
          }
        } else if vw.tag == intTag {
          vwSelected = vw
            
          break
        }
      }
    }
    
    return vwSelected
  }
  
  //MARK: Public Function
  func getViewFromNib(bundle bdl: Bundle? = nil) -> UIView? {
    return getViewFromNib(bundle: bdl, nibName: nil, tag: -1)
  }
  
  func getViewFromNib(bundle bdl: Bundle? = nil, nibName strNibName: String? = nil, tag intTag: Int) -> UIView? {
    let nib: UINib
    
    let bdlSelected: Bundle
    
    if let _bdl = bdl {
      bdlSelected = _bdl
    } else {
      bdlSelected = Bundle(for: self.classForCoder)
    }
    
    if let strNibName = strNibName {
      nib = UINib(nibName: strNibName, bundle: bdlSelected)
    } else {
      nib = UINib(nibName: String(describing: self.classForCoder), bundle: bdlSelected)
    }
    
    let arrObj: [Any]  = nib.instantiate(withOwner: nil, options: nil)
    
    var vwSelected: UIView?
    
    if let arrVw: [UIView] = arrObj as? [UIView] {
      for vw in arrVw {
        if intTag == -1 {
          vwSelected = vw
          
          break
        } else if vw.tag == intTag {
          vwSelected = vw
          
          break
        }
      }
    }
    
    if let _vwSelected: UIView = vwSelected {
      _vwSelected.frame = bounds
    }
    
    return vwSelected
  }
}
