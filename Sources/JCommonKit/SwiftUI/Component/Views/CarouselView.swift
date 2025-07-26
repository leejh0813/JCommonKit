//
//  CarouselBannerView.swift
//  JCommonKit
//
//  Created by 이재홍 on 7/5/25.
//

import SwiftUI

public struct CarouselView<T: Identifiable, Content: View>: View {
    
    // MARK: - Properties
    
    @State private var hasScrolledInitially = false
    @Binding private var currentIndex: Int?
    
    private let itemSpacing: CGFloat
    private let contentMargins: CGFloat
    private let shouldScrollToItem: Bool
    private let data: [T]
    private let content: (T) -> Content
    
    // MARK: - Initialization
    
    public init(
        currentIndex: Binding<Int?>,
        itemSpacing: CGFloat,
        contentMargins: CGFloat,
        shouldScrollToItem: Bool = false,
        data: [T],
        content: @escaping (T) -> Content
    ) {
        self._currentIndex = currentIndex
        self.itemSpacing = itemSpacing
        self.contentMargins = contentMargins
        self.shouldScrollToItem = shouldScrollToItem
        self.data = data
        self.content = content
    }
    
    // MARK: - View
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollProxy in
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
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            scrollProxy.scrollTo(currentIndex, anchor: .center)
                        }
                    }
                }
                .onAppear {
                    guard shouldScrollToItem else {
                        return
                    }
                    
                    // 처음 진입 시 한 번만 강제로 scrollTo
                    if !hasScrolledInitially {
                        hasScrolledInitially = true
                        DispatchQueue.main.async {
                            scrollProxy.scrollTo(currentIndex, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}
