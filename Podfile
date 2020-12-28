# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def defaultPods
  pod 'SnapKit', '4.2.0'
  pod 'ObjectMapper', '3.3.0'
  pod 'Alamofire', '~> 4.5'
  pod 'Kingfisher', '~> 4.0'
  pod 'FontAwesome.swift'
end

def testPods
  pod 'Quick'
  pod 'Nimble'
end

target 'GithubBank' do
  #use_frameworks!

  defaultPods
  
  target 'GithubBankTests' do
    inherit! :search_paths
    testPods
  end

  target 'GithubBankUITests' do
    defaultPods
    testPods
  end

end
