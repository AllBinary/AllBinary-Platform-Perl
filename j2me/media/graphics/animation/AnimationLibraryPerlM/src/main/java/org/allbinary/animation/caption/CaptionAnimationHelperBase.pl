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

package org::allbinary::animation::caption::CaptionAnimationHelperBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::Animation';

our $INSTANCE = 'org::allbinary::animation::caption::CaptionAnimationHelperBase'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub isShowing {
    my ($self) = @_;
        return 0;
}


sub tick {
    my ($self) = @_;
}


sub update {
    my ($self, $message, $basicColor) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::color::BasicColor;

1;

