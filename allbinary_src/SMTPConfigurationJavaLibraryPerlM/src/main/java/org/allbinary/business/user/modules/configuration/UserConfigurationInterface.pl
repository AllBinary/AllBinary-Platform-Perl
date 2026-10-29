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
package org::allbinary::business::user::modules::configuration::UserConfigurationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getUserEmailConfigurationInterface {
    my ($self) = @_;
    die "abstract method getUserEmailConfigurationInterface";
}


sub setUserEmailConfigurationInterface {
    my ($self, $userEmailConfigurationInterface) = @_;
    die "abstract method setUserEmailConfigurationInterface";
}


sub getTimeCreated {
    my ($self) = @_;
    die "abstract method getTimeCreated";
}


sub getTimeLastModified {
    my ($self) = @_;
    die "abstract method getTimeLastModified";
}


sub setTimeCreated {
    my ($self, $timeCreated) = @_;
    die "abstract method setTimeCreated";
}


sub setTimeLastModified {
    my ($self, $timeLastModified) = @_;
    die "abstract method setTimeLastModified";
}

use org::allbinary::business::time::created::TimeCreated;
use org::allbinary::business::time::modified::TimeLastModified;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationInterface;

1;

