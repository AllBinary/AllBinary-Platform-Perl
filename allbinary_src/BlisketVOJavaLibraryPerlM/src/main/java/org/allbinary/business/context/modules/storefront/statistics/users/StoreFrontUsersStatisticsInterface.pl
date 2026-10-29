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

#import org.allbinary.business.user.commerce.money.Money;
# Java interface
package org::allbinary::business::context::modules::storefront::statistics::users::StoreFrontUsersStatisticsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';



sub getNumberOfUsers {
    my ($self) = @_;
    die "abstract method getNumberOfUsers";
}


sub getNumberOfUsersByRole {
    my ($self, $role) = @_;
    die "abstract method getNumberOfUsersByRole";
}

use org::allbinary::data::tables::TableMappingInterface;

1;

