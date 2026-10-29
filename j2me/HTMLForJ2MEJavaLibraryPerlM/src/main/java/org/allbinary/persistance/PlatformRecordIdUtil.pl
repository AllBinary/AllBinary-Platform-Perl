# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::persistance::PlatformRecordIdUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::persistance::PlatformRecordIdUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{PLATFORM_SHORT_NAME} = "HTML";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::persistance::PlatformRecordIdUtil::instance;
}


sub getRecordId {
    my ($self, $abeClientInformation, $baseRecordId) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($abeClientInformation->toShortString())->append('org::allbinary::string::CommonSeps'->getInstance()->{UNDERSCORE})->append($self->{PLATFORM_SHORT_NAME})->append($baseRecordId)->toString();
}

use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;

1;

