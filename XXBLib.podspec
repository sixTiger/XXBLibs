Pod::Spec.new do |s|
  s.requires_arc = true
  s.name         = "XXBLib"
  s.version      = "1.0.0"
  s.summary      = "test"
  s.homepage     = "https://github.com/sixTiger/XXBLibs"
  s.license      = "MIT"
  s.authors      = { '杨小兵' => 'six_tiger@163.com' }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/sixTiger/XXBLibs.git", :tag => s.version }
  s.source_files = "XXBLib/**/*.{h,m}"
  s.requires_arc  = true
end
