# Generated Code Do Not Modify

package org::allbinary::graphics::form::item::CustomCustomItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABCustomItem','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub new {
    my ($class, $label, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($label, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::form::item::ABCustomItem;

1;

