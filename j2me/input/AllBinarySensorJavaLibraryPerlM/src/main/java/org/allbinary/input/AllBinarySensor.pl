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

package org::allbinary::input::AllBinarySensor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::AllBinarySensorListener';

our $NULL_ALLBINARY_SENSOR = 'org::allbinary::input::AllBinarySensor'->new();
our $max = 100;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
}


# throws Exception
sub update {
    my ($self) = @_;
}


sub setMax {
    my ($class, $max) = @_;
        $org::allbinary::input::AllBinarySensor::max = $max;
}


sub getMax {
    my ($class) = @_;
        return $org::allbinary::input::AllBinarySensor::max;
}


sub getId {
    my ($self) = @_;
        return 'org::allbinary::input::AllBinarySensor'->getMax();
}


sub shutdown {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "shutdown");
}


sub onSensorChange {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
}

use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::AllBinarySensorListener;

1;

