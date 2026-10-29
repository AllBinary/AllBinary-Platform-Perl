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

package org::allbinary::logic::math::Orientation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NONE = 'org::allbinary::logic::math::Orientation'->new(0, 0, 0);
our $SINGLETON = 'org::allbinary::logic::math::Orientation'->new(0, 0, 0);

sub _init_fields {
    my ($self) = @_;
    $self->{yaw} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
    $self->{pitch} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
    $self->{roll} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
}


sub getInstance {
    my ($class, $yaw, $pitch, $roll) = @_;
        $org::allbinary::logic::math::Orientation::SINGLETON->{yaw}->setint($yaw);
        $org::allbinary::logic::math::Orientation::SINGLETON->{pitch}->setint($pitch);
        $org::allbinary::logic::math::Orientation::SINGLETON->{roll}->setint($roll);
        return $org::allbinary::logic::math::Orientation::SINGLETON;
}


sub new {
    my ($class, $yaw, $pitch, $roll) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{yaw}->setint($yaw);
        $self->{pitch}->setint($pitch);
        $self->{roll}->setint($roll);
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Y: ");
        $stringBuffer->append($self->{yaw}->toString());
        $stringBuffer->append(" P: ");
        $stringBuffer->append($self->{pitch}->toString());
        $stringBuffer->append(" R: ");
        $stringBuffer->append($self->{roll}->toString());
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::math::BasicDecimal;

1;

