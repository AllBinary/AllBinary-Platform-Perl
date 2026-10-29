# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::logic::math::J2SEMath;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::math::J2SEMath'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::J2SEMath::instance;
}


sub round {
    my ($self, $value) = @_;
        return int($value);
}


sub abs {
    my ($self, $value) = @_;
        return (($value < 0.0) ? -$value : $value);
}


sub absdouble {
    my ($self, $value) = @_;
        return (($value < 0.0) ? -$value : $value);
}


1;

