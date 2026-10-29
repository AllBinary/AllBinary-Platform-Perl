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

#super.paint(graphics, positionString, currentPostString, offset2, offset);
package org::allbinary::game::layer::hud::basic::PositionWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud';


sub _init_fields {
    my ($self) = @_;
    $self->{position} = 0;
    $self->{positionString} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $position, $location, $direction, $basicColor) = @_;
    my $self = $class->SUPER::new($location, $direction, 2, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{updateMaxHeight} = 10;
        $self->{updateMaxWidth} = 40;
    return $self;
}


sub get {
    my ($self) = @_;
        return $self->{position};
}


sub set {
    my ($self, $position) = @_;
        $self->{position} = $position;
        $self->{positionString} = 'org::allbinary::game::layer::hud::basic::PositionWidget'->toString($self->get());
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paintString($graphics, $self->{positionString});
}


sub toString {
    my ($class, $position) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append(("" . ($position)));
        if ($position == 1) {
            $stringBuffer->append("st");
        } elsif ($position == 2) {
            $stringBuffer->append("nd");
        } elsif ($position == 3) {
            $stringBuffer->append("rd");
        } else {
            $stringBuffer->append("th");
        }
        return $stringBuffer->toString();
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::graphics::color::BasicColor;

1;

