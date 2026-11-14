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

package org::allbinary::platform::graphics::PlatformBitmapBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_PLATFORM_BITMAP_BASE, 'java::lang::LazyStatic', sub { 'org::allbinary::platform::graphics::PlatformBitmapBase'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{alpha} = 255;
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{NULL_COLOR};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getWidth {
    my ($self) = @_;
        return 0;
}


sub getHeight {
    my ($self) = @_;
        return 0;
}


sub getImage {
    my ($self) = @_;
        return $javax::microedition::lcdui::NullImage::NULL_IMAGE;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Image ();
use javax::microedition::lcdui::NullImage ();
use org::allbinary::graphics::color::BasicColor ();
use org::allbinary::graphics::color::BasicColorFactory ();

1;

