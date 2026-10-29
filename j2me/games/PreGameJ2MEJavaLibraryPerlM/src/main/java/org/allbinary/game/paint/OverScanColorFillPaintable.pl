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

package org::allbinary::game::paint::OverScanColorFillPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::paint::ColorFillPaintable';



sub new {
    my ($class, $basicColor) = @_;
    my $self = $class->SUPER::new($basicColor);
        # super(...) made $self above
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->setColor($self->{colorP});
        $graphics->fillRect(-$graphics->getClipX(), -$graphics->getClipY(), $self->{displayInfoSingleton}->getLastWidth() + ($graphics->getClipX() * 2), $self->{displayInfoSingleton}->getLastHeight() + ($graphics->getClipY() * 2));
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::game::paint::ColorFillPaintable;

1;

