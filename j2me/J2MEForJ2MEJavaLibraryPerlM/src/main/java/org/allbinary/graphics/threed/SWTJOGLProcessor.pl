# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

#OpenGLNone
package org::allbinary::graphics::threed::SWTJOGLProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::threed::SWTJOGLProcessor'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::threed::SWTJOGLProcessor::instance;
}


sub init {
    my ($self, $display, $comp) = @_;
}


sub isHolderCreated {
    my ($self) = @_;
        return 1;
}


sub setRenderer {
    my ($self, $renderer) = @_;
}


sub isJOGL {
    my ($self) = @_;
        return 0;
}


sub createSurface {
    my ($self) = @_;
}


sub onSurfaceCreated {
    my ($self) = @_;
}


sub onSurfaceChangedForEvent {
    my ($self, $event) = @_;
}


sub onSurfaceChanged {
    my ($self) = @_;
}


sub onSurfaceChangedWH {
    my ($self, $width, $height) = @_;
}


sub addListener {
    my ($self) = @_;
}


sub addListeners {
    my ($self, $midlet) = @_;
}


sub run {
    my ($self) = @_;
}


sub clear {
    my ($self) = @_;
}


sub setCustom {
    my ($self, $width, $height, $ratio) = @_;
}


sub setRatioProcessor {
    my ($self, $ratioProcessor) = @_;
}


sub isPortraitRatioProcessor {
    my ($self) = @_;
        return 1;
}


sub charWidth {
    my ($self, $font, $ch) = @_;
        die ("RuntimeException");
}


sub charsWidth {
    my ($self, $font, $ch, $offset, $length) = @_;
        die ("RuntimeException");
}


sub stringWidth {
    my ($self, $font, $str) = @_;
        die ("RuntimeException");
}


sub substringWidth {
    my ($self, $font, $str, $offset, $len) = @_;
        die ("RuntimeException");
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::midlet::MIDlet;

1;

