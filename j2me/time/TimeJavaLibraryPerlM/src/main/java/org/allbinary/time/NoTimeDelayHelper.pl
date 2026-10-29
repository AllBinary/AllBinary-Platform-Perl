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

package org::allbinary::time::NoTimeDelayHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::time::TimeDelayHelper';

our $SINGLETON = 'org::allbinary::time::NoTimeDelayHelper'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(0);
        # super(...) made $self above
    return $self;
}


sub isTimeTNT {
    my ($self) = @_;
        return 1;
}


sub isTimeSinceTNT {
    my ($self, $delay) = @_;
        return 1;
}


sub isTime {
    my ($self, $currentTime) = @_;
        return 1;
}


sub isTimeSince {
    my ($self, $delay, $currentTime) = @_;
        return 1;
}

use org::allbinary::time::TimeDelayHelper;

1;

