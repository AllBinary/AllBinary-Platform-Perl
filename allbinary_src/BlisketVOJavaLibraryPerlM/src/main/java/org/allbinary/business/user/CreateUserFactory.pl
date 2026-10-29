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

package org::allbinary::business::user::CreateUserFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $hashMap) = @_;
        if (defined($hashMap)) {
            my $roleString = $hashMap->get($org::allbinary::business::user::role::UserRoleData::NAME->toString());
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($roleString)) {
                my $role = 'org::allbinary::business::user::role::UserRoleB'->getRole($roleString);
                return $role->getUserFactory()->getInstance($hashMap);
            } else {
                die ("No Role Specified");
            }
        } else {
            die ("Null HashMap");
        }
}

use java::util::HashMap;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::business::user::role::UserRoleB;
use org::allbinary::business::user::role::UserRoleData;
use org::allbinary::logic::string::StringValidationUtil;

1;

