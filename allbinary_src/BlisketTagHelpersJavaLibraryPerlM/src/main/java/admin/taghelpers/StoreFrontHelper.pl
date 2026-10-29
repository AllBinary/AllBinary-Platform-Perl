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

package admin::taghelpers::StoreFrontHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{storeFrontInterface} = undef;
    $self->{currentLocation} = undef;
    $self->{currentHomeLocation} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $storeName = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        if (defined($storeName)) {
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
            $self->{currentLocation} = 'org::allbinary::logic::string::regex::replace::Replace'->new('org::allbinary::string::CommonSeps'->getInstance()->{SPACE}, "%20")->all($self->{storeFrontInterface}->getCurrentHostName() + $self->{storeFrontInterface}->getCurrentHostNamePath());
            $self->{currentHomeLocation} = 'org::allbinary::logic::string::regex::replace::Replace'->new('org::allbinary::string::CommonSeps'->getInstance()->{SPACE}, "%20")->all($self->{storeFrontInterface}->getCurrentHomeHostName() + $self->{storeFrontInterface}->getCurrentHomeHostNamePath());
        } else {
            my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFront'->new();
            $self->{currentLocation} = $stringUtil->{EMPTY_STRING};
            $self->{currentHomeLocation} = $stringUtil->{EMPTY_STRING};
        }
    return $self;
}


sub getCurrentLocation {
    my ($self) = @_;
        return $self->{currentLocation};
}


sub getCurrentHomeLocation {
    my ($self) = @_;
        return $self->{currentHomeLocation};
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFront;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::string::CommonSeps;
use admin::taghelpers::TagHelper;

1;

