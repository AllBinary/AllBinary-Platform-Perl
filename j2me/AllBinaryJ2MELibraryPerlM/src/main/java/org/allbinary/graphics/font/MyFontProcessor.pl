# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::graphics::font::MyFontProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::font::MyFontProcessor'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub defaultCharWidth {
    my ($class, $font) = @_;
        return $font->charWidth("C");
}


sub defaultStringWidth {
    my ($class, $font, $size) = @_;
        return 'org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font) * $size;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::font::MyFontProcessor::instance;
}


sub process {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;

1;

