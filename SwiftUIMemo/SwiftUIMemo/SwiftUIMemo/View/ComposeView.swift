//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by kakao on 2023/09/08.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil // 메모가 존재하면 수정. 없으면 쓰기 이다.

    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .onAppear { // 메모 수정 시 기존 내용 보여주기
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo == nil ? "새 메모" : "메모 편집")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            // 편집
                            store.update(memo: memo, content: content)
                        } else {
                            // 쓰기
                            store.insert(memo: content)
                        }
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
