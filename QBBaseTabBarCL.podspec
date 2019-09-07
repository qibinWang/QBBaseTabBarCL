 
Pod::Spec.new do |s|
  s.name             = 'QBBaseTabBarCL'
  s.version          = '0.1.0'
  s.summary          = 'A short description of QBBaseTabBarCL.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/qibinWang/QBBaseTabBarCL.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qibinWang' => 'wqbajyy@163.com' }
  s.source           = { :git => 'https://github.com/qibinWang/QBBaseTabBarCL.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'QBBaseTabBarCL/Classes/**/*'
  s.resources = ['QBBaseTabBarCL/Assets/*']
  s.dependency 'FDFullscreenPopGesture', '>0.0' # 全局滑动
end
