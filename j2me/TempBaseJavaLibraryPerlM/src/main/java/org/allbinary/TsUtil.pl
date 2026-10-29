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

#TempBase
package org::allbinary::TsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::TsUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::TsUtil::instance;
}


sub longBitsToDouble {
    my ($self, $bits) = @_;
        return unpack('d', pack('q', $bits));
}


sub intBitsToFloat {
    my ($self, $bits) = @_;
        return unpack('f', pack('l', $bits));
}


sub hashCode {
    my ($self, $anyType) = @_;
        return $anyType->hashCode();
}


# throws InterruptedException
sub waitFor {
    my ($self, $any, $timeoutMillis) = @_;
        my $anyType = $any;
        $anyType->wait($timeoutMillis);
}


sub compareTo {
    my ($self, $a, $b) = @_;
        return ($a cmp $b);
}


1;

