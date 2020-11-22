//
//  pieChart.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/22.
//

import SwiftUI

struct pieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                        startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
        
    }
}

struct PieChartView: View {
    var percentages: [Double]
    var angles: [Angle]
    
    init(percentages: [Double]) {
        self.percentages = percentages
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in percentages {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage / 100
        }
    }
    
    var body: some View {
        ZStack {
            pieChart(startAngle: angles[0],
                     endAngle: angles[1])
                .fill(Color.blue)
            pieChart(startAngle: angles[1],
                     endAngle: angles[2])
                .fill(Color.green)
            pieChart(startAngle: angles[2],
                     endAngle: angles[3])
                .fill(Color.yellow)
            pieChart(startAngle: angles[3],
                     endAngle: angles[4])
                .fill(Color.orange)
            pieChart(startAngle: angles[4],
                     endAngle: angles[0])
                .fill(Color.red)
        }
    }
}
