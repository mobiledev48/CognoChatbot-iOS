Pod::Spec.new do |spec|

  spec.name         = "CognoChatbot-iOS"
  spec.version      = "1.0.15"
  spec.summary      = "Simple chatbot SDK"
  spec.description  = "Chatbot SDK/ Framework ready to available with all types of iOS applications"
  spec.homepage     = "https://github.com/cognoai/CognoChatbot-iOS.git"
  spec.license      = "MIT"
  spec.author       = { "Shreyas Patel" => "shreyas@getcogno.ai" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/cognoai/CognoChatbot-iOS.git", :tag => "#{spec.version}" }
  spec.source_files  = "CognoChatbot-iOS/**/*.swift"
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64e'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64e' }

end
