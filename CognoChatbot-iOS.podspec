Pod::Spec.new do |spec|

  spec.name         = "CognoChatbot-iOS"
  spec.version      = "1.0.24"
  spec.summary      = "Simple chatbot SDK"
  spec.description  = "Chatbot SDK/ Framework ready to available with all types of iOS applications"
  spec.homepage     = "https://github.com/cognoai/CognoChatbot-iOS.git"
  spec.license      = "MIT"
  spec.author       = { "Shreyas Patel" => "shreyas@getcogno.ai" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/cognoai/CognoChatbot-iOS.git", :tag => spec.version.to_s }
  spec.source_files  = "CognoChatbot-iOS/**/*.swift"

end
