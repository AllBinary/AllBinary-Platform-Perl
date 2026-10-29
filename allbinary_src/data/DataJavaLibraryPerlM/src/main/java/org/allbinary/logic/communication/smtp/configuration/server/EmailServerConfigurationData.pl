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

package org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NAME = "EMAIL_SERVER_CONFIGURATION_NAME";
our $SERVER = "EMAIL_SERVER_CONFIGURATION_SERVER";
our $ACCOUNT = "EMAIL_SERVER_CONFIGURATION_ACCOUNT";
our $PASSWORD = "EMAIL_SERVER_CONFIGURATION_PASSWORD";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

