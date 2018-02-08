Pod::Spec.new do |s|
  s.name             = 'WKChewieRefresh'
  s.version          = '0.1.2'
  s.summary          = '橡皮糖下拉刷新效果,类似QQ下拉刷新'
  s.homepage         = 'https://github.com/VicoWang/WKChewieRefresh'
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { 'Kun Wang' => '354472402@qq.com' }
  s.source           = { :git => 'https://github.com/VicoWang/WKChewieRefresh.git', :tag => s.version }
  s.source_files     = 'WKChewieRefresh/**/*.{h,m}'
  s.requires_arc     = true
  s.platform         = :ios, '8.0'
  # s.ios.deployment_target = '8.0'
end
