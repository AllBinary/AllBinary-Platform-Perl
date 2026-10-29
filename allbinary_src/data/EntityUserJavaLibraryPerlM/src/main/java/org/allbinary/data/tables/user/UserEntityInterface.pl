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
package org::allbinary::data::tables::user::UserEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



# throws Exception
sub getAdministrators {
    my ($self) = @_;
    die "abstract method getAdministrators";
}


# throws Exception
sub getStoreManagers {
    my ($self, $storeFrontInterface) = @_;
    die "abstract method getStoreManagers";
}


# throws Exception
sub getCustomers {
    my ($self) = @_;
    die "abstract method getCustomers";
}


# throws Exception
sub getUsersWithRole {
    my ($self, $userRole) = @_;
    die "abstract method getUsersWithRole";
}


# throws Exception
sub getUsers {
    my ($self, $storeFrontInterface) = @_;
    die "abstract method getUsers";
}


# throws Exception
sub getUser {
    my ($self, $userName) = @_;
    die "abstract method getUser";
}


sub login {
    my ($self, $userName, $password) = @_;
    die "abstract method login";
}


sub deleteWhere {
    my ($self, $key, $value) = @_;
    die "abstract method deleteWhere";
}


sub insert {
    my ($self, $values) = @_;
    die "abstract method insert";
}


sub update {
    my ($self, $userName, $updatedValues) = @_;
    die "abstract method update";
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::role::UserRole;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

