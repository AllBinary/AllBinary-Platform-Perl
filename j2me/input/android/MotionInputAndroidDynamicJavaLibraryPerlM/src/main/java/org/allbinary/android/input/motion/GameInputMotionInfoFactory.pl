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

package org::allbinary::android::input::motion::GameInputMotionInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        my $SDK_VERSION = 'org::allbinary::android::AndroidInfoFactory'->getInstance()->getVersion();
        if ($SDK_VERSION <= 4) {
            return 'org::allbinary::android::input::motion::api1::GameInputMotionInfoAPI1'->getInstance();
        } else {
            return 'org::allbinary::android::input::motion::api5::GameInputMotionInfoAPI5'->getInstance();
        }
}

use org::allbinary::android::AndroidInfoFactory;
use org::allbinary::android::input::motion::api1::GameInputMotionInfoAPI1;
use org::allbinary::android::input::motion::api5::GameInputMotionInfoAPI5;

1;

