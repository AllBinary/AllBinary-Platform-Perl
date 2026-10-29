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

package org::allbinary::game::ag::layer::hud::basic::score::ScoreHudWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::NumberStringHud';



# throws Exception
sub getInstance {
    my ($class, $maxscore, $location, $direction) = @_;
        return 'org::allbinary::game::ag::layer::hud::basic::score::ScoreHudWidget'->new($maxscore, $location, $direction, 2, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREY});
}


sub new {
    my ($class, $maxscore, $location, $direction, $bufferZone, $basicColor) = @_;
    my $self = $class->SUPER::new("Pts ", $maxscore, $location, $direction, $bufferZone, $basicColor);
        # super(...) made $self above
        $self->{updateMaxHeight} = 14;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{updateMaxWidth} = $font->getSize() * 5;
        $self->SUPER::updateMeasurement($graphics);
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::ag::layer::hud::basic::NumberStringHud;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;

1;

