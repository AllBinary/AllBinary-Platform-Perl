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

package org::allbinary::graphics::paint::StringLocationPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::LocationPaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{value} = undef;
}


sub new {
    my ($class, $value) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{value} = $value;
    return $self;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $graphics->drawString($self->{value}, $x, $y, 0);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::paint::LocationPaintable;

1;

