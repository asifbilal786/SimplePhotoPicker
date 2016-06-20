Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name             = 'SimplePhotoPicker'
  s.version          = '0.1.4'
  s.summary          = 'This is the simple photo picker which uses default iPhone SDK with UIImagePickerController.'
  s.description      = <<-DESC
			 SimplePhotoPicker is a control that optionally takes inputs of Source Type & allow Editing. On the basis of these inputs, this control displays the action sheet if needed and displays the iOS default image editor if selected. It has simple block based implementation. No need to implement delegate methods.
                       DESC

  s.homepage         = 'https://github.com/asifbilal786/SimplePhotoPicker'
  s.screenshots     = 'https://raw.githubusercontent.com/asifbilal786/SimplePhotoPicker/screenshots/Screenshot_1.png'
  s.frameworks       = 'UIKit'
  s.requires_arc     = true


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license          = { :type => 'MIT', :file => 'LICENSE' }



  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author           = { 'Asif Bilal' => 'asifbilal786@gmail.com' }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "8.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source           = { :git => 'https://github.com/asifbilal786/SimplePhotoPicker.git', :tag => s.version }
  s.social_media_url = 'https://twitter.com/asifbilal786'

  s.default_subspec  = 'Core'

  s.subspec 'Core' do |sp|
  sp.source_files = 'Pod', 'SimplePhotoPicker/Core/*.swift'
  end


end