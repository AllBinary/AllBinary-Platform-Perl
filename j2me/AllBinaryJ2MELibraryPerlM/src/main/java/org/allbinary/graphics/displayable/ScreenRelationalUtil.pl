# Generated Code Do Not Modify

package org::allbinary::graphics::displayable::ScreenRelationalUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::ScreenRelationalUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::ScreenRelationalUtil::instance;
}


sub getScaleImage {
    my ($self, $image) = @_;
        return $self->getScaleWH($image->getWidth(), $image->getHeight());
}


sub getScaleWH {
    my ($self, $aWidth, $aHeight) = @_;
        return $self->getScaleWHA($aWidth, $aHeight, 20);
}


sub getScaleWHA {
    my ($self, $aWidth, $aHeight, $add) = @_;
        my $displayInfoSingleton = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $last = $displayInfoSingleton->getLast();
        my $width = $last->[$displayInfoSingleton->{WIDTH}];
        my $height = $last->[$displayInfoSingleton->{HEIGHT}];
        my $largestSize = $width;
        if ($largestSize < $height) {
            $largestSize = $height;
        }
        my $scale = ($largestSize) / $aWidth;
        return $scale;
}


sub getScaledHeight {
    my ($self, $aWidth, $aHeight) = @_;
        return int(($self->getScaleWH($aWidth, $aHeight) * $aHeight));
}


sub getScaledHeightAdd {
    my ($self, $aWidth, $aHeight, $add) = @_;
        return int(($self->getScaleWHA($aWidth, $aHeight, $add) * $aHeight));
}

# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;

1;

