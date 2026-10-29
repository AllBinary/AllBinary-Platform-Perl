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

package org::allbinary::game::layer::hud::LapInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_LAP_INFO = 'org::allbinary::game::layer::hud::LapInfo'->new(-1);

sub _init_fields {
    my ($self) = @_;
    $self->{numberOfLaps} = undef;
    $self->{totalLaps} = undef;
}


sub new {
    my ($class, $totalLaps) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{totalLaps} = $totalLaps;
        $self->{numberOfLaps} = 1;
    return $self;
}


sub add {
    my ($self) = @_;
        $self->{numberOfLaps}++;
}


sub getCurrentLap {
    my ($self) = @_;
        return $self->{numberOfLaps};
}


sub getTotalLaps {
    my ($self) = @_;
        return $self->{totalLaps};
}


sub isDone {
    my ($self) = @_;
        if ($self->{numberOfLaps} >= $self->{totalLaps}) {
            return 1;
        }
        return 0;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("isDone: ");
        $stringBuffer->appendboolean($self->isDone());
        $stringBuffer->append(" CurrentLap: ");
        $stringBuffer->appendint($self->getCurrentLap());
        $stringBuffer->append(" Total Laps: ");
        $stringBuffer->appendint($self->getTotalLaps());
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;

1;

