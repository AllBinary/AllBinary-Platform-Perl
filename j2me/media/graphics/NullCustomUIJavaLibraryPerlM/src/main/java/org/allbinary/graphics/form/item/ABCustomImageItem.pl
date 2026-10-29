# Generated Code Do Not Modify

package org::allbinary::graphics::form::item::ABCustomImageItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABCustomItem';


sub _init_fields {
    my ($self) = @_;
    $self->{yOffset} = 0;
}


sub new {
    my ($class, $label, $image, $layout, $altText, $basicColor, $yOffset) = @_;
    my $self = $class->SUPER::new($label, $basicColor, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getImage {
    my ($self) = @_;
        return $javax::microedition::lcdui::NullImage::NULL_IMAGE;
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::ABCustomItem;

1;

