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

package org::allbinary::game::paint::ColorFillPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::paint::ColorFillBasePaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
}


sub new {
    my ($class, $basicColor) = @_;
    my $self = $class->SUPER::new($basicColor);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->setColor($self->{colorP});
        $graphics->fillRect(0, 0, $self->{displayInfoSingleton}->getLastWidth(), $self->{displayInfoSingleton}->getLastHeight());
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::game::paint::ColorFillBasePaintable;

1;

