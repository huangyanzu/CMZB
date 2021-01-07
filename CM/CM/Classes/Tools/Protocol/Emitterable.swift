//
//  Emitterable.swift
//  粒子动画
//
//  Created by aZu on 2021/1/7.
//

import UIKit


protocol Emitterable {
    
   
    
}

extension Emitterable where Self : UIViewController {
    
    func startEmitter(point:CGPoint)  {
      
        let emitter =  CAEmitterLayer()
         
        emitter.emitterPosition = point
         emitter.preservesDepth = true
         
        var cells = [CAEmitterCell]()
        
        for i in 0..<10{
            let cell = CAEmitterCell()
            cell.velocity = 150
            cell.velocityRange = 100
            
            cell.scale = 0.7
            cell.scaleRange = 0.3
            
            cell.emissionLongitude = CGFloat( -Double.pi / 2)
            cell.emissionRange = CGFloat(Double.pi / 12 )
            
            cell.birthRate = 3
            
            cell.lifetime = 3
            
            cell.lifetimeRange = 1.5
            
   //         cell.spin = CGFloat(Double.pi / 2)
   //         cell.spinRange = CGFloat(Double.pi / 4)
            
            cell.contents = UIImage(named: "good\(i)_30x30")?.cgImage
            
            cells.append(cell)
        }
        emitter.emitterCells = cells
        
        view.layer.addSublayer(emitter)
       
    }
    
    func stopEmitter() {
        /*
        for layer in view.layer.sublayers!{
            if layer.isKind(of: CAEmitterLayer.self){
                layer.removeFromSuperlayer()
            }
            
        }
         */
        
       view.layer.sublayers?.filter({ $0.isKind(of: CAEmitterLayer.self) }).first?.removeFromSuperlayer()
        

    }
    
    
}
