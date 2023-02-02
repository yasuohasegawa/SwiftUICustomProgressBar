//
//  ContentView.swift
//  SwiftUICustomProgressBar
//
//  Created by Yasuo Hasegawa on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    @State var progressAmount:CGFloat = 0.0
    @State var progressPercentage:CGFloat = 0.0
    @State var isDone:Bool = false
    @State var width:CGFloat = 0
    @State var height:CGFloat = 10.0
    @State var scale:CGFloat = 0.6
    @State var duration:CGFloat = 1.0
    @State var hAlignment:HorizontalAlignment = .center
    @State var vAlignment:Alignment = .center
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            VStack(alignment: hAlignment) {
                Text("progress: \(String(format: "%.2f", progressPercentage))%")
                
                Button("Test Progress") {
                    progressAmount += 0.2
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                        progressAmount = 0.5
//                    }
                    if progressAmount >= 1.0 {
                        progressAmount = 1.0
                    }
                }
                
                Button("Reset") {
                    progressAmount = 0
                    isDone = false
                }
                
                ProgressBar(progressAmount: $progressAmount, progressPercentage: $progressPercentage, width:w, height: height, scale: scale, duration:duration, isRoundShape:true, onUpdate: { progress in
                    print("\(progress)")
                }, onComplete: {
                    isDone = progressAmount >= 1.0
                    print("complete!")
                })
                
                if isDone {
                    Text("COMPLETE")
                } else {
                    Text("LOADING")
                }
            }.frame(width: geo.size.width, height: geo.size.height, alignment: vAlignment)
            //.padding(.bottom, 50).padding(.leading, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
