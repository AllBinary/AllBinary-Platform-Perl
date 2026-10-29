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

package org::allbinary::graphics::form::item::SelectableTextItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABTextItem';



sub new {
    my ($class, $label, $layout, $altText, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($label, $layout, $altText, $backgroundBasicColor, $foregroundBasicColor);
        # super(...) made $self above
    return $self;
}


sub isFocusable {
    my ($self) = @_;
        return 1;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $stringComponent = $self->getLabelStringComponent();
        if (defined($stringComponent)) {
            $graphics->setColor(int($stringComponent->getForegroundBasicColor()));
        }
        $graphics->drawString($self->getLabel(), $x + 2, $y, 0);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::ABTextItem;

1;

