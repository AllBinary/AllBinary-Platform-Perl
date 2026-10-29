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

package org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{userEmailEventConfigurationInterface} = undef;
}


sub new {
    my ($class, $userEmailEventConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userEmailEventConfigurationInterface} = $userEmailEventConfigurationInterface;
    return $self;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::NAME, $self->{userEmailEventConfigurationInterface}->getName());
        $hashMap->put($org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::LISTENER_CLASSPATH, $self->{userEmailEventConfigurationInterface}->getEventListenerClassPath());
        return $hashMap;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return $org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData::NAME;
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($self->{userEmailEventConfigurationInterface}->getName());
        $vector->add($self->{userEmailEventConfigurationInterface}->getEventListenerClassPath());
        return $vector;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationData;

1;

