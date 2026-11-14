#
# AllBinary Open License Version 1
# Copyright (c) 2009 AllBinary
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

package org::allbinary::android::input::motion::GameInputMotionInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{MAX_API} = undef;
    $self->{MAX_POINTERS} = undef;
}


sub new {
    my ($class, $maxApi, $maxPointers) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{MAX_API} = $maxApi;
        $self->{MAX_POINTERS} = $maxPointers;
    return $self;
}

use java::lang::Object ();

1;

