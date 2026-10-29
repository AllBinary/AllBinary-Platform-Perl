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

package org::allbinary::logic::util::cache::BaseCircularPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{circularIndexUtil} = $org::allbinary::util::CircularIndexUtil::NULL_CIRCULAR_INDEX_UTIL;
    $self->{OBJECT_ARRAY} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT_ARRAY};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getNextInstance {
    my ($self) = @_;
        my $anyType = $self->{OBJECT_ARRAY}->[$self->{circularIndexUtil}->getIndex()];
        $self->{circularIndexUtil}->next();
        return $anyType;
}


sub init {
    my ($self, $allBinaryObjectFactoryInterface) = @_;
        $self->{circularIndexUtil}->setIndex(0);
        my $size = $self->{circularIndexUtil}->getSize();
        for (my $index = 0; $index < $size; $index++) {
            $self->{OBJECT_ARRAY}->[$index] = $allBinaryObjectFactoryInterface->getInstance();
        }
}


# throws Exception
sub getInstance {
    my ($self, $index) = @_;
        return $self->{OBJECT_ARRAY}->[$index];
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::NullUtil;
use org::allbinary::util::CircularIndexUtil;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;

1;

