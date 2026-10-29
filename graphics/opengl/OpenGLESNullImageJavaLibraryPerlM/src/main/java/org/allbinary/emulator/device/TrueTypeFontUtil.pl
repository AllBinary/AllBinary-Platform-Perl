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

package org::allbinary::emulator::device::TrueTypeFontUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::emulator::device::TrueTypeFontUtilBase';

our $instance = 'org::allbinary::emulator::device::TrueTypeFontUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{fontImage} = $org::allbinary::image::opengles::OpenGLESImage::NULL_OPENGL_IMAGE;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::emulator::device::TrueTypeFontUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(1);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getAsTextureSize {
    my ($self, $textureSize) = @_;
        die ("RuntimeException");
}


sub getCellSize {
    my ($self, $cellSize) = @_;
        die ("RuntimeException");
}


sub getFontBitmap {
    my ($self, $filename, $fontSize, $cellSize, $basicColor) = @_;
        die ("RuntimeException");
}


sub saveFontAtlasAsFile {
    my ($self) = @_;
}


sub getFontBitmapGL {
    my ($self, $gl, $filename, $cellSize, $basicColor) = @_;
        die ("RuntimeException");
}


sub getFontWidths {
    my ($self, $filename, $fontSize) = @_;
        die ("RuntimeException");
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::emulator::device::TrueTypeFontUtilBase;

1;

