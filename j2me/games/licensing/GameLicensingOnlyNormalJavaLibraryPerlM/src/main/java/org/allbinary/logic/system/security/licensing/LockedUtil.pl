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

package org::allbinary::logic::system::security::licensing::LockedUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::LockedUtilInterface';

our $instance = 'org::allbinary::logic::system::security::licensing::LockedUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::LockedUtil::instance;
}


sub isLocked {
    my ($self) = @_;
        return 0;
}


sub isLockedFeature {
    my ($self, $lockableFeatrue) = @_;
        return 0;
}

use org::allbinary::logic::system::security::licensing::LockedUtilInterface;

1;

