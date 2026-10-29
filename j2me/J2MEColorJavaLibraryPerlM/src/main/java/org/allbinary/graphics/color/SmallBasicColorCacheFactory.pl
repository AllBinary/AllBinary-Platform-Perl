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

package org::allbinary::graphics::color::SmallBasicColorCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::color::SmallBasicColorCacheFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SIZE} = 255;
    $self->{INDEX_TO_COLOR} = [(0) x ($self->{SIZE})];
    $self->{BASIC_COLOR_ARRAY} = [(undef) x ($self->{SIZE})];
    $self->{colorIndex} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::SmallBasicColorCacheFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub add {
    my ($self, $basicDefaultColor) = @_;
        $self->{BASIC_COLOR_ARRAY}->[$self->{colorIndex}] = $basicDefaultColor;
        $self->{INDEX_TO_COLOR}->[$self->{colorIndex}] = int($basicDefaultColor);
        $self->{colorIndex}++;
}


sub getAndOrCreate {
    my ($self, $colorAsInt) = @_;
        my $basicColor = undef;
        for (my $index = 0; $index < $self->{SIZE}; $index++) {
            if ($self->{INDEX_TO_COLOR}->[$index] == $colorAsInt) {
                return $self->{BASIC_COLOR_ARRAY}->[$index];
            }
        }
        my $ALPHA_MASK = 0xFF000000;
        $basicColor = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->createInstanceAN($colorAsInt & $ALPHA_MASK, $colorAsInt & 0x00FFFFFF, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->add($basicColor);
        return $basicColor;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::color::BasicColorFactory;

1;

