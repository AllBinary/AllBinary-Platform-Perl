# Generated Code Do Not Modify

package org::allbinary::graphics::OpenGLBitmap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::platform::graphics::PlatformBitmapBase';


sub _init_fields {
    my ($self) = @_;
    $self->{image} = undef;
}


sub new {
    my ($class, $bitmap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{image} = $bitmap;
    return $self;
}


sub getImage {
    my ($self) = @_;
        return $self->{image};
}


sub getDepth {
    my ($self) = @_;
        if ($self->{image}->isMutable()) {
            my $mutableImage = $self->{image};
            return $mutableImage->getDepth();
        } else {
            my $immutableImage = $self->{image};
            return $immutableImage->getDepth();
        }
}


sub getPixels {
    my ($self, $pixels, $offset, $stride, $x, $y, $width, $height) = @_;
        if ($self->{image}->isMutable()) {
            my $mutableImage = $self->{image};
            $mutableImage->getRGB($pixels, $offset, $stride, $x, $y, $width, $height);
        } else {
            my $immutableImage = $self->{image};
            $immutableImage->getRGB($pixels, $offset, $stride, $x, $y, $width, $height);
        }
}


sub setPixels {
    my ($self, $pixels, $offset, $stride, $x, $y, $width, $height) = @_;
        $self->{image}->setRGB2($pixels, $offset, $height, $x, $y, $width, $height);
}


sub getWidth {
    my ($self) = @_;
        return $self->{image}->getWidth();
}


sub getHeight {
    my ($self) = @_;
        return $self->{image}->getHeight();
}


sub recycle {
    my ($self) = @_;
        'org::allbinary::DisposalUtil'->getInstance()->disposeImage($self->{image});
}

# use javax::microedition::lcdui::Image;
use org::allbinary::DisposalUtil;
use org::allbinary::platform::graphics::PlatformBitmapBase;
use org::microemu::device::swt::SwtImmutableImage;
use org::microemu::device::swt::SwtMutableImage;

1;

