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

package org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $LOGGING = 'org::allbinary::util::BasicArrayListD'->new();


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

