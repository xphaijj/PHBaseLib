
Pod::Spec.new do |s|
  s.name             = 'PHBaseLib'
  s.version          = '0.1.1'
  s.summary          = '自定义基础类库'

  s.description      = <<-DESC
                        平常使用的宏定义、基础框架等集合
                       DESC

  s.homepage         = 'https://github.com/xphaijj/PHBaseLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'eMail' => '2112787533@qq.com' }
  s.source           = { :git => 'https://github.com/xphaijj/PHBaseLib.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files =  'PHBaseLib/Classes/**/*.{h,m}'
  s.public_header_files = 'PHBaseLib/Classes/**/*.h'

  s.dependency 'AFNetworking'
  s.dependency 'RMUniversalAlert'
  s.dependency 'ReactiveObjC'
  s.dependency 'GDPerformanceView'
  s.dependency 'MJExtension'
  s.dependency 'FMDB'
  s.dependency 'SVProgressHUD'

end
