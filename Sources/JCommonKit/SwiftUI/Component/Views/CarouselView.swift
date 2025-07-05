//
//  CarouselBannerView.swift
//  JCommonKit
//
//  Created by 이재홍 on 7/5/25.
//

import SwiftUI

public struct CarouselView<T: Identifiable, Content: View>: View {
    
    // MARK: - Properties
    
    @Binding private var currentIndex: Int?
    
    private let itemSpacing: CGFloat
    private let contentMargins: CGFloat
    private let data: [T]
    private let content: (T) -> Content
    
    // MARK: - Initialization
    
    public init(
        currentIndex: Binding<Int?>,
        itemSpacing: CGFloat,
        contentMargins: CGFloat,
        data: [T],
        content: @escaping (T) -> Content
    ) {
        self._currentIndex = currentIndex
        self.itemSpacing = itemSpacing
        self.contentMargins = contentMargins
        self.data = data
        self.content = content
    }
    
    // MARK: - View
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .center, spacing: itemSpacing) {
                    ForEach(Array(data.enumerated()), id: \.element.id) { index, data in
                        content(data)
                            .frame(width: geometry.size.width - itemSpacing - contentMargins * 2.0)
                            .id(index)
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(contentMargins)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $currentIndex, anchor: .center)
        }
    }
}
