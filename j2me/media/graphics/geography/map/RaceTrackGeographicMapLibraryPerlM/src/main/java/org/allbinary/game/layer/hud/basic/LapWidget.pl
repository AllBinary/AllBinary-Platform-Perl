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

package org::allbinary::game::layer::hud::basic::LapWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud';


sub _init_fields {
    my ($self) = @_;
    $self->{LAP_STR} = "Lap ";
    $self->{OF_STR} = " of ";
    $self->{string} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $location, $direction, $basicColor) = @_;
    my $self = $class->SUPER::new($location, $direction, 2, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{updateMaxHeight} = 15;
        $self->{updateMaxWidth} = 40;
    return $self;
}


sub update {
    my ($self, $lapInfo) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{LAP_STR});
        $stringBuffer->appendint(int($lapInfo->getCurrentLap()));
        $stringBuffer->append($self->{OF_STR});
        $stringBuffer->appendint(int($lapInfo->getTotalLaps()));
        $self->{string} = $stringBuffer->toString();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paintString($graphics, $self->{string});
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::game::layer::hud::LapInfo;
use org::allbinary::graphics::color::BasicColor;

1;

