# Generated Code Do Not Modify

package org::allbinary::graphics::form::item::ABTextFieldItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABTextItem';


sub _init_fields {
    my ($self) = @_;
    $self->{font} = undef;
}


sub new {
    my ($class, $canvas, $visitor, $label, $value, $maxSize, $layout, $altText, $font, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($label, $layout, $altText, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{font} = $font;
    return $self;
}


sub getLabel {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub setLabel {
    my ($self, $label) = @_;
}


sub getString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub setString {
    my ($self, $string) = @_;
}


sub setFocus {
    my ($self, $state) = @_;
}


sub getFontHeight {
    my ($self) = @_;
        return $self->{font}->getHeight();
}


sub setBackgroundBasicColorP {
    my ($self, $basicColor) = @_;
}


sub setForegroundBasicColorP {
    my ($self, $basicColor) = @_;
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Font;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::graphics::form::item::ABTextItem;

1;

