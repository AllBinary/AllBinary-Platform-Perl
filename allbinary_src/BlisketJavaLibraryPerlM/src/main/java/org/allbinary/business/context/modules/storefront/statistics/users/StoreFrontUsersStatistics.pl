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

package org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatistics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{totalNumberOfUsers} = undef;
    $self->{totalUsersByRoleHashMap} = undef;
}


sub new {
    my ($class, $storeFrontInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{totalUsersByRoleHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $userEntityInterface = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance();
        my $userVector = $userEntityInterface->getCustomers();
        $self->{totalNumberOfUsers} = $userVector->size();
        my $size = $userVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $userInterface = $userVector->get($index);
            my $nextUserRole = $userInterface->getRole();
            my $currentNumberOfUsersForRole = $self->getNewTotal($nextUserRole);
            $self->{totalUsersByRoleHashMap}->put($nextUserRole, $currentNumberOfUsersForRole);
        }
    return $self;
}


sub getNewTotal {
    my ($self, $userRole) = @_;
        my $numberOfUsersForRoleLong = $self->{totalUsersByRoleHashMap}->get($userRole);
        if (!defined($numberOfUsersForRoleLong)) {
            $numberOfUsersForRoleLong = 0;
        }
        return int($numberOfUsersForRoleLong) + 1;
}


sub getNumberOfUsers {
    my ($self) = @_;
        return $self->{totalNumberOfUsers};
}


sub getNumberOfUsersByRole {
    my ($self, $role) = @_;
        my $totalForRole = $self->{totalUsersByRoleHashMap}->get($role);
        return $totalForRole;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put('org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsData'->getInstance()->{NUMBEROFUSERS}, $self->getNumberOfUsers()->toString());
        my $setOfUserRoles = $self->{totalUsersByRoleHashMap}->keySet();
        my $nextUserRole = undef;
        my $userRoleArray = $setOfUserRoles->toArray();
        my $size = scalar(@{$userRoleArray});
        for (my $index = 0; $index < $size; $index++) {
            $nextUserRole = $userRoleArray->[$index];
            my $totalForRole = $self->{totalUsersByRoleHashMap}->get($nextUserRole);
            $hashMap->put($nextUserRole->toString(), ("" . ($totalForRole)));
        }
        return $hashMap;
}


sub toVector {
    my ($self) = @_;
        return undef;
}


sub getKey {
    my ($self) = @_;
        return undef;
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::data::tables::user::UserEntityInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsInterface;
use org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsData;

1;

