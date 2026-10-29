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

package taghelpers::StoreTagWorkFlowHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelperFactoryInterface';

our $CLASSNAME = "taghelpers.StoreTagWorkFlowHelper";
our $FACTORYNAME = "taghelpers.StoreTagWorkFlowHelperFactory";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception, LicensingException
sub getInstance {
    my ($self, $propertiesHashMap, $pageContext) = @_;
        return 'admin::taghelpers::HelperFactory'->getInstance($FACTORYNAME, $CLASSNAME, $propertiesHashMap, $pageContext);
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use admin::taghelpers::HelperFactory;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::taghelpers::TagHelperFactoryInterface;

1;

