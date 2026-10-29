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

package org::allbinary::business::user::modules::configuration::UserConfigurationData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NAME = "USER_CONFIGURATION_NAME";
our $UNCRYPTED_EXTENSION = 'org::allbinary::logic::io::file::CommonDataFileStrings'->getInstance()->{UNCRYPTED_EXTENSION};
our $ENCRYPTED_EXTENSION = 'org::allbinary::logic::io::file::CommonDataFileStrings'->getInstance()->{ENCRYPTED_EXTENSION};


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

use org::allbinary::logic::io::file::CommonDataFileStrings;

1;

