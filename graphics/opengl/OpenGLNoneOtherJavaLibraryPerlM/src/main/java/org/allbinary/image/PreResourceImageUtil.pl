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

package org::allbinary::image::PreResourceImageUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::image::PreResourceImageUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::PreResourceImageUtil::instance;
}


sub encapsulate {
    my ($self, $image) = @_;
        return $image;
}


sub updateGL {
    my ($self, $gl, $image) = @_;
}


sub update {
    my ($self, $graphics, $image) = @_;
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;

1;

