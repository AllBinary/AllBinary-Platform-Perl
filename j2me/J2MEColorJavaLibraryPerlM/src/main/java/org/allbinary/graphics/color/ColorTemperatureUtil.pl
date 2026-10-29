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

package org::allbinary::graphics::color::ColorTemperatureUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::color::ColorTemperatureUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::ColorTemperatureUtil::instance;
}


sub getBasicColor {
    my ($self, $thirdTemp) = @_;
        my $basicColor = $self->{basicColorFactory}->{RED};
        if ($thirdTemp > 3700) {
            $basicColor = $self->{basicColorFactory}->{PURPLE};
        } elsif ($thirdTemp > 3200) {
            $basicColor = $self->{basicColorFactory}->{BLUE};
        } elsif ($thirdTemp > 2700) {
            $basicColor = $self->{basicColorFactory}->{PUCE};
        } elsif ($thirdTemp > 2200) {
            $basicColor = $self->{basicColorFactory}->{WHITE};
        } elsif ($thirdTemp > 1700) {
            $basicColor = $self->{basicColorFactory}->{GREEN};
        } elsif ($thirdTemp > 1200) {
            $basicColor = $self->{basicColorFactory}->{YELLOW};
        } elsif ($thirdTemp > 700) {
            $basicColor = $self->{basicColorFactory}->{ORANGE};
        }
        return $basicColor;
}

use org::allbinary::graphics::color::BasicColorFactory;

1;

