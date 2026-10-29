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

package org::allbinary::graphics::color::ColorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();

our $instance = 'org::allbinary::graphics::color::ColorUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::ColorUtil::instance;
}


sub isGreyishOrWhiteLike {
    my ($self, $color) = @_;
        if (abs($color->getRed() - $color->getGreen()) > 20 || abs($color->getRed() - $color->getBlue()) > 20 || abs($color->getGreen() - $color->getBlue()) > 20) {
            return 0;
        }
        return 1;
}


sub isDark {
    my ($self, $color) = @_;
        if ($color->getRed() < 0x77 && $color->getRed() < 0x77 && $color->getRed() < 0x77) {
            return 1;
        }
        return 0;
}

# use java::awt;

1;

