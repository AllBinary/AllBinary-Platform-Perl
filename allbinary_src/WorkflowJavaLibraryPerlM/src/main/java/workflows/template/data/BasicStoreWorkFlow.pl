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

package workflows::template::data::BasicStoreWorkFlow;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'workflows::template::data::BasicWorkFlow','org::allbinary::logic::control::workflow::StoreWorkFlowInterface';



sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($propertiesHashMap, $pageContext);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub getStoreName {
    my ($self) = @_;
        return $self->getPropertiesHashMap()->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::logic::control::workflow::StoreWorkFlowInterface;
use workflows::template::data::BasicWorkFlow;

1;

