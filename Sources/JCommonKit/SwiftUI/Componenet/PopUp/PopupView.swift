//
//  PopUpView.swift
//  DailyInsights
//
//  Created by 이재홍 on 2024/06/17.
//

import SwiftUI

public struct PopupView: View {
    
    // MARK: - Properties
    
    private let title: String?
    private let text: String?
    private let highlightedText: String?
    private let cancelButtonTitle: String?
    private let confirmButtonTitle: String
    private let closeAction: (Bool) -> Void
    
    // MARK: - Initialization
    
    public init(
        title: String?,
        text: String?,
        highlightedText: String? = nil,
        cancelButtonTitle: String? = CommonUtils.isLocaleKo() ? "취소" : "Cancel",
        confirmButtonTitle: String,
        closeAction: @escaping (Bool) -> Void
    ) {
        self.title = title
        self.text = text
        self.highlightedText = highlightedText
        self.cancelButtonTitle = cancelButtonTitle
        self.confirmButtonTitle = confirmButtonTitle
        self.closeAction = closeAction
    }
    
    // MARK: - View
    
    public var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 17) {
                if let title {
                    Text(title.forceCharWrapping)
                        .customFont(color: Color.gray20, size: 18, weight: .bold)
                        .debugBackground()
                }
                
                if let highlightedText, let text {
                    Text(CommonUtils.formattedText(for: text, highlight: highlightedText, color: .primary40))
                        .customFont(color: Color.gray20, size: 16, weight: .medium, lineHeight: 23)
                        .debugBackground()
                } else if let text {
                    Text(text.forceCharWrapping)
                        .customFont(color: Color.gray20, size: 16, weight: .medium, lineHeight: 23)
                        .debugBackground()
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            
            HStack(spacing: 8) {
                Spacer()
                
                if let cancelButtonTitle {
                    Button(action: {
                        closeAction(false)
                    }, label: {
                        Text(cancelButtonTitle)
                            .customFont(color: Color.gray40, size: 16, weight: .bold)
                    })
                    .buttonStyle(PopUpButtonStyle())
                }
                
                Button(action: {
                    closeAction(true)
                }, label: {
                    Text(confirmButtonTitle)
                        .customFont(color: Color.secondary45, size: 16, weight: .bold)
                })
                .buttonStyle(PopUpButtonStyle())
            }
            .padding(.top, 10)
            .padding(.trailing, 10)
            .padding(.bottom, 14)
        }
        .background(Color.gray100)
        .cornerRadius(16, corners: [.allCorners])
        .padding(.horizontal, 40)
        .shadow(color: Color.black.opacity(0.1), radius: 13, x: 0, y: 4)
    }
}

#Preview {
    Group {
        PopupView(
            title: "타이틀",
            text: "텍스트입니다.",
            confirmButtonTitle: "동의하기",
            closeAction: { _ in
            }
        )
        
        PopupView(
            title: "타이틀이 들어갑니다",
            text: "내용이 들어가게 됩니다. 조금 길게 들어 갈수도 있습니다. 좀더 써보겠습니다. 세줄이 넘어갈때 까지 ",
            confirmButtonTitle: "지우기",
            closeAction: { _ in
            }
        )
    }
    //.withPreviewEnvironment()
}
