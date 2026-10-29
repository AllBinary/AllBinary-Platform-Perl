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

package admin::tags::BasicGroupItemsTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{propertiesHashMap} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::BasicGroupItemsHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::BasicGroupItemsRequestHelperFactory'->new());
    return $self;
}

use java::util::HashMap;
use admin::taghelpers::BasicGroupItemsHelperFactory;
use admin::taghelpers::BasicGroupItemsRequestHelperFactory;
use admin::tags::TableTag;

1;

