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

package org::allbinary::business::user::modules::customer::wholesale::WholesaleUserFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::UserFactoryInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self) = @_;
        return 'org::allbinary::business::user::modules::customer::wholesale::WholesaleUser'->new();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $hashMap) = @_;
        return 'org::allbinary::business::user::modules::customer::wholesale::WholesaleUser'->new($hashMap);
}

use java::util::HashMap;
use org::allbinary::business::user::UserFactoryInterface;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::modules::customer::wholesale::WholesaleUser;

1;

