//
//  Diamond.swift
//  SetGame
//
//  Created by Gabriel on 8/27/21.
//

import Foundation

import SwiftUI

struct Diamond: InsettableShape {
    
    var insetAmount: CGFloat = 0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var diamond = self
        diamond.insetAmount += amount
        return diamond
    }
    
    func path(in rect: CGRect) -> Path {
        let midTop = CGPoint(x: rect.midX, y: rect.minY + insetAmount)
        let midLeft = CGPoint(x: rect.minX + insetAmount, y: rect.midY)
        let midRight = CGPoint(x: rect.maxX - insetAmount, y: rect.midY )
        let midBottom = CGPoint(x: rect.midX, y: rect.maxY - insetAmount)
        let end = CGPoint(x: rect.minX, y: rect.midY)
        
        
        var p = Path()
        p.move(to: midLeft)
        
        // Drawing: /
        p.addLine(to: midTop)
        
        // Drawing: /\
        p.addLine(to: midRight)
        
        // Drawing: /\
        //           /
        p.addLine(to: midBottom)
        
        // Drawing: /\
        //          \/
        p.addLine(to: end)
        
        return p
    }
}
