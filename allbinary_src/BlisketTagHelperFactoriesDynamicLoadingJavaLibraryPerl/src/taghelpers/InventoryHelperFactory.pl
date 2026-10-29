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

package taghelpers::InventoryHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $CLASSNAME = "taghelpers.InventoryHelper";
our $FACTORYNAME = "taghelpers.InventoryHelperFactory";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws LicensingException
sub getInstance {
    my ($class, $hashMap, $pageContext) = @_;
        return 'admin::taghelpers::HelperFactory'->getInstance($FACTORYNAME, $CLASSNAME, $hashMap, $pageContext);
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::taghelpers::HelperFactory;

1;

