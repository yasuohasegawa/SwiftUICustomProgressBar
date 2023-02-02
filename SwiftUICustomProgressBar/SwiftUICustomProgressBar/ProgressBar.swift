//
//  ProgressBar.swift
//  SwiftUICustomProgressBar
//
//  Created by Yasuo Hasegawa on 2023/02/01.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progressAmount:CGFloat
    @Binding var progressPercentage:CGFloat
    @State var width:CGFloat
    @State var height:CGFloat
    @State var scale:CGFloat
    @State var duration:CGFloat
    @State var isRoundShape:Bool
    @State var onUpdate: ((CGFloat) -> Void)?
    @State var onComplete: (() -> Void)?
    
    var body: some View {
        let targetWidth = width*scale
        let halfHeight = isRoundShape ? height*0.5 : 0.0
        Rectangle()
            .foregroundColor(.red)
            .frame(width: targetWidth, height: height)
            .cornerRadius(halfHeight)
            .overlay(
                Rectangle()
                    .foregroundColor(.blue)
                    .position(x:-(targetWidth*0.5)+(progressAmount/1.0*targetWidth), y:height*0.5)
                    .frame(width: targetWidth, height: height)
                    .animationObserver(for: progressAmount) { progress in
                        progressPercentage = progress*100
                        onUpdate?(progress)
                    } onComplete: {
                        onComplete?()
                    }
                    .animation(.easeInOutCubic(duration: duration), value: progressAmount)
                    .cornerRadius(halfHeight)
            )
    }
}

struct ProgressBar_Previews: PreviewProvider {
    @State static var progressAmount:CGFloat = 0.2
    @State static var progressPercentage:CGFloat = 0.0
    
    static var previews: some View {
        
        ProgressBar(progressAmount: $progressAmount, progressPercentage: $progressPercentage, width:300, height: 50, scale: 0.8, duration:1, isRoundShape:false, onUpdate: { progress in
            print("\(progress)")
        }, onComplete: {
            //isDone = progressAmount >= 1.0
            print("complete!")
        })
        
    }
}
