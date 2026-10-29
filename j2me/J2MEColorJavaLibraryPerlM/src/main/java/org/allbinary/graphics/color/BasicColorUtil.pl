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

package org::allbinary::graphics::color::BasicColorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::color::BasicColorUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ZERO_ARRAY} = [(undef) x (0)];
    $self->{ALPHA} = 0xFF000000;
    $self->{isAlpha} = 1;
    $self->{ffOpaque} = 1;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::BasicColorUtil::instance;
}


sub getRGB {
    my ($self, $red, $green, $blue) = @_;
        my $value = 0;
        if ($self->{isAlpha}) {
            if ($self->{ffOpaque}) {
                $value = $self->{ALPHA};
            }
        }
        $value = ($red << 16) | $value;
        $value = ($green << 8) | $value;
        $value = $blue | $value;
        return $value;
}


sub getARGB {
    my ($self, $alphaValue, $r, $g, $b) = @_;
        return (($alphaValue << 24) & $self->{ALPHA}) + (($r << 16) & 0x00FF0000) + (($g << 8) & 0x0000FF00) + ($b & 0x000000FF);
}


sub get {
    my ($self, $alphaValue, $color) = @_;
        return (($alphaValue << 24) & $self->{ALPHA}) + $color;
}


sub invert {
    my ($self, $color) = @_;
        return (0xFFFFFF - $color) | $self->{ALPHA};
}


1;

