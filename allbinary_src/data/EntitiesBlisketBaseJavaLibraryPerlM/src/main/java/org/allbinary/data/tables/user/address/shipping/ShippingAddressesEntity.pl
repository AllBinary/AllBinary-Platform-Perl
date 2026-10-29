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

package org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::user::address::StreetAddressesEntity';


sub _init_fields {
    my ($self) = @_;
    $self->{TABLENAME} = "shipping";
}


sub new {
    my ($class, $userName) = @_;
    my $self = $class->SUPER::new($userName);
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{TABLENAME});
    return $self;
}

use org::allbinary::data::tables::user::address::StreetAddressesEntity;

1;

