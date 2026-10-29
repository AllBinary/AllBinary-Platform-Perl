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

package org::allbinary::logic::math::MathData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::math::MathData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EQUALS} = undef;
    $self->{PLUS} = "+";
    $self->{GREATER_THAN} = ">";
    $self->{MINUS} = undef;
    $self->{DIVIDE} = undef;
    $self->{MULTIPLY} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::math::MathData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $self->{EQUALS} = $commonSeps->{EQUALS};
        $self->{MINUS} = $commonSeps->{DASH};
        $self->{DIVIDE} = $commonSeps->{FORWARD_SLASH};
        $self->{MULTIPLY} = 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{STAR};
    return $self;
}

use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;

1;

