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

#OpenGLESSWTJOGLImageJavaLibrary
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
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{textureFactory} = undef;
    $self->{openGLBitmap} = undef;
    $self->{imageProcessor} = 'org::allbinary::image::opengles::OpenGLESImageProcessor'->getInstance();
    $self->{openGLESImageTranslate} = 'org::allbinary::image::opengles::OpenGLESImageTranslate'->getInstance();
    $self->{openGLESImageProperties} = 'org::allbinary::image::opengles::OpenGLESImageProperties'->new();
}


sub new {
    my ($class, $image, $bitmapFactory, $textureFactory) = @_;
    my $self = $class->SUPER::new($image->getName(), $javax::microedition::lcdui::PostLoadImageProcessor::NULL_POST_LOAD_IMAGE_PROCESSOR);
    $self->_init_fields();
        # super(...) made $self above
        $self->{openGLBitmap} = $bitmapFactory->createBitmap($image);
        $self->{textureFactory} = $textureFactory;
        'org::allbinary::image::opengles::OpenGLImageCacheFactory'->getInstance()->init($self);
        $self->{platformImage} = 'javax::microedition::lcdui::OpenGLESPostLoadPlatformImage'->getInstance();
    return $self;
}


sub getHeight {
    my ($self) = @_;
        return int(($self->{openGLBitmap}->getHeight() * $self->{openGLESImageProperties}->{scaleY2}));
}


sub getWidth {
    my ($self) = @_;
        return int(($self->{openGLBitmap}->getWidth() * $self->{openGLESImageProperties}->{scaleX2}));
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub initTexture {
    my ($self, $gl) = @_;
        if (!$org::allbinary::image::opengles::OpenGLESImage::texture2dList->contains($self)) {
            $org::allbinary::image::opengles::OpenGLESImage::texture2dList->add($self);
            my $textures = [(0) x (1)];
            $gl->glEnable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
            if ($self->{openGLESImageProperties}->{textureID} != -1) {
                $textures->[0] = $self->{openGLESImageProperties}->{textureID};
                $gl->glDeleteTextures(1, $textures, 0);
            }
            $gl->glGenTextures(1, $textures, 0);
            $self->{openGLESImageProperties}->{textureID} = $textures->[0];
            $gl->glBindTexture($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $self->{openGLESImageProperties}->{textureID});
            $gl->glTexParameterf($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $javax::microedition::khronos::opengles::GL10::GL_TEXTURE_MIN_FILTER, $javax::microedition::khronos::opengles::GL10::GL_NEAREST);
            $gl->glTexParameterf($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $javax::microedition::khronos::opengles::GL10::GL_TEXTURE_WRAP_S, $javax::microedition::khronos::opengles::GL10::GL_CLAMP_TO_EDGE);
            $gl->glTexParameterf($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $javax::microedition::khronos::opengles::GL10::GL_TEXTURE_WRAP_T, $javax::microedition::khronos::opengles::GL10::GL_CLAMP_TO_EDGE);
            return 1;
        }
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


sub toString {
    my ($self) = @_;
        my $graphicsStrings = 'org::allbinary::graphics::GraphicsStrings'->getInstance();
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->getName())->append($self->SUPER::toString())->append($graphicsStrings->{OPACITY})->appendfloat($self->{openGLESImageProperties}->{alphaf})->toString();
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
# use javax::microedition::lcdui::OpenGLESPostLoadPlatformImage;
# use javax::microedition::lcdui::PostLoadImageProcessor;
use org::allbinary::graphics::GraphicsStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::platform::graphics::PlatformBitmapBase;
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use org::allbinary::platform::opengles::PlatformTextureBaseFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::image::opengles::OpenGLSurfaceChangedInterface;
use org::allbinary::image::opengles::OpenGLESImageProcessor;
use org::allbinary::image::opengles::OpenGLESImageTranslate;
use org::allbinary::image::opengles::OpenGLESImageProperties;
use org::allbinary::image::opengles::OpenGLImageCacheFactory;

1;

