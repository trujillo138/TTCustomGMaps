//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let star = UIBezierPath()
star.move(to: CGPoint(x: 15.0, y: 100))
star.addLine(to: CGPoint(x: 20.0, y: 70.0))
star.addLine(to: CGPoint(x: 0.0, y: 50.0))
star.addLine(to: CGPoint(x: 30.0, y: 40.0))
star.addLine(to: CGPoint(x: 50.0, y: 10.0))
star.addLine(to: CGPoint(x: 70.0, y: 40.0))
star.addLine(to: CGPoint(x: 100.0, y: 50.0))
star.addLine(to: CGPoint(x: 80.0, y: 70.0))
star.addLine(to: CGPoint(x: 85.0, y: 100.0))
star.addLine(to: CGPoint(x: 50.0, y: 80.0))
star.addLine(to: CGPoint(x: 15.0, y: 100.0))
star.lineJoinStyle = .round
star.lineWidth = 3
UIColor.blue.setStroke()
UIColor.yellow.setFill()
star.stroke()
star.fill()
star
