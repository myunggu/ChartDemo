//
//  DonutChartView.swift
//  ChartDemo
//
//  Created by Myunggu Kim on 15/03/2019.
//

import UIKit

@IBDesignable
class DonutChartView: UIView {

    @IBInspectable var trackWidth: CGFloat = 3
    @IBInspectable var trackColor: UIColor? = .gray
    @IBInspectable var progressColor: UIColor? = .orange
    @IBInspectable var holeColor: UIColor? = .white
    @IBInspectable var progress: CGFloat = 0.5
    
    
    var animationEnabled: Bool = true
    @IBInspectable var animationDelayTime: Double = 0.5
    
    var chartInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var progressLineCap: CAShapeLayerLineCap = .round // 양쪽 가장자리를 둥글게 표현
    
    lazy private var chartRadius = min(bounds.width/2, bounds.height/2) - max(max(chartInsets.left, chartInsets.right), max(chartInsets.top, chartInsets.bottom)) * 2.0 - trackWidth/2.0
    lazy private var progressDegrees: CGFloat = ((progress * 100.0) * 360.0)/100.0
    lazy private var centerPoint = CGPoint(x: bounds.width/2, y: bounds.height/2)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drawDonut()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
 
    func degreesToRadians(_ degree: CGFloat) -> CGFloat {
        return degree * CGFloat.pi / 180.0
    }
    
    func radiansToDegrees(_ radian: CGFloat) -> CGFloat {
        return radian * (180 / CGFloat.pi)
    }
    
    func drawDonut() {
        
        // track
        let trackLayer = CAShapeLayer()
        trackLayer.path = UIBezierPath(arcCenter: centerPoint,
                                       radius: chartRadius,
                                       startAngle: -.pi/2,
                                       endAngle: .pi + .pi/2,
                                       clockwise: true).cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor?.cgColor
        trackLayer.lineWidth = trackWidth;
        layer.addSublayer(trackLayer)
        
        if animationEnabled {
            // progress layer & animation
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDelayTime) {
                
                let progressLayer = CAShapeLayer()
                progressLayer.path = UIBezierPath(arcCenter: self.centerPoint,
                                                  radius: self.chartRadius,
                                                  startAngle: -.pi/2,
                                                  endAngle: self.degreesToRadians(self.progressDegrees) - .pi/2,
                                                  clockwise: true).cgPath
                progressLayer.fillColor = UIColor.clear.cgColor
                progressLayer.strokeColor = self.progressColor?.cgColor
                progressLayer.lineWidth = self.trackWidth
                progressLayer.lineCap = self.progressLineCap
                
                let animation = CABasicAnimation(keyPath: "strokeEnd")
                animation.duration = 0.5
                animation.fromValue = 0.0
                animation.toValue = 1.0
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                progressLayer.add(animation, forKey: nil)
                
                self.layer.addSublayer(progressLayer)
            }
        } else {
            let progressLayer = CAShapeLayer()
            progressLayer.path = UIBezierPath(arcCenter: self.centerPoint,
                                              radius: self.chartRadius,
                                              startAngle: -.pi/2,
                                              endAngle: self.degreesToRadians(self.progressDegrees) - .pi/2,
                                              clockwise: true).cgPath
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.strokeColor = self.progressColor?.cgColor
            progressLayer.lineWidth = self.trackWidth
            progressLayer.lineCap = self.progressLineCap
            self.layer.addSublayer(progressLayer)
        }
        
    }

}
