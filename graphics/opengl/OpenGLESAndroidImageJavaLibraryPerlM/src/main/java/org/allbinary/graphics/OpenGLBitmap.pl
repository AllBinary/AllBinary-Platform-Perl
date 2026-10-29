# Generated Code Do Not Modify

package org::allbinary::graphics::OpenGLBitmap;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::platform::graphics::PlatformBitmapBase';


sub _init_fields {
    my ($self) = @_;
    $self->{bitmap} = undef;
}


sub new {
    my ($class, $bitmap) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{bitmap} = $bitmap;
    return $self;
}


sub getPixels {
    my ($self, $pixels, $offset, $stride, $x, $y, $width, $height) = @_;
        $self->{bitmap}->getPixels($pixels, $offset, $stride, $x, $y, $width, $height);
}


sub setPixels {
    my ($self, $pixels, $offset, $stride, $x, $y, $width, $height) = @_;
        $self->{bitmap}->setPixels($pixels, $offset, $stride, $x, $y, $width, $height);
}


sub getWidth {
    my ($self) = @_;
        return $self->{bitmap}->getWidth();
}


sub getHeight {
    my ($self) = @_;
        return $self->{bitmap}->getHeight();
}


sub recycle {
    my ($self) = @_;
        $self->{bitmap}->recycle();
}

use android::graphics::Bitmap;
use org::allbinary::platform::graphics::PlatformBitmapBase;

1;

