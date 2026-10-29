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

#OpenGLESNullImageJavaLibrary
package org::allbinary::image::opengles::OpenGLESImage;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::lcdui::Image','org::allbinary::image::opengles::OpenGLSurfaceChangedInterface';

our $NULL_OPENGL_IMAGE = 'org::allbinary::image::opengles::OpenGLESImage'->new($javax::microedition::lcdui::NullImage::NULL_IMAGE, $org::allbinary::platform::graphics::PlatformBitmapBaseFactory::NULL_PLATFORM_BITMAP_BASE_FACTORY, $org::allbinary::platform::opengles::PlatformTextureBaseFactory::NULL_PLATFORM_TEXTURE_BASE_FACTORY);
our $texture2dList = 'org::allbinary::util::BasicArrayListD'->new();
our $TYPE = 4;

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{textureFactory} = undef;
    $self->{openGLBitmap} = undef;
    $self->{openGLESImageProperties} = 'org::allbinary::image::opengles::OpenGLESImageProperties'->new();
    $self->{imageProcessor} = 'org::allbinary::image::opengles::OpenGLESImageProcessor'->getInstance();
    $self->{openGLESImageTranslate} = 'org::allbinary::image::opengles::OpenGLESImageTranslate'->getInstance();
}


sub new {
    my ($class, $image, $bitmapFactory, $textureFactory) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{openGLBitmap} = $bitmapFactory->createBitmap($image);
        $self->{textureFactory} = $textureFactory;
    return $self;
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub initTexture {
    my ($self, $gl) = @_;
        return 0;
}


sub drawRegion {
    my ($self, $gl, $viewHeight, $x_src, $y_src, $width, $height, $x, $y, $z) = @_;
}


sub draw {
    my ($self, $gl, $x, $y, $z) = @_;
}


sub getType {
    my ($self) = @_;
        return $org::allbinary::image::opengles::OpenGLESImage::TYPE;
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::platform::graphics::PlatformBitmapBase;
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use org::allbinary::platform::opengles::PlatformTextureBaseFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::image::opengles::OpenGLSurfaceChangedInterface;
use org::allbinary::image::opengles::OpenGLESImageProperties;
use org::allbinary::image::opengles::OpenGLESImageProcessor;
use org::allbinary::image::opengles::OpenGLESImageTranslate;

1;

