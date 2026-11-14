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

package org::allbinary::animation::image::ModifierBaseProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::animation::image::ModifierBaseProcessor'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::image::ModifierBaseProcessor::instance;
}


sub updateColor {
    my ($self, $imageModifierUtil, $originalImage, $imageToShow, $index, $basicColor) = @_;
}


sub updateAlpha {
    my ($self, $imageModifierUtil, $originalImage, $imageToShow, $index, $alpha) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Image ();
use org::allbinary::graphics::color::BasicColor ();
use org::allbinary::media::image::ImageModifierUtil ();

1;

