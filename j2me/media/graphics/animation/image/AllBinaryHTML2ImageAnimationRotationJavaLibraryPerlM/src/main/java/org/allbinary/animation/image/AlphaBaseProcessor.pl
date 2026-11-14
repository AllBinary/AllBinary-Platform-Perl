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

package org::allbinary::animation::image::AlphaBaseProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::animation::image::AlphaBaseProcessor'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::image::AlphaBaseProcessor::instance;
}


sub setAlpha {
    my ($self, $imageModifierUtil, $originalImage, $imageToShow, $alpha) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Image ();
use org::allbinary::media::image::ImageModifierUtil ();

1;

