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
    return _new1($class, @arguments) if scalar(@arguments) == 1;
    return _new1($class, @arguments) if scalar(@arguments) == 1;
    die "No constructor of TimeCreated takes " . scalar(@arguments) . " arguments";
}

sub _new1 {
    my ($class, @arguments) = @_;
    return _new1_1($class, @arguments) if 1 && !ref($arguments[0]);
    return _new1_2($class, @arguments);
}


sub _new1_1 {
    my ($class, $time) = @_;
    my $self = $class->SUPER::new(int($time));
        # super(...) made $self above
    return $self;
}


sub _new1_2 {
    my ($class, $time) = @_;
    my $self = $class->SUPER::new($time);
        # super(...) made $self above
    return $self;
}

use java::lang::Object ();
use org::allbinary::business::time::Time ();

1;

