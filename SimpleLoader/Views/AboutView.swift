//
//  AboutView.swift
//  SimpleLoader
//
//  Created by laobamac on 2025/7/27.
//

import SwiftUI

struct AboutView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.presentationMode) var presentationMode
    @State private var showLanguageSelection = false
    
    let contributors = [
        "contributor1".localized,
        "contributor2".localized,
        "contributor3".localized,
        "contributor4".localized,
        "contributor5".localized,
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "hammer.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading) {
                    Text("SimpleLoader")
                        .font(.title)
                        .bold()
                    Text("System Extension Tool".localized)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.top)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                InfoRow(icon: "number", title: "version".localized, value: "1.0.0")
                InfoRow(icon: "person", title: "author".localized, value: "laobamac")
                InfoRow(icon: "c", title: "copyright".localized, value: "© 2025 " + "rights_reserved".localized)
                InfoRow(icon: "globe", title: "language".localized,
                        value: languageManager.currentLanguage == "auto" ?
                        "auto_detect".localized :
                        languageManager.displayName(for: languageManager.currentLanguage))
                
                Button(action: {
                    showLanguageSelection = true
                }) {
                    Text("change_language".localized)
                        .font(.subheadline)
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $showLanguageSelection) {
                    LanguageSelectionView()
                        .environmentObject(languageManager)
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("contributors".localized)
                    .font(.headline)
                ForEach(contributors, id: \.self) { contributor in
                    Text(contributor)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Divider()
            
            Link(destination: URL(string: "https://github.com/laobamac/SimpleLoader")!) {
                HStack {
                    Image(systemName: "arrow.up.right.square")
                    Text("visit_github".localized)
                }
                .foregroundColor(.accentColor)
            }
            
            Divider()
            
            Button("close".localized) {
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(BorderedButtonStyle())
            .frame(width: 120)
        }
        .padding()
        .frame(width: 325, height: 425)
    }
}

struct InfoRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24)
                .foregroundColor(.secondary)
            Text(title)
                .font(.subheadline)
                .frame(width: 60, alignment: .leading)
            Text(value)
                .font(.subheadline)
                .bold()
            Spacer()
        }
    }
}
