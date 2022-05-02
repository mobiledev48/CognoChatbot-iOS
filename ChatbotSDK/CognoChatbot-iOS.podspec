
Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  spec.name         = "CognoChatbot-iOS"
  spec.version      = "1.0.0"
  spec.summary      = "Universal Chatbot"
  spec.description  = "Chatbot SDK used to get the custom bot in an application with ready made functionality. Allow to have bot for communicating to get end to end solution"
  spec.homepage     = "https://github.com/cognoai/CognoChatbot-iOS.git"
  spec.license      = "MIT"
  spec.author             = { "Shreyas Patel" => "shreyas@getcogno.ai" }
  spec.platform     = :ios, "14.0"
  spec.swift_version = "4.1"
  spec.source       = { :git => "https://github.com/cognoai/CognoChatbot-iOS.git", :tag => "1.0.0" }
  spec.source_files  = "ChatbotSDK/**/*.swift"
  spec.frameworks   = 'WebKit'

end
