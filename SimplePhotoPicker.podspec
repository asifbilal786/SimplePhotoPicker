Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name             = 'SimplePhotoPicker'
  s.version          = '0.1.0'
  s.summary          = 'This is the simple photo picker which uses default iPhone SDK with UIImagePickerController.'
  s.description      = <<-DESC
			 SimplePhotoPicker is a control that optionally takes inputs of Source Type & allow Editing. On the basis of these inputs, this control displays the action sheet if needed and displays the iOS default image editor if selected. It has simple block based implementation. No need to implement delegate methods.
                       DESC

  s.homepage         = 'https://github.com/asifbilal786/SimplePhotoPicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license          = { :type => 'MIT', :file => 'LICENSE' }



  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author           = { 'Asif Bilal' => 'asifbilal786@gmail.com' }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "8.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/SimplePhotoPicker.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/asifbilal786'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SimplePhotoPicker/*.swift’
  
end
