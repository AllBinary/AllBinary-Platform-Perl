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

#None - Do not use
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


sub getRecord {
    my ($self, $anyType, $recordId) = @_;
        return [(0) x (0)];
}


sub compareTo {
    my ($self, $a, $b) = @_;
        return ($a cmp $b);
}


sub equalIgnoreCase {
    my ($self, $a, $b) = @_;
        return (lc($a) eq lc($b));
}


sub equalsNotstring {
    my ($self, $anyType, $object2) = @_;
        return $anyType->equals($object2);
}


sub toNumberFromChar {
    my ($self, $value) = @_;
        return ord($value);
}


sub toNumber {
    my ($self, $value) = @_;
        return $value;
}


sub getByteArray {
    my ($self, $string) = @_;
        return [unpack("C*", $string)];
}


sub isItemListener {
    my ($self, $owner) = @_;
        return 0;
}


sub printAvailableMethods {
    my ($self, $anyType) = @_;
}


sub gc {
    my ($self) = @_;
        1;
}

use java::lang::System;

1;

