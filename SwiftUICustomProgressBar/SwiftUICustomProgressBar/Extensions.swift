//
//  Extensions.swift
//  SwiftUICustomProgressBar
//
//  Created by Yasuo Hasegawa on 2023/02/02.
//

import SwiftUI

extension View {
    func animationObserver<Value: VectorArithmetic>(for value: Value,
                                                    onChange: ((Value) -> Void)? = nil,
                                                    onComplete: (() -> Void)? = nil) -> some View {
      self.modifier(AnimationObserverModifier(for: value,
                                                 onChange: onChange,
                                                 onComplete: onComplete))
    }
}
