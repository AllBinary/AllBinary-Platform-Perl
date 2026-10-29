# Generated Code Do Not Modify

package org::allbinary::graphics::form::item::ABCustomItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_CUSTOM_ITEM = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::graphics::form::item::ABCustomItem::NULL_CUSTOM_ITEM == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::graphics::form::item::ABCustomItem::NULL_CUSTOM_ITEM = 'org::allbinary::graphics::form::item::ABCustomItem'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
        }
        return $org::allbinary::graphics::form::item::ABCustomItem::NULL_CUSTOM_ITEM;
}


sub new {
    my ($class, $label, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub setOwner {
    my ($self, $owner) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
}


sub paintUnselected {
    my ($self, $graphics, $x, $y) = @_;
}


sub isFocusable {
    my ($self) = @_;
        return 0;
}


sub getLabel {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub setLabel {
    my ($self, $label) = @_;
}


sub getHeight {
    my ($self) = @_;
        return 0;
}


sub setHeight {
    my ($self, $height) = @_;
}


sub getValue {
    my ($self) = @_;
        return 0.0;
}


sub setValue {
    my ($self, $value) = @_;
}


sub getMinimumWidth {
    my ($self) = @_;
        return 0;
}


sub getMinimumHeight {
    my ($self) = @_;
        return 0;
}


sub preMeasurement {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Screen;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;

1;

