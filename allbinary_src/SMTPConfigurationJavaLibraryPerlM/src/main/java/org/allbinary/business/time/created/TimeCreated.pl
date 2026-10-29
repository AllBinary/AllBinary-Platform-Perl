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

package org::allbinary::business::time::created::TimeCreated;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::time::Time';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TimeCreated takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $time) = @_;
    my $self = $class->SUPER::new($time);
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $time) = @_;
    my $self = $class->SUPER::new($time);
        # super(...) made $self above
    return $self;
}

use org::allbinary::business::time::Time;

1;

