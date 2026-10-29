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

package org::allbinary::graphics::color::BasicColorSetUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::color::BasicColorSetUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::BasicColorSetUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub setBasicColorP {
    my ($self, $graphics, $basicColor) = @_;
        $graphics->setColor(int($basicColor));
}


sub setBasicColorP3 {
    my ($self, $graphics, $basicColor, $value) = @_;
        $graphics->setColor($value);
}

# use javax::microedition::lcdui::Graphics;

1;

