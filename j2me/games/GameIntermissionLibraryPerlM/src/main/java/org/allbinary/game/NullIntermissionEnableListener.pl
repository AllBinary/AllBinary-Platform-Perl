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

package org::allbinary::game::NullIntermissionEnableListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::IntermissionEnableListenerInterface';

our $SINGLETON = 'org::allbinary::game::NullIntermissionEnableListener'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::NullIntermissionEnableListener::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub notifyIntermission {
    my ($self, $enable) = @_;
}

use org::allbinary::game::IntermissionEnableListenerInterface;

1;

