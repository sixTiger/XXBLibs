Pod::Spec.new do |s|
  s.requires_arc = true
  s.name         = 'XXBLibs'
  s.version      = '0.0.6'
  s.summary      = "20150103"
  s.homepage     = "https://github.com/sixTiger/XXBLibs"
  s.license      = "MIT"
  s.authors      = { '杨小兵' => 'lhxiaobing@qq.com' }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/sixTiger/XXBLibs.git", :tag => s.version }
  s.public_header_files = 'XXBLib/XXBLibs.h'
  s.source_files = 'XXBLib/XXBLibs.h'
  s.requires_arc  = true
  s.default_subspec = 'Class'

  s.subspec 'Others' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.source_files = 'XXBLib/Others/*.{h,m}'
    
    ss.subspec 'Reachability' do |sss|
      sss.public_header_files = 'XXBLib/Others/Reachability/Reachability.h'
      sss.source_files = 'XXBLib/Others/Reachability/Reachability.{h,m}'
      sss.public_header_files = 'XXBLib/Others/Reachability/Reachability.h'
    end
  end

  s.subspec 'Class' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.dependency 'XXBLibs/Others'
    ss.source_files = 'XXBLib/Class/*.{h,m}'
    ss.public_header_files = 'XXBLib/Class/*.h'
  end

  s.subspec 'Category' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.source_files = 'XXBLib/Category/*.{h,m}'
    ss.public_header_files = 'XXBLib/Category/*.h'
  end
  
end
