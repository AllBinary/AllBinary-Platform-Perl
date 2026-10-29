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

package org::allbinary::business::time::Time;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{timeLong} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of Time takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $time) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{timeLong} = $time;
    return $self;
}


sub _new1 {
    my ($class, $time) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{timeLong} = $time;
    return $self;
}


sub getLong {
    my ($self) = @_;
        return $self->{timeLong};
}


sub getlong {
    my ($self) = @_;
        return int($self->{timeLong});
}


sub toString {
    my ($self) = @_;
        return $self->getLong()->toString();
}


1;

