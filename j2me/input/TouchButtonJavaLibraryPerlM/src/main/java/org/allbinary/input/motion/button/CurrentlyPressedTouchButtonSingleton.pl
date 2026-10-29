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

package org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingleton::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub size {
    my ($self) = @_;
        return $self->{list}->size();
}


sub removeAt {
    my ($self, $index) = @_;
        return $self->{list}->removeAt($index);
}


sub remove {
    my ($self, $touchButtonInput) = @_;
        return $self->{list}->remove($touchButtonInput);
}


sub get {
    my ($self, $index) = @_;
        return $self->{list}->{objectArray}->[$index];
}


sub contains {
    my ($self, $touchButtonInput) = @_;
        return $self->{list}->contains($touchButtonInput);
}


sub add {
    my ($self, $touchButtonInput) = @_;
        $self->{list}->add($touchButtonInput);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

