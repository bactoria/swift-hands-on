//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by kakao on 2023/09/08.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo // 메모가 업데이트 될 때 뷰가 업데이트 된다. 따라서 최신데이터 표시 가능
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
    }
}
