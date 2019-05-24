Pod::Spec.new do |s|

  s.name         = "PRCommonMoudleForSwift"
  s.version      = "0.1.0"
  s.summary  	 = 'swift通用库'
  s.homepage     = "https://github.com/pengruiCode/PRCommonMoudleForSwift.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = {'pengrui' => 'pengruiCode@163.com'}
  s.source       = { :git => 'https://github.com/pengruiCode/PRCommonMoudleForSwift.git', :tag => s.version}
  s.platform 	 = :ios, "8.0"
  s.source_files = "PRCommonMoudleForSwift/**/*.{swift}"
  s.requires_arc = true
  s.description  = <<-DESC
			整理了部分通用swift快捷方法
                   DESC
  s.dependency "UIColor_Hex_Swift"
  s.dependency "SnapKit"
  s.dependency "MBProgressHUD"
  s.dependency "Toast"

 end