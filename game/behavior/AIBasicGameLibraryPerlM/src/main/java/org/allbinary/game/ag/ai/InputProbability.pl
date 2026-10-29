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

package org::allbinary::game::ag::ai::InputProbability;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $INPUT_PROBABILITY = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(0);

sub _init_fields {
    my ($self) = @_;
    $self->{likelyhoodIntegerArray} = undef;
    $self->{repeatLikelyhoodIntegerArray} = undef;
    $self->{max} = undef;
    $self->{timeDelayHelper} = undef;
}


sub new {
    my ($class, $likelyhoodIntegerArray, $repeatLikelyhoodIntegerArray, $max, $timeDelayHelper) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{likelyhoodIntegerArray} = $likelyhoodIntegerArray;
        $self->{repeatLikelyhoodIntegerArray} = $repeatLikelyhoodIntegerArray;
        $self->{max} = $max;
        $self->{timeDelayHelper} = $timeDelayHelper;
    return $self;
}


sub getLikelyhoodIntegerArray {
    my ($self) = @_;
        return $self->{likelyhoodIntegerArray};
}


sub getRepeatLikelyhoodIntegerArray {
    my ($self) = @_;
        return $self->{repeatLikelyhoodIntegerArray};
}


sub getMax {
    my ($self) = @_;
        return $self->{max};
}


sub getTimeDelayHelper {
    my ($self) = @_;
        return $self->{timeDelayHelper};
}


sub toHashtable {
    my ($self) = @_;
        my $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        $hashtable->put($org::allbinary::game::ag::ai::InputProbability::INPUT_PROBABILITY, $self);
        return $hashtable;
}

use org::allbinary::logic::StdUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;

1;

