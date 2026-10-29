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

package org::allbinary::logic::util::cache::CachePolicy;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{maxTime} = 0;
    $self->{maxSize} = 0;
}


sub new {
    my ($class, $name, $maxTime, $maxSize) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->setMaxTime($maxTime);
        $self->setMaxSize($maxSize);
    return $self;
}


sub getMaxTime {
    my ($self) = @_;
        return $self->{maxTime};
}


sub setMaxTime {
    my ($self, $maxTime) = @_;
        $self->{maxTime} = $maxTime;
}


sub getMaxSize {
    my ($self) = @_;
        return $self->{maxSize};
}


sub setMaxSize {
    my ($self, $maxSize) = @_;
        $self->{maxSize} = $maxSize;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


1;

