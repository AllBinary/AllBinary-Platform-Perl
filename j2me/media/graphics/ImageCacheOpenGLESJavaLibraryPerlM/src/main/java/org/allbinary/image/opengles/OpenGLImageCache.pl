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

#ImageCacheOpenGLESJavaLibrary
package org::allbinary::image::opengles::OpenGLImageCache;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::ImageCache';


sub _init_fields {
    my ($self) = @_;
    $self->{imageCache} = 'org::allbinary::image::ImageCacheFactory'->getInstance();
    $self->{preResourceImageUtil} = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
    $self->{gl} = $org::allbinary::device::NullGL10::NULL_GL10;
    $self->{lock} = 'org::allbinary::thread::SynchObject'->new();
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{renderer} = 'org::allbinary::graphics::opengles::renderer::AllBinaryRendererBase3'->new();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $renderer) = @_;
        $self->{renderer} = $renderer;
}


# throws Exception
sub update {
    my ($self, $gl) = @_;
        $self->{gl} = $gl;
        { # synchronized ($self->{lock})
            for (my $index = $self->{list}->size() - 1; $index >= 0; $index--) {
                my $openGLESImage = ($self->{list}->{objectArray}->[$index]);
                if ($openGLESImage != $org::allbinary::image::opengles::OpenGLESImage::NULL_OPENGL_IMAGE) {
                    $openGLESImage->set($gl);
                }
            }
        }
}


# throws Exception
sub createImage {
    my ($self, $caller, $width, $height) = @_;
        my $textureSize = $width;
        if ($height > $width) {
            $textureSize = $height;
        }
        while (($textureSize % 4) != 0) {
            $textureSize++;
        }
        $width = $textureSize;
        $height = $textureSize;
        my $image2 = $self->{imageCache}->get($caller, $width, $height);
        my $image = $self->{preResourceImageUtil}->encapsulate($image2);
        { # synchronized ($self->{lock})
            if ($image != $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
                $self->{list}->add($image);
            }
        }
        return $image;
}


# throws Exception
sub createImageFromInputStream {
    my ($self, $key, $inputStream) = @_;
        my $cachedImage = $self->{imageCache}->getWithKey($key);
        my $image = $self->{preResourceImageUtil}->encapsulate($cachedImage);
        { # synchronized ($self->{lock})
            if ($image != $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
                $self->{list}->add($image);
            }
        }
        return $image;
}


sub getGlP {
    my ($self) = @_;
        return $self->{gl};
}


sub init {
    my ($self, $image) = @_;
        try {
            { # synchronized ($self->{lock})
                if ($self->{list}->contains($image)) {
                    die ("RuntimeException");
                }
                $self->{list}->add($image);
            }
            $self->{renderer}->add($image);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
        }
}

# use java::io::InputStream;
# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::device::NullGL10;
use org::allbinary::graphics::opengles::renderer::AllBinaryRendererBase3;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::image::ImageCache;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::image::PreResourceImageUtil;
use org::allbinary::thread::SynchObject;
use org::allbinary::image::opengles::OpenGLESImage;

1;

