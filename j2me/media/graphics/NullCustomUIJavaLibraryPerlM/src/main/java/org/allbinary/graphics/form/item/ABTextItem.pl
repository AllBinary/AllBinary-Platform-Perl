# Generated Code Do Not Modify

package org::allbinary::graphics::form::item::ABTextItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::CustomCustomItem','org::allbinary::graphics::form::item::ABCustomItemInterface';



sub new {
    my ($class, $label, $layout, $altText, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($label, $backgroundBasicColor, $foregroundBasicColor);
        # super(...) made $self above
    return $self;
}


sub keyPressed {
    my ($self, $keyCode) = @_;
}


sub paintUnselected {
    my ($self, $graphics, $x, $y) = @_;
}


sub getLabelStringComponent {
    my ($self) = @_;
        return $org::allbinary::graphics::form::item::ABStringComponent::NULL_STRING_COMPONENT;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::CustomCustomItem;
use org::allbinary::graphics::form::item::ABCustomItemInterface;
use org::allbinary::graphics::form::item::ABStringComponent;

1;

