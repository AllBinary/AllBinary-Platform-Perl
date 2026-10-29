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

# Java interface
package org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventsConfigurationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getEventConfigurationHashMap {
    my ($self) = @_;
    die "abstract method getEventConfigurationHashMap";
}


sub addUserEmailEventConfiguration {
    my ($self, $userEmailEventConfigurationInterface) = @_;
    die "abstract method addUserEmailEventConfiguration";
}


# throws Exception
sub getEventListener {
    my ($self, $abeClientInformation, $userEmailEventNameData, $userInterface) = @_;
    die "abstract method getEventListener";
}

use java::util::HashMap;
use org::allbinary::business::user::UserInterface;
use org::allbinary::logic::communication::smtp::event::UserEmailEventListenerInterface;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;

1;

