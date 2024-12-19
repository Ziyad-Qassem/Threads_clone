//
//  ThreadCell.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 14/12/2024.
//

import SwiftUI
import FirebaseCore

struct ThreadCell: View {
    let thread : ThreadModel
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12) {
                
                CircularUserImage(user: thread.user)
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text(thread.user?.userName ?? "user Name not found")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(convertFirebaseTimestampToDateString(timestamp: thread.timestamp))
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                            if thread.likes > 0 {
                                Text("\(thread.likes)")
                                    .font(.footnote)
                            }
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }.padding(.vertical , 8)
                        .foregroundStyle(.black)
                    }
                }
            Divider()
        }.padding()
        }
    }
func convertFirebaseTimestampToDateString(timestamp: Timestamp) -> String {
 
    let date = timestamp.dateValue()
    
    // Create a DateFormatter
    let formatter = DateFormatter()
//    formatter.dateStyle = .medium
//    formatter.timeStyle = .short
//    formatter.locale = Locale.current
    formatter.dateFormat = "MMMM dd, HH:mm"
    
    // Convert Date to String
    let dateString = formatter.string(from: date)
    return dateString
}

#Preview {
    ThreadCell(thread: ThreadModel(threadOwerUid: "", caption: "this is a temp caption", timestamp: Timestamp(), likes: 100))
}
