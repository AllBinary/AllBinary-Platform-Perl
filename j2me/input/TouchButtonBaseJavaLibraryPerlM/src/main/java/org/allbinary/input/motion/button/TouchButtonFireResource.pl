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

package org::allbinary::input::motion::button::TouchButtonFireResource;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::button::TouchButtonResource';

our $instance = 'org::allbinary::input::motion::button::TouchButtonFireResource'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::TouchButtonFireResource::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new("/touch_button_fire_64_by_64.png", "/touch_button_fire_hint_64_by_64.png");
        # super(...) made $self above
    return $self;
}

use org::allbinary::input::motion::button::TouchButtonResource;

1;

