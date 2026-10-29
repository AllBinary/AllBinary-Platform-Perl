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

package org::allbinary::direction::Direction;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $directionArray = [(undef) x (13)];

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{otherName} = undef;
    $self->{value} = undef;
    $self->{frameFactor} = undef;
}


sub new {
    my ($class, $name, $otherName, $value, $frameFactor) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{otherName} = $otherName;
        $self->{value} = $value;
        $self->{frameFactor} = $frameFactor;
        $org::allbinary::direction::Direction::directionArray->[$value] = $self;
    return $self;
}


sub getInstance {
    my ($class, $direction) = @_;
        return $org::allbinary::direction::Direction::directionArray->[$direction];
}


sub getValue {
    my ($self) = @_;
        return $self->{value};
}


sub getFrameFactor {
    my ($self) = @_;
        return $self->{frameFactor};
}


sub getOtherName {
    my ($self) = @_;
        return $self->{otherName};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Direction: ");
        $stringBuffer->append($self->getName());
        $stringBuffer->append(" Or: ");
        $stringBuffer->append($self->getOtherName());
        $stringBuffer->append(" Value: ");
        $stringBuffer->appendint($self->{value});
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;

1;

