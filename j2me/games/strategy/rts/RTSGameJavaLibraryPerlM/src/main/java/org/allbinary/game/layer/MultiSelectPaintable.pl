# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::MultiSelectPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::SelectionHudPaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{rootNameList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{totalCharArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_CHAR_ARRAY};
    $self->{rootNamesString} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{TOTAL} = "Total Selected: ";
    $self->{backgroundColor} = int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREY});
    $self->{totalWidth} = 0;
    $self->{textLine2Y} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        $self->SUPER::updateMeasurement($graphics);
        my $font = $graphics->getFont();
        $self->{totalWidth} = $font->stringWidth($self->{TOTAL});
        $self->{textLine2Y} = ($self->{y} + $font->getHeight());
}


sub update {
    my ($self, $list) = @_;
        $self->clear();
        my $size = $list->size();
        $self->{totalCharArray} = $self->getPrimitiveLongUtil()->getCharArray($size);
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            my $rtsLayer = $list->get($index);
            if (!$self->{rootNameList}->contains($rtsLayer->getRootName())) {
                $self->{rootNameList}->add($rtsLayer->getRootName());
            }
        }
        my $COMMA_SEP = 'org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP};
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = $self->{rootNameList}->size() - 1; $index >= 0; $index--) {
            my $rootName = $self->{rootNameList}->get($index);
            $stringBuffer->append($rootName);
            if ($index != 0) {
                $stringBuffer->append($COMMA_SEP);
            }
        }
        $self->{rootNamesString} = $stringBuffer->toString();
}


sub clear {
    my ($self) = @_;
        $self->{rootNameList}->clear();
}


sub paint {
    my ($self, $graphics) = @_;
        $graphics->setColor($self->{backgroundColor});
        $graphics->drawRect($self->getX(), $self->{y}, $self->getWidth(), $self->getHeight());
        $graphics->setColor($self->getColor());
        $graphics->drawString($self->{TOTAL}, $self->{textX}, $self->{y}, 0);
        $graphics->drawChars($self->{totalCharArray}, 0, $self->getPrimitiveLongUtil()->getCurrentTotalDigits(), $self->{textX} + $self->{totalWidth}, $self->{y}, 0);
        $graphics->drawString($self->{rootNamesString}, $self->{textX}, $self->{textLine2Y}, 0);
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::game::layer::SelectionHudPaintable;

1;

