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

package org::allbinary::business::user::role::UserRoleB;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::role::UserRole';

our $roleVector = 'org::allbinary::util::BasicArrayListD'->new();


sub new {
    my ($class, $aBasicUserRole, $aUserFactoryInterface) = @_;
    my $self = $class->SUPER::new($aBasicUserRole, $aUserFactoryInterface);
        # super(...) made $self above
        $org::allbinary::business::user::role::UserRoleB::roleVector->add($self);
    return $self;
}


# throws Exception
sub getRole {
    my ($class, $role) = @_;
        'org::allbinary::business::user::role::UserRoleFactory'->getInstance();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($role)) {
            my $roleVector = 'org::allbinary::business::user::role::UserRoleB'->getAll();
            my $size = $roleVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $userRole = $roleVector->get($index);
                if (($role cmp $userRole->toString()) == 0) {
                    return $userRole;
                }
            }
        }
        die ("Unable to get role - Unknown Role = " . $role);
}


sub getAll {
    my ($class) = @_;
        'org::allbinary::business::user::role::UserRoleFactory'->getInstance();
        return $org::allbinary::business::user::role::UserRoleB::roleVector;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::UserFactoryInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::business::user::role::UserRoleFactory;

1;

