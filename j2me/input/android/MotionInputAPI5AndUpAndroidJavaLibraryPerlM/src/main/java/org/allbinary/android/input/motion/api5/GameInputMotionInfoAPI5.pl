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

package org::allbinary::android::input::motion::api5::GameInputMotionInfoAPI5;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::motion::GameInputMotionInfo';

our $instance = 'org::allbinary::android::input::motion::api5::GameInputMotionInfoAPI5'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::input::motion::api5::GameInputMotionInfoAPI5::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(2147483647, 10);
        # super(...) made $self above
    return $self;
}

use org::allbinary::android::input::motion::GameInputMotionInfo;

1;

