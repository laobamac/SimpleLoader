//
//  LanguageManager.swift
//  SimpleLoader
//
//  Created by laobamac on 2025/7/28.
//

import Foundation

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()
    
    private let userDefaults = UserDefaults.standard
    private let kLanguageKey = "app_selected_language"
    
    @Published var currentLanguage: String {
        didSet {
            userDefaults.set(currentLanguage, forKey: kLanguageKey)
        }
    }
    
    private init() {
        // 获取保存的语言或系统语言
        if let savedLanguage = userDefaults.string(forKey: kLanguageKey) {
            currentLanguage = savedLanguage
        } else {
            currentLanguage = Locale.preferredLanguages.first?.components(separatedBy: "-").first ?? "en"
        }
    }
    
    func setLanguage(_ language: String) {
        currentLanguage = language
    }
    
    func availableLanguages() -> [String] {
        return ["en", "zh-Hans", "zh-Hant", "es", "it"] // 支持的语言列表
    }
    
    func displayName(for language: String) -> String {
        switch language {
        case "en": return "English"
        case "zh-Hans": return "简体中文"
        case "zh-Hant": return "繁体中文"
        case "es": return "Español"
        case "it": return "Italian"
        default: return language
        }
    }
}
