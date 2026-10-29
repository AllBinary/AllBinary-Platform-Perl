#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::image::opengles::OpenGLESGL11VBOImageFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::opengles::OpenGLImageFactory';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($self, $image, $bitmapFactory, $textureFactory) = @_;
        return 'org::allbinary::image::opengles::OpenGLESGL10Image'->new($image, $bitmapFactory, $textureFactory);
}

# use javax::microedition::lcdui::Image;
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use org::allbinary::platform::opengles::PlatformTextureBaseFactory;
use org::allbinary::image::opengles::OpenGLImageFactory;
use org::allbinary::image::opengles::OpenGLESGL10Image;

1;

