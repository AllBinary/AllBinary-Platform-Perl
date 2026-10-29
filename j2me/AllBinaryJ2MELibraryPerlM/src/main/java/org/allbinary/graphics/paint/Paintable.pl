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

package org::allbinary::graphics::paint::Paintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::PaintableInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::paint::PaintableInterface;

1;

