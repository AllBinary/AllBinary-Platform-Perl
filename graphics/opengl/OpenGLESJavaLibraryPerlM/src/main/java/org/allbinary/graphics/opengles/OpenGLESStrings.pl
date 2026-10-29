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

package org::allbinary::graphics::opengles::OpenGLESStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        die ("RuntimeException");
}


sub initFont {
    my ($self, $gl, $width, $height) = @_;
        die ("RuntimeException");
}


# throws Exception
sub update {
    my ($self, $gl, $width, $height) = @_;
        die ("RuntimeException");
}


sub drawChar {
    my ($self, $gl, $graphics, $character, $x, $y, $anchor) = @_;
        die ("RuntimeException");
}


sub drawChars {
    my ($self, $gl, $graphics, $data, $offset, $length, $x, $y, $anchor) = @_;
        die ("RuntimeException");
}


sub drawString {
    my ($self, $gl, $graphics, $string, $x, $y, $anchor) = @_;
        die ("RuntimeException");
}


sub drawSubstring {
    my ($self, $gl, $graphics, $string, $offset, $len, $x, $y, $anchor) = @_;
        die ("RuntimeException");
}


sub charWidth {
    my ($self, $ch) = @_;
        die ("RuntimeException");
}


sub charsWidth {
    my ($self, $ch, $offset, $length) = @_;
        die ("RuntimeException");
}


sub stringWidth {
    my ($self, $string) = @_;
        die ("RuntimeException");
}


# Java overloaded method: Perl keeps the last definition
sub stringWidth {
    my ($self, $string, $offset, $len) = @_;
        die ("RuntimeException");
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;

1;

