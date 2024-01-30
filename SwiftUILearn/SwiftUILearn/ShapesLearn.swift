//
//  ShapesLearn.swift
//  SwiftUILearn
//
//  Created by yangtz on 2024/1/29.
//

import SwiftUI

struct ShapesLearn: View {
    var body: some View {
        // 圆
        // Circle()
            // 填充颜色
            // .fill(Color.green)
            // .foregroundColor(.pink)

            // 描边
            // .stroke()
            // 设置边的颜色
            // .stroke(Color.red)
            // 线条的粗细
            // .stroke(Color.blue, lineWidth: 10.0)

            // 线条的格式
            //.stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [30]))

            // 顺时针裁剪图形
            // .trim(from: 0.2, to: 1.0)
            // .stroke(Color.purple, lineWidth: 20)

        // 椭圆
        // Ellipse()
            // 设置其框架大小 也可以跟圆的属性进行组合
            // .frame(width: 200, height: 100)

        // 胶囊
        // Capsule(style: .circular)
        // 设置其框架大小 也可以跟圆的属性进行组合
            // .frame(width: 200, height: 100)

        // 矩形
        // Rectangle()
            // .frame(width: 100, height: 100)

        // 圆角矩形
         RoundedRectangle(cornerRadius: 25.0)
             .frame(width: 200, height: 100)
    }
}

#Preview {
    ShapesLearn()
}
